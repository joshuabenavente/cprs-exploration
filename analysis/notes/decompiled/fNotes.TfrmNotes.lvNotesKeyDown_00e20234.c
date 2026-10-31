/* Static Ghidra output. Delphi register ABI and types require review. */

void fNotes_TfrmNotes_lvNotesKeyDown(int param_1,undefined4 param_2,short *param_3)

{
  code *pcVar1;
  int iVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  puStack_18 = &UNK_00e202ca;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  pcVar1 = (code *)((int)register0x00000010 + -4);
  if (*param_3 == 0xd) {
    iVar2 = func_0x00682964(*(undefined4 *)(param_1 + 0x4d8));
    pcVar1 = UNRECOVERED_JUMPTABLE;
    if (iVar2 != 0) {
      iVar2 = func_0x00682964(*(undefined4 *)(param_1 + 0x4d8));
      iVar2 = (**(code **)(**(int **)(iVar2 + 8) + 0x14))();
      pcVar1 = UNRECOVERED_JUMPTABLE;
      if (0 < iVar2) {
        iVar2 = func_0x00682964(*(undefined4 *)(param_1 + 0x4d8));
        (**(code **)(**(int **)(iVar2 + 8) + 0xc))(*(int **)(iVar2 + 8),0,&uStack_8);
        iVar2 = func_0x0040c4b0(&UNK_00e202e4,uStack_8,1);
        pcVar1 = UNRECOVERED_JUMPTABLE;
        if (iVar2 == 1) {
          func_0x00e23618(param_1,*(undefined4 *)(param_1 + 0x4d8));
          pcVar1 = UNRECOVERED_JUMPTABLE;
        }
      }
    }
  }
  UNRECOVERED_JUMPTABLE = pcVar1;
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e202d1;
  puStack_18 = (undefined *)0xe202c7;
  func_0x0040afd4(&uStack_8,uStack_1c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00e202c8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

