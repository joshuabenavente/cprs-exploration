// Discover function entries referenced by serialized handlers, class tables and reviewed exports.
// Seed candidates remain provisional until Ghidra accepts an entry; record every conflict.
// @category ReverseEngineering
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;
import ghidra.program.model.symbol.SourceType;
import com.google.gson.*;
import java.nio.file.*;
import java.io.BufferedWriter;
import java.util.*;
public class SeedEvidenceFunctions extends GhidraScript {
    @Override public void run() throws Exception {
        if (!"7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544".equalsIgnoreCase(currentProgram.getExecutableSHA256()))
            throw new IllegalStateException("Wrong specimen");
        Path root=Path.of(getScriptArgs()[0]);int count=0,created=0,conflicts=0;
        Path inputPath=getScriptArgs().length>1?Path.of(getScriptArgs()[1]):root.resolve("batches/discovery-targets.jsonl");
        Path reportPath=getScriptArgs().length>2?Path.of(getScriptArgs()[2]):root.resolve("evidence/discovery-seeds.jsonl");
        try (BufferedWriter w=Files.newBufferedWriter(reportPath)) {
            for (String line:Files.readAllLines(inputPath)) {
                monitor.checkCancelled();JsonObject input=JsonParser.parseString(line).getAsJsonObject();
                String text=input.get("address").getAsString();var at=toAddr(text);
                Function function=getFunctionAt(at);String status="existing";
                try {
                    if (function==null) {
                        Function containing=getFunctionContaining(at);
                        if (containing!=null) {status="interior-boundary-conflict";conflicts++;}
                        else {disassemble(at);function=createFunction(at,input.get("name").getAsString());status=function==null?"not-created":"created";if(function!=null)created++;}
                    }
                    if(function!=null)function.setName(input.get("name").getAsString(),SourceType.USER_DEFINED);
                } catch (Exception e) {status="error:"+e.getClass().getSimpleName()+":"+e.getMessage();}
                input.addProperty("discovery_result",status);
                if(function!=null)input.addProperty("function_entry",function.getEntryPoint().toString());
                w.write(new Gson().toJson(input));w.newLine();
                if(++count%500==0) {w.flush();println("SEEDS processed="+count+" created="+created+" conflicts="+conflicts);}
            }
        }
        println("SEEDS complete="+count+" created="+created+" conflicts="+conflicts);
    }
}
