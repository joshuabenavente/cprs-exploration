/* Static Ghidra output. Delphi register ABI and types require review. */

void fOrders_TfrmOrders_mnuViewActiveClick(int param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined *puVar4;
  
  uVar1 = func_0x0066bfe0(*(undefined4 *)(*(int *)(param_1 + 0x534) + 0x2c8),10,param_3,param_2);
  func_0x0066bd3c(uVar1,0);
  func_0x0117d7c4(param_1);
  puVar4 = &UNK_0117be34;
  uVar3 = 0;
  uVar2 = 0;
  uVar1 = func_0x011de93c();
  fOrders_TfrmOrders_SetOrderView(param_1,2,uVar1,uVar2,uVar3,puVar4);
  return;
}

