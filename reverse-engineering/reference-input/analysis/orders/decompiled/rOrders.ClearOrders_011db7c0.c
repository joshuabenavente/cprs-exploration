/* Static Ghidra output. Delphi register ABI and types require review. */

void rOrders_ClearOrders(int *param_1)

{
  undefined4 uVar1;
  int iStack_10;
  int iStack_c;
  
  iStack_10 = param_1[2];
  if (-1 < iStack_10 + -1) {
    iStack_c = 0;
    do {
      uVar1 = func_0x004d2ff0(param_1,iStack_c);
      func_0x004090bc(uVar1);
      iStack_c = iStack_c + 1;
      iStack_10 = iStack_10 + -1;
    } while (iStack_10 != 0);
  }
  (**(code **)(*param_1 + 8))();
  return;
}

