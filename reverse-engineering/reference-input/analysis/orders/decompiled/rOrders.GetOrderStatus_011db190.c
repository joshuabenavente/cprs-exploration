/* Static Ghidra output. Delphi register ABI and types require review. */

void rOrders_GetOrderStatus(undefined4 param_1)

{
  char cVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar2;
  undefined4 uStack_20;
  undefined *puStack_1c;
  undefined1 *puStack_18;
  undefined4 uStack_14;
  undefined1 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_18 = (undefined1 *)0x11db1a1;
  uStack_8 = param_1;
  func_0x0040b0c8(param_1);
  puStack_1c = &UNK_011db1f1;
  uStack_20 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_20;
  uVar2 = 0;
  uStack_14 = uStack_8;
  uStack_10 = 0x11;
  puStack_18 = (undefined1 *)((int)register0x00000010 + -4);
  cVar1 = ORNet_CallVistA(&UNK_011db20c,&uStack_14,0,0,0);
  if (cVar1 == '\0') {
    uStack_c = 0;
  }
  *in_FS_OFFSET = uVar2;
  func_0x0040afd4(&uStack_8,uVar2,&uStack_c);
                    /* WARNING: Could not recover jumptable at 0x011db1ef. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)&UNK_011db1f8)(&UNK_011db1f8);
  return;
}

