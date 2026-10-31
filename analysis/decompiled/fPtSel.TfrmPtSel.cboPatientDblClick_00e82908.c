/* Static Ghidra output. Delphi register ABI and types require review. */

void fPtSel_TfrmPtSel_cboPatientDblClick(int param_1)

{
  code *pcVar1;
  int iVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_28;
  undefined *puStack_24;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  uStack_c = 0;
  uStack_10 = 0;
  uStack_14 = 0;
  uStack_18 = 0;
  puStack_24 = &UNK_00e82973;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  func_0x007b3b04(*(undefined4 *)(param_1 + 0x480),&uStack_18);
  func_0x0044973c(&uStack_8,&uStack_18);
  iVar2 = 0;
  if (uStack_8 != 0) {
    iVar2 = *(int *)(uStack_8 + -4);
  }
  if (0 < iVar2) {
    fPtSel_TfrmPtSel_cmdOKClick(param_1,param_1);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e8297a;
  puStack_24 = (undefined *)0xe82968;
  func_0x00443770(&uStack_18,uStack_28,pcVar1);
  puStack_24 = (undefined *)0xe82970;
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00e82971. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

