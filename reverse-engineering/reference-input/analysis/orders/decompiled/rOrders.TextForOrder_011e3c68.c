/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_TextForOrder(undefined4 param_1,undefined4 param_2)

{
  code *pcVar1;
  char cVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_20;
  undefined1 *puStack_1c;
  undefined4 uStack_18;
  undefined1 uStack_14;
  int *piStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_1c = (undefined1 *)0x11e3c80;
  uStack_c = param_2;
  uStack_8 = param_1;
  piStack_10 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_20 = &UNK_011e3cd7;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  uVar3 = 0;
  uStack_18 = uStack_8;
  uStack_14 = 0x11;
  puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  cVar2 = ORNet_CallVistA(&UNK_011e3cf0,&uStack_18,0,0,piStack_10);
  if (cVar2 != '\0') {
    (**(code **)(*piStack_10 + 0x1c))(piStack_10,uStack_c);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar3;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011e3cde;
  func_0x004090bc(piStack_10,uVar3,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011e3cd5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

