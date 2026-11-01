/* Static Ghidra output. Delphi register ABI and types require review. */

void fNotes_TfrmNotes_ClearTVNotes(int param_1)

{
  int iVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_14;
  undefined *puStack_10;
  undefined1 *puStack_c;
  undefined4 uStack_8;
  
  puStack_c = (undefined1 *)((int)register0x00000010 + -4);
  iVar1 = *(int *)(param_1 + 0x4cc);
  *(undefined4 *)(iVar1 + 0x398) = 0;
  *(undefined4 *)(iVar1 + 0x39c) = 0;
  puStack_10 = &UNK_00e14f35;
  uStack_14 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_14;
  uStack_8 = param_1;
  func_0x00a12110();
  func_0x0066f6f4(*(undefined4 *)(*(int *)(uStack_8 + 0x4cc) + 0x330));
  *in_FS_OFFSET = uStack_14;
  iVar1 = *(int *)(uStack_8 + 0x4cc);
  *(int *)(iVar1 + 0x39c) = uStack_8;
  *(code **)(iVar1 + 0x398) = fNotes_TfrmNotes_tvNotesChange;
  return;
}

