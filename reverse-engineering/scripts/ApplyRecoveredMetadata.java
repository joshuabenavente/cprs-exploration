// Apply byte-verified partial data layouts and exact MAP names in this local project.
// Usage: ApplyRecoveredMetadata.java /workspace/reverse-engineering
// @category ReverseEngineering
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.SourceType;
import ghidra.program.model.data.*;
import com.google.gson.*;
import java.nio.file.*;
import java.util.*;

public class ApplyRecoveredMetadata extends GhidraScript {
    @Override public void run() throws Exception {
        if (!"7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544".equalsIgnoreCase(currentProgram.getExecutableSHA256()))
            throw new IllegalStateException("Wrong specimen");
        Path root=Path.of(getScriptArgs()[0]); List<Object> changes=new ArrayList<>();
        CategoryPath category=new CategoryPath("/RecoveredCPRS");
        StructureDataType header=new StructureDataType(category,"DelphiManagedStringHeader",0);
        header.add(UnsignedShortDataType.dataType,"code_page","Validated literal code-page word");
        header.add(UnsignedShortDataType.dataType,"element_width","One or two bytes per character");
        header.add(IntegerDataType.dataType,"reference_count","Static literals use -1");
        header.add(IntegerDataType.dataType,"length_elements","Excludes zero terminator");
        StructureDataType prefix=new StructureDataType(category,"PartialDelphiClassMetadataPrefix",0);
        prefix.add(DWordDataType.dataType,"self_vmt_va","Points to this metadata address plus 0x58");
        for (int off=4;off<0x20;off+=4)
            prefix.add(DWordDataType.dataType,String.format("unresolved_%02x",off),"Role not established by this analysis");
        prefix.add(DWordDataType.dataType,"class_name_va","Pointer to byte-counted class-name string");
        prefix.add(DWordDataType.dataType,"instance_size_bytes","Class instance extent; individual fields unresolved");
        prefix.add(DWordDataType.dataType,"parent_reference_va","Pointer to parent self-pointer metadata");
        DataType actualHeader=currentProgram.getDataTypeManager().addDataType(header,DataTypeConflictHandler.DEFAULT_HANDLER);
        DataType actualPrefix=currentProgram.getDataTypeManager().addDataType(prefix,DataTypeConflictHandler.DEFAULT_HANDLER);
        for (String line:Files.readAllLines(root.resolve("evidence/static/classes.jsonl"))) {
            monitor.checkCancelled(); JsonObject c=JsonParser.parseString(line).getAsJsonObject();
            String at=c.get("metadata_address").getAsString();
            Map<String,Object> rec=new LinkedHashMap<>();rec.put("kind","partial_class_layout");rec.put("address",at);
            long expected=Long.parseUnsignedLong(c.get("vmt_base").getAsString(),16);
            if (Integer.toUnsignedLong(getInt(toAddr(at)))!=expected)throw new IllegalStateException("Class bytes changed");
            try {createData(toAddr(at),actualPrefix);rec.put("result","applied");}
            catch (Exception e) {rec.put("result","preserved_existing_listing");rec.put("reason",e.getMessage());}
            changes.add(rec);
        }
        int appliedLiterals=0;
        for (String line:Files.readAllLines(root.resolve("evidence/static/managed-literals.jsonl"))) {
            JsonObject s=JsonParser.parseString(line).getAsJsonObject();
            if (!s.get("rpc_name_candidate").getAsBoolean() || appliedLiterals>=32) continue;
            String at=s.get("header_address").getAsString();
            if (getInt(toAddr(at).add(4))!=-1 || getInt(toAddr(at).add(8))!=s.get("length").getAsInt())
                throw new IllegalStateException("Literal bytes changed");
            Map<String,Object> rec=new LinkedHashMap<>();rec.put("kind","managed_literal_header");rec.put("address",at);
            try {createData(toAddr(at),actualHeader);rec.put("result","applied");appliedLiterals++;}
            catch (Exception e) {rec.put("result","preserved_existing_listing");rec.put("reason",e.getMessage());}
            changes.add(rec);
        }
        for (String line:Files.readAllLines(root.resolve("batches/review-targets.tsv"))) {
            if (line.startsWith("address\t") || line.isBlank())continue;
            monitor.checkCancelled();String[] cols=line.split("\t");
            var address=toAddr(cols[0]); Function f=getFunctionAt(address);
            Map<String,Object> rec=new LinkedHashMap<>();rec.put("kind","map_function_name");rec.put("address",cols[0]);rec.put("requested_name",cols[1]);
            if (f==null && getFunctionContaining(address)==null) {disassemble(address);f=createFunction(address,cols[1]);}
            if (f!=null) {
                rec.put("previous_name",f.getName());f.setName(cols[1],SourceType.USER_DEFINED);rec.put("result","applied");
            } else rec.put("result","entry_boundary_unresolved");
            changes.add(rec);
        }
        Path dest=root.resolve("evidence/metadata-changes.json");
        Files.writeString(dest,new GsonBuilder().setPrettyPrinting().create().toJson(changes));
        println("RECOVERED_METADATA records="+changes.size());
    }
}
