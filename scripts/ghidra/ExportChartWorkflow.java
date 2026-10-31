// Export focused decompilations and direct calls, preserving unresolved Delphi ABI limits.
// @category CPRS
import ghidra.app.util.headless.HeadlessScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.InstructionIterator;
import ghidra.program.model.address.Address;
import ghidra.program.model.address.AddressSet;
import ghidra.program.model.symbol.*;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class ExportChartWorkflow extends HeadlessScript {
    @Override public void run() throws Exception {
        if (!currentProgram.getExecutableSHA256().equalsIgnoreCase(
            "7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544")) {
            throw new IllegalStateException("Workflow export is pinned to the inventoried Chart binary");
        }
        Path output = Path.of(getScriptArgs()[0]);
        Files.createDirectories(output);
        DecompInterface decomp = new DecompInterface();
        decomp.openProgram(currentProgram);
        List<String> calls = new ArrayList<>();
        List<String> results = new ArrayList<>();
        calls.add("caller\tcaller_address\tcall_site\tcallee\tcallee_address");
        results.add("function\taddress\tstatus\tfile");
        Set<String> wanted = getScriptArgs().length > 1
            ? new HashSet<>(Files.readAllLines(Path.of(getScriptArgs()[1]))) : ImportChartMap.TARGETS;
        SymbolIterator symbols = currentProgram.getSymbolTable().getAllSymbols(true);
        Set<String> emitted = new HashSet<>();
        Set<String> found = new HashSet<>();
        while (symbols.hasNext()) {
            monitor.checkCancelled();
            Symbol symbol = symbols.next();
            String name = symbol.getName();
            if (!wanted.contains(name) || !emitted.add(name + "@" + symbol.getAddress())) continue;
            found.add(name);
            Function function = getFunctionAt(symbol.getAddress());
            if (function == null) {
                disassemble(symbol.getAddress());
                function = createFunction(symbol.getAddress(), name);
            }
            if (function == null) {
                results.add(name + "\t" + symbol.getAddress() + "\tno_function\t");
                continue;
            }
            function.setName(name, SourceType.USER_DEFINED);
            // This pinned handler resumes after a Delphi finally trampoline. Flow-following
            // alone stops at the trampoline and omits patient selection and chart setup.
            // The next MAP public begins at 00ff56a0; this span includes its literal pool.
            if (name.equals("fFrame.TfrmFrame.mnuFileOpenClick")) {
                disassemble(toAddr(0x00ff4e2eL));
                function.setBody(new AddressSet(function.getEntryPoint(), toAddr(0x00ff569fL)));
            }
            // ActiveMeds has nested Delphi finally trampolines which normal flow
            // stops at. Keep the bounded MAP span (next public: 00bd615c),
            // including its literal pool, and explicitly decode continuations.
            if (name.equals("mCoverSheetDisplayPanel_CPRS_ActiveMeds.TfraCoverSheetDisplayPanel_CPRS_ActiveMeds.OnAddItems")) {
                for (long at : new long[] {0x00bd60c3L, 0x00bd60caL, 0x00bd60e7L,
                        0x00bd60eeL, 0x00bd6112L, 0x00bd6119L, 0x00bd613eL, 0x00bd6145L}) {
                    disassemble(toAddr(at));
                }
                function.setBody(new AddressSet(function.getEntryPoint(), toAddr(0x00bd615bL)));
            }
            String filename = name.replaceAll("[^A-Za-z0-9_.-]", "_") + "_" + symbol.getAddress() + ".c";
            DecompileResults result = decomp.decompileFunction(function, 60, monitor);
            String status = result.decompileCompleted() ? "decompiled" : "failed";
            String text = "/* Static Ghidra output. Delphi register ABI and types require review. */\n";
            text += result.decompileCompleted() ? result.getDecompiledFunction().getC() : result.getErrorMessage();
            Files.writeString(output.resolve(filename), text, StandardCharsets.UTF_8);
            results.add(name + "\t" + function.getEntryPoint() + "\t" + status + "\t" + filename);
            InstructionIterator instructions = currentProgram.getListing().getInstructions(function.getBody(), true);
            List<String> assembly = new ArrayList<>();
            assembly.add("; Static instruction listing. Function bodies and indirect exception flow require review.");
            while (instructions.hasNext()) {
                Instruction instruction = instructions.next();
                assembly.add(instruction.getAddress() + "  " + HexFormat.of().formatHex(instruction.getBytes())
                    + "  " + instruction.toString());
                if (!instruction.getFlowType().isCall()) continue;
                Address[] destinations = instruction.getFlows();
                if (destinations.length == 0) {
                    calls.add(name + "\t" + function.getEntryPoint() + "\t" + instruction.getAddress() + "\t<indirect>\t");
                }
                for (Address destination : destinations) {
                    Symbol callee = currentProgram.getSymbolTable().getPrimarySymbol(destination);
                    calls.add(name + "\t" + function.getEntryPoint() + "\t" + instruction.getAddress()
                        + "\t" + (callee == null ? "<unnamed>" : callee.getName()) + "\t" + destination);
                }
            }
            Files.write(output.resolve(filename.substring(0, filename.length() - 2) + ".asm"), assembly, StandardCharsets.UTF_8);
        }
        for (String name : wanted) {
            if (!found.contains(name)) results.add(name + "\t\tnot_in_map\t");
        }
        decomp.dispose();
        Files.write(output.resolve("workflow-functions.tsv"), results, StandardCharsets.UTF_8);
        Files.write(output.resolve("workflow-calls.tsv"), calls, StandardCharsets.UTF_8);
        Files.writeString(output.resolve("program.txt"), "name=" + currentProgram.getName()
            + "\nsha256=" + currentProgram.getExecutableSHA256() + "\nlanguage=" + currentProgram.getLanguageID()
            + "\ncompiler=" + currentProgram.getCompilerSpec().getCompilerSpecID()
            + "\nimage_base=" + currentProgram.getImageBase() + "\nfunctions="
            + currentProgram.getFunctionManager().getFunctionCount()
            + "\nautomatic_analysis=" + isHeadlessAnalysisEnabled()
            + "\nanalysis_timeout=" + analysisTimeoutOccurred() + "\n", StandardCharsets.UTF_8);
        println("CPRS_EXPORT functions=" + (results.size() - 1));
    }
}
