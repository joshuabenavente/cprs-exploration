// Export an inventory without changing the program or executing its code.
// Usage: ExportProgramInventory.java OUTPUT_DIRECTORY [EXPECTED_SHA256]
// @category ReverseEngineering
import ghidra.app.util.headless.HeadlessScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.program.model.symbol.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.io.BufferedWriter;
import java.util.*;

public class ExportProgramInventory extends HeadlessScript {
    private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
    private Map<String,Object> row(Object... pairs) {
        Map<String,Object> r = new LinkedHashMap<>();
        for (int i=0; i<pairs.length; i+=2) r.put((String)pairs[i], pairs[i+1]);
        return r;
    }
    private void emit(BufferedWriter w, Object r) throws Exception {
        w.write(gson.toJson(r)); w.newLine();
    }
    private BufferedWriter writer(Path p) throws Exception {
        return Files.newBufferedWriter(p, StandardCharsets.UTF_8);
    }
    @Override public void run() throws Exception {
        String[] args = getScriptArgs();
        if (currentProgram == null || args.length < 1)
            throw new IllegalArgumentException("Open a program and specify an output directory");
        String sha = currentProgram.getExecutableSHA256();
        if (args.length > 1 && !args[1].equalsIgnoreCase(sha))
            throw new IllegalStateException("Program SHA256 does not match expected target");
        Path out = Path.of(args[0]); Files.createDirectories(out);
        int internal=0, external=0, callCount=0, symbolCount=0, stringCount=0;
        Set<String> emitted = new HashSet<>();
        try (BufferedWriter funcs=writer(out.resolve("functions.jsonl"));
             BufferedWriter calls=writer(out.resolve("calls.jsonl"));
             BufferedWriter refs=writer(out.resolve("entry-xrefs.jsonl"));
             BufferedWriter allRefs=writer(out.resolve("instruction-xrefs.jsonl"))) {
            FunctionIterator[] iterators = new FunctionIterator[] {
                currentProgram.getFunctionManager().getFunctions(true),
                currentProgram.getFunctionManager().getExternalFunctions()
            };
            for (FunctionIterator it : iterators) while (it.hasNext()) {
                monitor.checkCancelled(); Function f=it.next();
                String at=f.getEntryPoint().toString();
                if (!emitted.add(at)) continue;
                if (f.isExternal()) external++; else internal++;
                List<Object> parameters=new ArrayList<>();
                for (Parameter p : f.getParameters()) parameters.add(row(
                    "name",p.getName(),"type",p.getDataType().getPathName(),
                    "storage",p.getVariableStorage().toString(),"source",p.getSource().toString()));
                Function thunk=f.isThunk() ? f.getThunkedFunction(false) : null;
                emit(funcs,row("address",at,"name",f.getName(true),
                    "name_source",f.getSymbol().getSource().toString(),
                    "external",f.isExternal(),"thunk",f.isThunk(),
                    "thunk_target",thunk==null?null:thunk.getEntryPoint().toString(),
                    "signature",f.getPrototypeString(true,true),
                    "signature_source",f.getSignatureSource().toString(),
                    "calling_convention",f.getCallingConventionName(),
                    "parameters",parameters,"body_min",f.getBody().isEmpty()?null:f.getBody().getMinAddress().toString(),
                    "body_max",f.getBody().isEmpty()?null:f.getBody().getMaxAddress().toString(),
                    "body_address_count",f.getBody().getNumAddresses(),
                    "status","unresolved","subsystem",null,
                    "uncertainties",List.of("Inventory only; behavior and types require verification")));
                ReferenceIterator incoming=currentProgram.getReferenceManager().getReferencesTo(f.getEntryPoint());
                while (incoming.hasNext()) {
                    Reference r=incoming.next();
                    emit(refs,row("function",at,"from",r.getFromAddress().toString(),
                        "to",r.getToAddress().toString(),"type",r.getReferenceType().toString(),
                        "operand",r.getOperandIndex()));
                }
                if (f.isExternal()) continue;
                InstructionIterator instructions=currentProgram.getListing().getInstructions(f.getBody(),true);
                while (instructions.hasNext()) {
                    monitor.checkCancelled(); Instruction ins=instructions.next();
                    for (Reference r : ins.getReferencesFrom())
                        emit(allRefs,row("function",at,"from",ins.getAddress().toString(),
                            "to",r.getToAddress().toString(),"type",r.getReferenceType().toString(),
                            "operand",r.getOperandIndex()));
                    if (!ins.getFlowType().isCall()) continue;
                    List<Object> targets=new ArrayList<>();
                    for (Reference r : ins.getReferencesFrom()) if (r.getReferenceType().isCall())
                        targets.add(row("address",r.getToAddress().toString(),
                            "reference_type",r.getReferenceType().toString()));
                    emit(calls,row("caller",at,"call_site",ins.getAddress().toString(),
                        "instruction",ins.toString(),"targets",targets,
                        "resolved",!targets.isEmpty())); callCount++;
                }
            }
        }
        try (BufferedWriter w=writer(out.resolve("symbols.jsonl"))) {
            SymbolIterator it=currentProgram.getSymbolTable().getAllSymbols(true);
            while (it.hasNext()) {
                monitor.checkCancelled(); Symbol s=it.next();
                emit(w,row("address",s.getAddress().toString(),"name",s.getName(true),
                    "type",s.getSymbolType().toString(),"source",s.getSource().toString(),
                    "primary",s.isPrimary())); symbolCount++;
            }
        }
        try (BufferedWriter w=writer(out.resolve("defined-strings.jsonl"))) {
            DataIterator it=currentProgram.getListing().getDefinedData(true);
            while (it.hasNext()) {
                monitor.checkCancelled(); Data d=it.next();
                if (!d.hasStringValue()) continue;
                emit(w,row("address",d.getAddress().toString(),"type",d.getDataType().getPathName(),
                    "length_bytes",d.getLength(),"value",String.valueOf(d.getValue()))); stringCount++;
            }
        }
        List<Object> blocks=new ArrayList<>();
        for (MemoryBlock b:currentProgram.getMemory().getBlocks()) blocks.add(row(
            "name",b.getName(),"start",b.getStart().toString(),"end",b.getEnd().toString(),
            "size",b.getSize(),"read",b.isRead(),"write",b.isWrite(),
            "execute",b.isExecute(),"initialized",b.isInitialized()));
        Map<String,Object> metadata=row("schema_version",1,"name",currentProgram.getName(),
            "executable_path",currentProgram.getExecutablePath(),"sha256",sha,
            "language",currentProgram.getLanguageID().toString(),
            "compiler",currentProgram.getCompilerSpec().getCompilerSpecID().toString(),
            "image_base",currentProgram.getImageBase().toString(),
            "format",currentProgram.getExecutableFormat(),"memory_blocks",blocks,
            "automatic_analysis_enabled",isHeadlessAnalysisEnabled(),
            "analysis_timeout",analysisTimeoutOccurred(),
            "internal_functions",internal,"external_functions",external,
            "manager_function_count",currentProgram.getFunctionManager().getFunctionCount(),
            "call_sites",callCount,"symbols",symbolCount,"defined_strings",stringCount,
            "limits",List.of("Only functions currently discovered by Ghidra are enumerated",
                "Calls cover defined instructions within inventoried function bodies",
                "Entry xrefs exclude references to function interiors",
                "Defined strings exclude undiscovered strings and composite data components",
                "Names, signatures and decompilation are not verified behavior"));
        Files.writeString(out.resolve("program.json"),gson.toJson(metadata),StandardCharsets.UTF_8);
        println("INVENTORY internal="+internal+" external="+external+" calls="+callCount);
    }
}
