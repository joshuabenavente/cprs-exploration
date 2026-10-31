/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_ClearListView
               (int param_1,int param_2)

{
  code *pcVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  
  if (*(int *)(param_1 + 0x368) == 0) {
    UNRECOVERED_JUMPTABLE = (code *)0xbd35eb;
    iVar2 = func_0x00a01f1c(param_1);
    *(int *)(param_1 + 0x368) = iVar2;
    if (iVar2 != 0) {
      UNRECOVERED_JUMPTABLE = (code *)0xbd3603;
      uVar3 = func_0x00a02048(_U508Extensions__Tlv508Manager,1);
      *(undefined4 *)(param_1 + 0x36c) = uVar3;
      UNRECOVERED_JUMPTABLE = (code *)0xbd361e;
      func_0x009fc628(*(undefined4 *)(param_1 + 0x368),*(undefined4 *)(param_1 + 0x34c),uVar3);
      UNRECOVERED_JUMPTABLE = (code *)0xbd3631;
      func_0x009fc648(*(undefined4 *)(param_1 + 0x368),*(undefined4 *)(param_1 + 0x34c),0);
    }
  }
  UNRECOVERED_JUMPTABLE = (code *)0xbd363f;
  func_0x0067d074(*(undefined4 *)(param_2 + 0x2f4));
  puStack_18 = &UNK_00bd3679;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x0067cfe0(*(undefined4 *)(param_2 + 0x2f4));
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bd3680;
  puStack_18 = (undefined *)0xbd3676;
  func_0x0067d264(*(undefined4 *)(param_2 + 0x2f4),uStack_1c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00bd3677. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

