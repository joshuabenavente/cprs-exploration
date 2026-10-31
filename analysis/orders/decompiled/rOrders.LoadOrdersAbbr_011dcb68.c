/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_LoadOrdersAbbr
               (undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  code *pcVar1;
  undefined4 uVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_50;
  undefined *puStack_4c;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined *puStack_38;
  undefined1 *puStack_34;
  undefined4 uStack_30;
  undefined *puStack_2c;
  undefined1 *puStack_28;
  undefined4 uStack_24;
  undefined1 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_28 = (undefined1 *)0x11dcb7f;
  uStack_1c = param_3;
  uStack_c = param_2;
  uStack_8 = param_1;
  func_0x0040b0c8(param_3);
  puStack_28 = (undefined1 *)0x11dcb87;
  func_0x0040b0c8(param_4);
  puStack_2c = &UNK_011dcc7e;
  uStack_30 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_30;
  puStack_28 = (undefined1 *)((int)register0x00000010 + -4);
  if (_DAT_0125aacc == 0) {
    puStack_34 = (undefined1 *)0x11dcba3;
    puStack_28 = (undefined1 *)((int)register0x00000010 + -4);
    func_0x011dad28();
  }
  puStack_34 = (undefined1 *)0x11dcbaf;
  uStack_40 = func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_38 = &UNK_011dcc57;
  uStack_3c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_3c;
  uStack_44 = 0;
  uStack_24 = param_4;
  uStack_20 = 0x11;
  UNRECOVERED_JUMPTABLE = (code *)0x11dcbdf;
  puStack_34 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_10 = uStack_40;
  ORNet_CallVistA(&UNK_011dcc98,&uStack_24,0);
  UNRECOVERED_JUMPTABLE = (code *)0x11dcbeb;
  uStack_14 = func_0x0040908c(_System_Classes__TList,1);
  puStack_4c = &UNK_011dcc38;
  uStack_50 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_50;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x011dbf3c(uStack_14,uStack_c,uStack_10);
  func_0x011dc258(uStack_14,uStack_8);
  uVar2 = uStack_14;
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_50;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011dcc3f;
  uStack_18 = uStack_14;
  uStack_14 = 0;
  puStack_4c = (undefined *)0x11dcc35;
  func_0x004090bc(uVar2,uStack_50,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011dcc36. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

