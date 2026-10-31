/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fPtSel_TfrmPtSel_cmdCancelClick(int param_1)

{
  char cVar1;
  int iVar2;
  
  if ((((*_DAT_0124f2e0 == 0) || (*(int *)(*_DAT_0124f2e0 + 4) == 0)) &&
      (cVar1 = func_0x009d619c(), cVar1 != '\0')) &&
     (iVar2 = func_0x009b44a8(&UNK_00e835b8,&UNK_00e83590,0x24), iVar2 != 6)) {
    return;
  }
  *(undefined1 *)(param_1 + 0x52c) = 1;
  *(undefined1 *)(param_1 + 0x52e) = 1;
  func_0x00727128(param_1);
  return;
}

