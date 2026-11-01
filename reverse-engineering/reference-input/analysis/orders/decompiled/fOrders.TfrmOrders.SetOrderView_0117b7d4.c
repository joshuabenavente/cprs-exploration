/* Static Ghidra output. Delphi register ABI and types require review. */

void fOrders_TfrmOrders_SetOrderView
               (undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
               undefined1 param_5,undefined4 param_6)

{
  char cVar1;
  
  cVar1 = func_0x0117b678(param_1);
  if (cVar1 != '\0') {
    func_0x0117b878(param_1,param_2,param_3,param_4,param_5,param_6);
    fOrders_TfrmOrders_RefreshOrderList(param_1,1,0);
  }
  return;
}

