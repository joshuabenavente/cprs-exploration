// Import validated Delphi MAP symbols before Ghidra auto-analysis.
// @category CPRS
import ghidra.app.script.GhidraScript;
import ghidra.program.model.symbol.SourceType;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import java.nio.file.*;
import java.util.*;

public class ImportChartMap extends GhidraScript {
    public static final Set<String> TARGETS = Set.of(
        "fPtSel.SelectPatient", "fPtSel.ShowMatchingPatients", "fPtSel.TfrmPtSel.FormCreate", "fPtSel.TfrmPtSel.FormShow",
        "fPtSel.TfrmPtSel.cboPatientChange", "fPtSel.TfrmPtSel.cboPatientNeedData",
        "fPtSel.TfrmPtSel.cboPatientKeyPause", "fPtSel.TfrmPtSel.cboPatientDblClick",
        "fPtSel.TfrmPtSel.cmdOKClick", "fPtSel.TfrmPtSel.SelectPtByDFN",
        "fPtSel.TfrmPtSel.cmdCancelClick", "fPtSel.TfrmPtSel.FormCloseQuery",
        "fFrame.TfrmFrame.FormCreate", "fFrame.TfrmFrame.tabPageChange",
        "fFrame.TfrmFrame.SetupPatient", "fFrame.TfrmFrame.SetupPtInfoPanel",
        "fFrame.TfrmFrame.SetActiveTab", "fFrame.TfrmFrame.mnuFileOpenClick",
        "fFrame.TfrmFrame.AllowContextChangeAll",
        "rCore.ListPtTop", "rCore.ListPtByFullSSN", "rCore.ListPtByLast5", "rCore.GetPtIDInfo",
        "rCore.setSubSetOfPatients", "rCore.setRPLPtList", "rCore.ListPtByRPLLast5", "rCore.ListPtByRPLFullSSN",
        "rCore.SelectPatient", "rCore.CheckSensitiveRecordAccess",
        "uCore.AllowAccessToSensitivePatient", "uCore.TPatient.SetDFN",
        "ORNet.CallBroker", "ORNet.CallVistA", "Trpcb.TRPCBroker.Call");

    @Override public void run() throws Exception {
        if (!currentProgram.getExecutableSHA256().equalsIgnoreCase(
            "7e8800aeafc0ccff347d04d9a64b51bb64a04a6935131f06ce1e730392493544")) {
            throw new IllegalStateException("This MAP import is pinned to the inventoried Chart binary");
        }
        int imported = 0, failures = 0, functions = 0;
        for (String line : Files.readAllLines(Path.of(getScriptArgs()[0]))) {
            monitor.checkCancelled();
            if (line.startsWith("address\t")) continue;
            String[] parts = line.split("\t");
            Address at = toAddr(Long.parseUnsignedLong(parts[0], 16));
            if (!currentProgram.getMemory().contains(at)) continue;
            try {
                createLabel(at, parts[1], true, SourceType.USER_DEFINED);
                imported++;
                if (TARGETS.contains(parts[1])) {
                    disassemble(at);
                    Function f = getFunctionAt(at);
                    if (f == null) f = createFunction(at, parts[1]);
                    if (f != null) {
                        f.setName(parts[1], SourceType.USER_DEFINED);
                        functions++;
                    }
                }
            } catch (Exception e) {
                if (++failures <= 10) printerr(parts[1] + ": " + e.getMessage());
            }
        }
        println("CPRS_MAP imported=" + imported + " failures=" + failures + " seeded_functions=" + functions);
        if (failures > 0) throw new IllegalStateException("MAP import had failures; inspect log");
    }
}
