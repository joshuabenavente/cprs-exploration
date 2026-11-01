// Recover five proven Delphi finally continuations and define a result prefix.
// Bounds were verified with independent objdump listings and pushed continuation addresses.
// @category ReverseEngineering
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.AddressSet;
import ghidra.program.model.listing.Function;
import ghidra.program.model.data.*;
import com.google.gson.GsonBuilder;
import java.nio.file.*;
import java.util.*;
public class RepairReviewedFunctions extends GhidraScript {
    @Override public void run() throws Exception {
        if (!"7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544".equalsIgnoreCase(currentProgram.getExecutableSHA256()))
            throw new IllegalStateException("Wrong specimen");
        long[][] bounds={{0x00a0b3e0L,0x00a0b440L,0x00a0b447L,0x00a0b44dL},
            {0x00a0c6fcL,0x00a0c7b8L,0x00a0c7bfL,0x00a0c7c5L},
            {0x009af1ecL,0x009af234L,0x009af23bL,0x009af243L},
            {0x00862ab4L,0x00862b5eL,0x00862b65L,0x00862b6bL},
            {0x00862b6cL,0x00862c14L,0x00862c1bL,0x00862c20L}};
        List<Object> report=new ArrayList<>();
        for (long[] r:bounds) {
            Map<String,Object> rec=new LinkedHashMap<>();rec.put("entry",Long.toHexString(r[0]));
            rec.put("handler",Long.toHexString(r[1]));rec.put("continuation",Long.toHexString(r[2]));rec.put("last_byte",Long.toHexString(r[3]));
            Function f=getFunctionAt(toAddr(r[0]));
            if (f==null) {rec.put("status","missing_function");report.add(rec);continue;}
            try {
                if ((getByte(toAddr(r[3]))&255)!=0xc3)throw new IllegalStateException("Expected final RET");
                disassemble(toAddr(r[1]));disassemble(toAddr(r[2]));
                f.setBody(new AddressSet(toAddr(r[0]),toAddr(r[3])));rec.put("status","repaired");
            } catch(Exception e) {rec.put("status","unresolved_conflict");rec.put("reason",e.getMessage());}
            report.add(rec);
        }
        StructureDataType result=new StructureDataType(new CategoryPath("/RecoveredCPRS"),"TIUSignResultPrefix",0);
        result.add(BooleanDataType.dataType,"first_piece_equals_zero","SETZ at 00a0c76e stores this byte at result+0");
        result.add(new ArrayDataType(Undefined1DataType.dataType,3,1),"unresolved_alignment","No semantics assigned");
        result.add(new PointerDataType(UnsignedShortDataType.dataType,4),"second_piece_text","Managed string assigned at result+4, 00a0c78e");
        currentProgram.getDataTypeManager().addDataType(result,DataTypeConflictHandler.DEFAULT_HANDLER);
        Files.writeString(Path.of(getScriptArgs()[0]),new GsonBuilder().setPrettyPrinting().create().toJson(report));
        println("REPAIRED_FUNCTIONS records="+report.size());
    }
}
