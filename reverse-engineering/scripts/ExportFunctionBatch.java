// Export at most 32 exact function entries per invocation; no program mutations.
// Usage: ExportFunctionBatch.java OUTPUT_DIRECTORY ADDRESS_FILE EXPECTED_SHA256
// Address file: one Ghidra address per line, blank lines and # comments allowed.
// @category ReverseEngineering
import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.*;
import com.google.gson.Gson;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.io.BufferedWriter;
import java.util.*;

public class ExportFunctionBatch extends GhidraScript {
    @Override public void run() throws Exception {
        String[] args=getScriptArgs();
        if (currentProgram==null || args.length!=3)
            throw new IllegalArgumentException("Require output directory, address file and expected SHA256");
        if (!args[2].equalsIgnoreCase(currentProgram.getExecutableSHA256()))
            throw new IllegalStateException("Program SHA256 does not match expected target");
        List<String> addresses=new ArrayList<>();
        for (String line:Files.readAllLines(Path.of(args[1]))) {
            String s=line.trim(); if (!s.isEmpty() && !s.startsWith("#")) addresses.add(s);
        }
        if (addresses.size()>32 || addresses.size()!=new HashSet<>(addresses).size())
            throw new IllegalArgumentException("Use at most 32 unique function entries per batch");
        Path out=Path.of(args[0]); Files.createDirectories(out);
        DecompInterface decomp=new DecompInterface();
        try {
            if (!decomp.openProgram(currentProgram)) throw new IllegalStateException("Decompiler could not open program");
            for (String at:addresses) {
                monitor.checkCancelled(); Function f=getFunctionAt(toAddr(at));
                Map<String,Object> result=new LinkedHashMap<>();
                result.put("address",at); result.put("sha256",currentProgram.getExecutableSHA256());
                String stem=at.replaceAll("[^a-zA-Z0-9_-]","_");
                if (f==null || f.isExternal()) {
                    result.put("export_status",f==null?"not_function_entry":"external");
                } else {
                    result.put("name",f.getName(true));
                    DecompileResults d=decomp.decompileFunction(f,30,monitor);
                    result.put("export_status",d.decompileCompleted()?"decompiled":"failed");
                    result.put("error",d.getErrorMessage());
                    if (d.decompileCompleted()) Files.writeString(out.resolve(stem+".c"),
                        "/* Unverified decompiler output; inspect assembly and ABI. */\n"+
                        d.getDecompiledFunction().getC(),StandardCharsets.UTF_8);
                    try (BufferedWriter w=Files.newBufferedWriter(out.resolve(stem+".asm"),StandardCharsets.UTF_8)) {
                        InstructionIterator it=currentProgram.getListing().getInstructions(f.getBody(),true);
                        while (it.hasNext()) {
                            monitor.checkCancelled(); Instruction ins=it.next();
                            w.write(ins.getAddress()+"  "+HexFormat.of().formatHex(ins.getBytes())+"  "+ins); w.newLine();
                        }
                    }
                    // Export completion is separate from analytical review completion.
                    result.put("analysis_status","unresolved");
                    result.put("uncertainties",List.of("Export only; verify function boundaries, ABI, paths and semantics"));
                }
                Files.writeString(out.resolve(stem+".json"),new Gson().toJson(result),StandardCharsets.UTF_8);
            }
        } finally { decomp.dispose(); }
        println("BATCH exported_entries="+addresses.size());
    }
}
