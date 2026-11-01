/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CPRSChart_CPRSChart(void)

{
  int *piVar1;
  code *pcVar2;
  char cVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar5;
  undefined4 uStack_2c;
  undefined *puStack_28;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_1c;
  undefined4 auStack_18 [5];
  
  uStack_1c = 0;
  auStack_18[0] = 0;
  UNRECOVERED_JUMPTABLE = (code *)0x122404d;
  func_0x00413340(&UNK_012054e0);
  piVar1 = _DAT_0124f460;
  puStack_28 = &UNK_01224193;
  uStack_2c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_2c;
  UNRECOVERED_JUMPTABLE = (code *)(auStack_18 + 5);
  cVar3 = func_0x009b8440();
  if (cVar3 != '\0') {
    func_0x00df6cc4();
    func_0x009bd230(ORRedirect__TORRedirect.self_vmt_va);
    func_0x0072cb10(*piVar1);
    uVar5 = 1;
    *_DAT_0124f6fc = 0;
    func_0x009b82b0(&UNK_012241ac,auStack_18);
    func_0x0040c324(auStack_18[0],&UNK_012241c8);
    if (!(bool)uVar5) {
      iVar4 = fBase508Form_TfrmBase508Form_Create(fSplash__TfrmSplash.self_vmt_va,1,0);
      *_DAT_0124f6fc = iVar4;
      func_0x0072762c(*_DAT_0124f6fc);
      func_0x00602d00(*_DAT_0124f6fc);
    }
    func_0x0072c548(*piVar1,&UNK_012241dc);
    func_0x0040b3c4(*piVar1 + 100,&UNK_01224214);
    func_0x0072eafc(*piVar1,1);
    func_0x0072cb28(*piVar1,dShared__TdmodShared.self_vmt_va,_DAT_0124efd4);
    func_0x0072cb28(*piVar1,fFrame__TfrmFrame.self_vmt_va,_DAT_0124f7c4);
    func_0x006026ac(*_DAT_0124f7c4,&uStack_1c);
    func_0x0072c548(*piVar1,uStack_1c);
    func_0x0072cb28(*piVar1,fNoteSTStop__TfrmSearchStop.self_vmt_va,_DAT_0124f474);
    if (*_DAT_0124f6fc != 0) {
      func_0x004090bc(*_DAT_0124f6fc);
      *_DAT_0124f6fc = 0;
    }
    func_0x0072cc88(*piVar1);
  }
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_2c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0122419a;
  puStack_28 = (undefined *)0x1224188;
  func_0x0040afd4(&uStack_1c,uStack_2c,pcVar2);
  puStack_28 = (undefined *)0x1224190;
  func_0x0040afd4(auStack_18);
                    /* WARNING: Could not recover jumptable at 0x01224191. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

