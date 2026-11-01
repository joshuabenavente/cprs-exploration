/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_hdrOrdersSectionClick(int param_1,undefined4 param_2,int param_3)

{
  int iVar1;
  int iStack_10;
  
  _DAT_0125a9ec = 0;
  iStack_10 = 1;
  do {
    iVar1 = func_0x0066bfe0(*(undefined4 *)(*(int *)(param_1 + 0x534) + 0x2c8),iStack_10);
    if (iVar1 == param_3) {
      _DAT_0125a9ec = iStack_10;
    }
    iStack_10 = iStack_10 + 1;
  } while (iStack_10 != 0xb);
  func_0x004d367c(_DAT_0125a9e0,&fOrders_CompareColVal);
  func_0x004d367c(_DAT_0125a9e0,&fOrders_CompareColVal);
  func_0x0117adbc(param_1,0);
  func_0x0118bfb0(param_1,param_1);
  return;
}

