/* Static Ghidra output. Delphi register ABI and types require review. */

void fCoverSheet_TfrmCoverSheet_OnFocusFirstControl(int param_1,undefined4 param_2)

{
  code *pcVar1;
  char cVar2;
  undefined4 uVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = (int *)0x0;
  uStack_c = 0;
  puStack_18 = &UNK_00fd9373;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  pcVar1 = (code *)((int)register0x00000010 + -4);
  if (*(char *)(param_1 + 0x69) != '\0') {
    uVar3 = func_0x00410738(&uStack_8);
    func_0x00bf0108(&uStack_c);
    cVar2 = func_0x004397f8(uStack_c,&UNK_00fd9380,uVar3);
    pcVar1 = UNRECOVERED_JUMPTABLE;
    if (cVar2 != '\0') {
      (**(code **)(*uStack_8 + 0x10))(uStack_8,param_2);
      pcVar1 = UNRECOVERED_JUMPTABLE;
    }
  }
  UNRECOVERED_JUMPTABLE = pcVar1;
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00fd937a;
  puStack_18 = (undefined *)0xfd9368;
  func_0x00410738(&uStack_c,uStack_1c,pcVar1);
  puStack_18 = (undefined *)0xfd9370;
  func_0x00410738(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00fd9371. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

