// Disable speculative/expensive whole-program analyzers; retain basic discovery.
// @category ReverseEngineering
import ghidra.app.script.GhidraScript;
import com.google.gson.GsonBuilder;
import java.nio.file.*;
import java.util.*;
public class ConfigureBoundedAnalysis extends GhidraScript {
    @Override public void run() throws Exception {
        Map<String,String> options=getCurrentAnalysisOptionsAndValues(currentProgram);
        Map<String,String> changed=new TreeMap<>();
        for (String key:options.keySet()) {
            if (key.equals("Address Tables") || key.equals("Create Address Tables") ||
                key.endsWith(".Create Address Tables") || key.equals("Decompiler Switch Analysis") ||
                key.equals("Decompiler Parameter ID") || key.equals("Aggressive Instruction Finder") ||
                key.equals("Stack")) changed.put(key,"false");
        }
        setAnalysisOptions(currentProgram,changed);
        Map<String,Object> result=new LinkedHashMap<>();result.put("before",options);result.put("changed",changed);
        result.put("after",getCurrentAnalysisOptionsAndValues(currentProgram));
        Files.writeString(Path.of(getScriptArgs()[0]),new GsonBuilder().setPrettyPrinting().create().toJson(result));
        println("BOUNDED_ANALYSIS disabled="+changed.keySet());
    }
}
