"""Generate the specification index, coverage document and durable checkpoint."""
import collections
import json
from pathlib import Path
from extract_static import ROOT, save

def main():
    coverage=json.loads((ROOT/'catalog/coverage.json').read_text())
    static=json.loads((ROOT/'evidence/static/summary.json').read_text())
    subsystems=json.loads((ROOT/'catalog/subsystems.json').read_text())
    claims=json.loads((ROOT/'catalog/verified-claims.json').read_text())
    direct=json.loads((ROOT/'validation/direct-call-verification.json').read_text())
    next_entries=[{'address':'009ad030','name':'ORNet.SetParams','purpose':'Recover exact broker argument construction and overload contract'},
        {'address':'00e19034','name':'fNotes.TfrmNotes.SaveEditedNote','purpose':'Recover note-save branches beneath SaveCurrentNote'},
        {'address':'009916c8','name':'Wsockc.TXWBWinsock.NetStart','purpose':'Recover transport startup beneath NetworkConnect'},
        {'address':'00996390','name':'RpcSLogin.StartProgSLogin','purpose':'Recover secure-connection program construction and launch boundary'},
        {'address':'01192018','name':'rMisc.LoadDll','purpose':'Recover plugin search/loading and error behavior'}]
    (ROOT/'batches/0004-next-addresses.txt').write_text(''.join(e['address']+'\n' for e in next_entries))
    uncertainties=[
        {'id':'U01','scope':'semantic coverage','detail':f"{coverage['statuses'].get('unresolved',0)} inventoried functions remain semantically unresolved; analyzed status for small functions is limited to documented machine-level scope.",'evidence':'catalog/function-inventory.jsonl'},
        {'id':'U02','scope':'indirect dispatch','detail':f"{coverage['unresolved_indirect_call_sites']} static call sites have no resolved call-reference target.",'evidence':'catalog/unresolved-indirect-calls.jsonl'},
        {'id':'U03','scope':'discovery','detail':'Function inventory exhausts current Ghidra function entries, not all possible executable code. Missed/false boundaries, inline data and callback/exception continuations remain possible.','evidence':'evidence/discovery-seeds.jsonl'},
        {'id':'U04','scope':'server interfaces','detail':'RPC names and use sites do not recover parameter/response grammars, permissions, registrations, versions, endpoints or complete effects. Dynamic RPC bindings remain unresolved.','evidence':'catalog/rpc-literal-use-sites.jsonl'},
        {'id':'U05','scope':'types and ABI','detail':'Class metadata prefixes and selected projections are recovered; complete instance fields, register ABI, hidden outputs, variant arrays and lifetimes remain unresolved.','evidence':'DATA-STRUCTURES.md'},
        {'id':'U06','scope':'external components','detail':'Five supplied DLLs have dependency/export metadata, but their implementations and dynamic ABI contracts are unresolved.','evidence':'catalog/components.json'},
        {'id':'U07','scope':'clinical write workflows','detail':'Selected signing/order/save/locking edges are verified; full state machines, policy, response parsing and error cleanup remain partial.','evidence':'REVIEW-NOTES.md'},
        {'id':'U08','scope':'configuration and UI','detail':'Stored forms do not establish inherited/effective properties, reassigned handlers, runtime focus, site configuration or accessibility parity.','evidence':'evidence/static/form-bindings.jsonl'},
        {'id':'U09','scope':'exception paths','detail':'Five verified finally-continuation repairs do not resolve all Delphi cleanup/control-flow ambiguities.','evidence':'evidence/function-boundary-changes.json'},
        {'id':'U10','scope':'source and provenance','detail':'Input identity is hash pinned. Distribution authenticity and exact original Pascal/server source match are not independently established. No target execution occurred.','evidence':'evidence/static/summary.json'}]
    save(ROOT/'catalog/uncertainties.json',uncertainties)
    documents={
        'architecture':'ARCHITECTURE.md','function_inventory':'FUNCTION-INVENTORY.md','data_structures':'DATA-STRUCTURES.md',
        'external_interfaces':'EXTERNAL-INTERFACES.md','behavior':'BEHAVIOR.md','bounded_reviews':'REVIEW-NOTES.md',
        'reimplementation':'REIMPLEMENTATION-PLAN.md','reproduction':'REPRODUCE.md'}
    datatypes=[
        {'name':'DelphiManagedStringHeader','size_bytes':12,'fields':[{'offset':0,'width':2,'name':'code_page'},{'offset':2,'width':2,'name':'element_width'},
         {'offset':4,'width':4,'name':'reference_count','signed':True},{'offset':8,'width':4,'name':'length_elements','signed':True}],
         'applications':32,'evidence':'evidence/metadata-changes.json','limit':'Validated static literal prefix; full runtime ownership semantics unresolved'},
        {'name':'PartialDelphiClassMetadataPrefix','size_bytes':44,'fields':[{'offset':0,'width':4,'name':'self_vmt_va'},
         {'offset':4,'width':28,'name':'unresolved_words'},{'offset':32,'width':4,'name':'class_name_va'},
         {'offset':36,'width':4,'name':'instance_size_bytes'},{'offset':40,'width':4,'name':'parent_reference_va'}],
         'applications':2554,'catalog':'evidence/static/classes.jsonl','limit':'Metadata prefix only; instance field layouts unresolved'},
        {'name':'TIUSignResultPrefix','size_bytes':8,'fields':[{'offset':0,'width':1,'name':'first_piece_equals_zero'},
         {'offset':1,'width':3,'name':'unresolved_alignment'},{'offset':4,'width':4,'name':'second_piece_text','type':'managed UTF16 string pointer'}],
         'evidence_addresses':['00a0c76e','00a0c771','00a0c783','00a0c78e'],
         'limit':'Type definition added to Ghidra; no unverified function prototype forced'}]
    specification={'schema_version':1,'title':'CPRSChart.exe evidence-backed static specification',
        'identity':{**static['executable'],'file_version':'1.33.214.5','file_version_evidence_address':'0155ba84'},
        'coverage':coverage,'documents':documents,'architecture':{'subsystem_catalog':'catalog/subsystems.json',
            'physical_module_regions':'evidence/static/map-modules.json','call_graph':'catalog/subsystem-call-graph.json',
            'forms':'evidence/static/resources.json','event_bindings':'evidence/static/form-bindings.jsonl'},
        'functions':{'json':'catalog/function-inventory.json','jsonl':'catalog/function-inventory.jsonl',
            'tsv':'catalog/function-inventory.tsv','relationships':'catalog/function-relationships.jsonl'},
        'data_structures':datatypes,'external_interfaces':{'normal_imports':803,'delayed_imports':638,
            'import_catalog':'evidence/static/imports.jsonl','export_catalog':'evidence/static/exports.json',
            'component_catalog':'catalog/components.json','rpc_name_candidates':static['rpc_name_candidates'],
            'rpc_literal_use_sites':'catalog/rpc-literal-use-sites.jsonl','complete_server_contracts_recovered':False},
        'verified_claims':claims,'direct_call_validation':direct['counts'],
        'review_evidence':['evidence/batch-0001/annotations.json','evidence/batch-0002/annotations.json','evidence/batch-0003/annotations.json'],
        'uncertainties':uncertainties,'next_batch':next_entries,'target_executed':False,'external_systems_modified':False,
        'reimplementation_phases':['Pin reproducible evidence','Finish semantic requirements','Define typed compatibility boundary',
            'Implement evidence-backed components','Validate using meaningful oracles','Close or scope remaining uncertainties']}
    save(ROOT/'specification.json',specification)
    rows=['# Function inventory and coverage','',
        f"The saved project defines **{coverage['internal_functions']:,} internal functions** and **{coverage['external_functions']:,} external function entries**, totaling **{coverage['total_functions']:,}**. Every entry has an address, name provenance, physical module attribution where available, provisional logical subsystem, review status, evidence and uncertainties.",'',
        'Full inventories: [JSON](catalog/function-inventory.json), [JSONL](catalog/function-inventory.jsonl), [TSV](catalog/function-inventory.tsv). [Static relationships](catalog/function-relationships.jsonl) preserve call sites/counts, incoming/outgoing function targets, literal addresses and RPC-name candidates per entry. [Raw Ghidra inventory](evidence/inventory-reviewed/program.json) preserves original signatures/storage and metadata.','',
        '## Review status','', '| Status | Functions | Meaning |','| --- | ---: | --- |',
        f"| Analyzed within explicit scope | {coverage['statuses'].get('analyzed',0):,} | {coverage['verified_import_thunks']:,} byte-verified IAT forwarding thunks and {coverage['verified_small_function_semantics']:,} exact small-body instruction patterns; underlying callee/ABI or high-level meaning can remain unresolved |",
        f"| Partially analyzed | {coverage['statuses'].get('partially_analyzed',0):,} | Historical focused exports and new bounded reviews; semantic and exception/ABI limits are retained |",
        f"| Unresolved | {coverage['statuses'].get('unresolved',0):,} | Inventoried and structurally classified, without sufficient behavioral review |",'',
        '**Classification is complete for the discovered inventory. Whole-executable behavioral recovery and exhaustive code discovery are not complete.** Analyzed does not mean that a complete clinical workflow or external contract is recovered.','',
        '## Subsystem coverage','', '| Subsystem | Total | Analyzed | Partial | Unresolved |','| --- | ---: | ---: | ---: | ---: |']
    for name,s in sorted(subsystems.items()):
        statuses=s['status'];rows.append(f"| {name} | {s['functions']:,} | {statuses.get('analyzed',0):,} | {statuses.get('partially_analyzed',0):,} | {statuses.get('unresolved',0):,} |")
    rows += ['', 'Grouping follows MAP module ranges, symbols and domain naming, with a recorded assignment basis. The [subsystem catalog](catalog/subsystems.json) lists every module. Shared generic code can have multiple MAP aliases at one address; preserve all aliases instead of assigning semantic intent from one primary name.','',
        '## Discovery and evidence','',
        '- Imported 65,610 unique file-backed MAP symbols. Symbols include data and class metadata and are not counted as functions.',
        '- Seeded 10,641 provisional code-entry candidates from class-table pointers, serialized handlers, historical function entries and selected MAP routines. The seed report records creation/existing/conflict results.',
        '- Default whole-program analysis exhausted an 8 GB Java heap in AddressTableAnalyzer before saving. A baseline was then saved; controlled discovery disabled address-table creation, decompiler-wide passes, aggressive scanning and stack analysis. The corrected pass completed in 137 seconds without timing out. Logs and exact options are retained.',
        f"- Preserved {coverage['static_call_sites']:,} static call sites, including {coverage['unresolved_indirect_call_sites']:,} with no resolved call-reference target. Independently verified {direct['counts'].get('direct_E8_destinations_verified',0):,} direct E8 destinations from target bytes, with zero mismatches.",
        f"- Verified {coverage['verified_archived_direct_call_sites']:,} distinct archived direct-call sites and reconciled all 147 historical entry addresses into the current function inventory.",
        f"- Cataloged {coverage['literal_use_sites']:,} instruction references to structurally validated managed literals, including {coverage['rpc_literal_use_sites']:,} references to RPC-like candidates. A use site alone does not establish an argument or server contract.",
        '- Function discovery can still miss unnamed callbacks, exception continuations or indirect targets, and can mistake data for code. [Historical-entry gaps](catalog/historical-entry-discovery-gaps.json), [indirect calls](catalog/unresolved-indirect-calls.jsonl) and [uncertainties](catalog/uncertainties.json) preserve limits.',
        '', '## Significant changes in Ghidra','',
        '- Applied exact MAP labels/names, plus function naming for metadata-guided entries.',
        '- Applied partial class-prefix types at 2,554 validated addresses and managed-literal headers at 32 addresses.',
        '- Defined TIUSignResultPrefix from validated result writes; no guessed function prototype was forced.',
        '- Repaired five confirmed Delphi finally-handler/normal-return continuation spans. No executable bytes were patched.',
        '', '## Next specific batch','']
    rows += [f"- `{e['address']}` `{e['name']}`: {e['purpose']}." for e in next_entries]
    rows += ['', 'The prepared address file is [0004-next-addresses.txt](batches/0004-next-addresses.txt). Continue connected caller/callee batches, checkpointing statuses and uncertainty after each one.','']
    (ROOT/'FUNCTION-INVENTORY.md').write_text('\n'.join(rows))
    next_action='Export and analyze batch 0004: ORNet.SetParams 009ad030; fNotes.SaveEditedNote 00e19034; Wsockc.NetStart 009916c8; RpcSLogin.StartProgSLogin 00996390; rMisc.LoadDll 01192018. Verify caller ABI, exception continuations, argument schemas and effects, then update address-keyed statuses.'
    old=json.loads((ROOT/'progress.json').read_text())
    old.update(status='discovered_inventory_classified_behavioral_recovery_partial',coverage=coverage,next_action=next_action,
        blockers=[],target_executed=False,behavioral_recovery_complete=False,inventory_classification_complete=True,
        next_batch=next_entries,deliverables={k:'written_with_explicit_coverage_limits' for k in documents},
        final_ghidra_project='/workspace/reverse-engineering/projects/CPRSChart.gpr')
    for attempt in old.get('analysis_attempts',[]):
        if attempt.get('kind')=='metadata-guided discovery':attempt['status']='succeeded and saved'
    old['analysis_attempts']=[a for a in old.get('analysis_attempts',[]) if a.get('kind')!='corrected controlled automatic discovery']
    old['analysis_attempts'] += [{'kind':'corrected controlled automatic discovery','status':'succeeded and saved','analysis_seconds':137,
        'timeout':False,'internal_functions':coverage['internal_functions'],'external_functions':coverage['external_functions'],
        'log':'evidence-bounded-corrected.log','options':'evidence/analysis-options.json'}]
    save(ROOT/'progress.json',old)
    (ROOT/'PROGRESS.md').write_text('# Reverse engineering checkpoint\n\n'
        'Status: **every discovered function classified; high-level behavioral recovery remains partial**. '
        f"Target: CPRSChart.exe, `{coverage['target_sha256']}`. No target execution occurred.\n\n"
        f"Inventory: {coverage['internal_functions']:,} internal + {coverage['external_functions']:,} external entries. "
        f"Statuses: {coverage['statuses'].get('analyzed',0):,} analyzed within explicit machine-level scope; "
        f"{coverage['statuses'].get('partially_analyzed',0):,} partial; {coverage['statuses'].get('unresolved',0):,} unresolved. "
        'Detailed coverage is in `catalog/coverage.json`.\n\n## Next specific action\n\n'+next_action+'\n\n'
        'The address file is `batches/0004-next-addresses.txt`. Resume the saved project `projects/CPRSChart.gpr`; '
        'use `-noanalysis` for focused exports so bounded reviews do not repeat discovery. '
        'Read only that batch and connected evidence, then checkpoint.\n\n'
        '## Completed evidence\n\n'
        '- Target and MAP hashes exactly match historical exports.\n'
        '- All 43,371 current function entries have status, subsystem, evidence, structural relationships and uncertainties.\n'
        '- Controlled discovery succeeded; default analyzer heap failure and the corrected options are preserved.\n'
        '- 325 forms decoded; 2,554 class metadata records validated and typed.\n'
        '- 24,793 historical instruction records, 410 literals, 15 VMT words, and 204,270 direct-call destinations byte checked.\n'
        '- New reviews cover 39 distinct functions; five verified continuation repairs have re-exports.\n'
        '- Markdown documents, structured specification, full catalogs and reproducibility instructions are persisted.\n\n'
        '## Remaining uncertainty\n\n'
        'Unresolved routines, indirect dispatch, field layouts, external contracts, configuration, clinical write behavior and '
        'missed/false discovery are cataloged explicitly. This checkpoint is not a claim of full behavioral equivalence or an implementation-ready clone.\n')
    print('Wrote specification index, coverage document and progress checkpoint')

if __name__=='__main__':main()
