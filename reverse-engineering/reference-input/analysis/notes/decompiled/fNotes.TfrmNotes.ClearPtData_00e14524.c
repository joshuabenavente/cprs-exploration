/* Static Ghidra output. Delphi register ABI and types require review. */

void fNotes_TfrmNotes_ClearPtData(int param_1)

{
  code *pcVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)0xe14535;
  uStack_8 = param_1;
  func_0x012034d0(param_1);
  UNRECOVERED_JUMPTABLE = (code *)0xe1453d;
  func_0x00e14f58(uStack_8);
  DAT_0125a165 = 1;
  UNRECOVERED_JUMPTABLE = (code *)0xe14558;
  func_0x0066fcb4(*(undefined4 *)(*(int *)(uStack_8 + 0x4cc) + 0x330));
  puStack_18 = &UNK_00e14592;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x00e14ec4(uStack_8);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e14599;
  puStack_18 = (undefined *)0xe1458f;
  func_0x0066fd00(*(undefined4 *)(*(int *)(uStack_8 + 0x4cc) + 0x330),uStack_1c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00e14590. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

