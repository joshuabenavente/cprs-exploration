/* Static Ghidra output. Delphi register ABI and types require review. */

void fPtSel_TfrmPtSel_FormCloseQuery(int param_1)

{
  if (*(char *)(param_1 + 0x52e) == '\0') {
    *(undefined1 *)(param_1 + 0x52e) = 1;
    fPtSel_TfrmPtSel_cmdCancelClick();
  }
  return;
}

