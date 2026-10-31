/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 rOrders_getDetailOrder(undefined4 param_1,undefined4 param_2)

{
  undefined4 uVar1;
  undefined4 uStack_20;
  undefined1 uStack_1c;
  undefined4 uStack_18;
  undefined1 uStack_14;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_1c = 0x11;
  uStack_18 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  uStack_14 = 0x11;
  uStack_20 = param_1;
  uStack_c = param_2;
  uStack_8 = param_1;
  uVar1 = ORNet_CallVistA(&UNK_011dac04,&uStack_20,1,0,param_2);
  return uVar1;
}

