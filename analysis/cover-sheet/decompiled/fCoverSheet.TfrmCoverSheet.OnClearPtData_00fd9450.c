/* Static Ghidra output. Delphi register ABI and types require review. */

void fCoverSheet_TfrmCoverSheet_OnClearPtData(int param_1,undefined4 param_2)

{
  code *pcVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = (int *)0x0;
  puStack_18 = &UNK_00fd949b;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  func_0x00bf0108(&uStack_8);
  (**(code **)(*uStack_8 + 0x3c))(uStack_8,param_2);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *(undefined4 *)(param_1 + 0x488) = 0;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00fd94a2;
  puStack_18 = (undefined *)0xfd9498;
  func_0x00410738(&uStack_8,uStack_1c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00fd9499. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

