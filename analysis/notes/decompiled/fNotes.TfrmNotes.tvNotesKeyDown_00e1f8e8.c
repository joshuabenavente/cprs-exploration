/* Static Ghidra output. Delphi register ABI and types require review. */

void fNotes_TfrmNotes_tvNotesKeyDown(int param_1,undefined4 param_2,short *param_3)

{
  int iVar1;
  
  if (*param_3 == 0xd) {
    iVar1 = func_0x0067213c(*(undefined4 *)(param_1 + 0x4cc));
    if (iVar1 != 0) {
      iVar1 = func_0x0067213c(*(undefined4 *)(param_1 + 0x4cc));
      iVar1 = func_0x00437d28(&UNK_00e1f940,*(undefined4 *)(iVar1 + 8));
      if (0 < iVar1) {
        func_0x00e23618(param_1,0);
      }
    }
  }
  return;
}

