/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_ValidateOrderAction(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  bool bVar1;
  undefined1 uStack00000000;
  undefined4 uStack_34;
  undefined1 uStack_30;
  undefined4 uStack_2c;
  undefined1 uStack_28;
  undefined4 *puStack_24;
  undefined1 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  bVar1 = &uStack00000000 == (undefined1 *)0x34;
  uStack_10 = param_3;
  uStack_c = param_2;
  uStack_8 = param_1;
  func_0x0040c324(param_2,&UNK_011e1330);
  if (bVar1) {
    uStack_1c = *(undefined4 *)(*_DAT_0124f9dc + 8);
    uStack_18 = *(undefined4 *)(*_DAT_0124f9dc + 0xc);
  }
  else {
    uStack_1c = *(undefined4 *)(*_DAT_0124e2a0 + 0x20);
    uStack_18 = *(undefined4 *)(*_DAT_0124e2a0 + 0x24);
  }
  uStack_34 = uStack_8;
  uStack_30 = 0x11;
  uStack_2c = uStack_c;
  uStack_28 = 0x11;
  puStack_24 = &uStack_1c;
  uStack_20 = 0x10;
  ORNet_CallVistA(&UNK_011e1344,&uStack_34,2,0,0,uStack_10);
  return;
}

