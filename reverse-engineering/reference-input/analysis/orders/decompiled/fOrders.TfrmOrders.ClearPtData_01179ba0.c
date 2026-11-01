/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_ClearPtData(int param_1)

{
  func_0x012034d0(param_1);
  (**(code **)(**(int **)(param_1 + 0x538) + 0x178))();
  func_0x0117d800(param_1);
  func_0x011db7c0(_DAT_0125a9e0);
  if (_DAT_0125a9e4 != (int *)0x0) {
    (**(code **)(*_DAT_0125a9e4 + 8))();
  }
  if (_DAT_0125a9e8 != (int *)0x0) {
    (**(code **)(*_DAT_0125a9e8 + 8))();
  }
  func_0x00d2cff4();
  return;
}

