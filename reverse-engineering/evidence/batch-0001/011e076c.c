/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_SendReleaseOrders(int *param_1)

{
  code *pcVar1;
  char cVar2;
  undefined2 extraout_var;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_4c;
  undefined1 *puStack_48;
  undefined4 *puStack_44;
  undefined4 uStack_40;
  undefined *puStack_3c;
  undefined1 *puStack_38;
  int *piStack_34;
  undefined1 uStack_30;
  undefined4 uStack_2c;
  undefined1 uStack_28;
  undefined4 uStack_24;
  undefined1 uStack_20;
  undefined4 uStack_1c;
  int *piStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_38 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_1c = 0;
  uStack_c = 0;
  uStack_14 = 0;
  puStack_3c = &UNK_011e088d;
  uStack_40 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_40;
  puStack_44 = &uStack_14;
  puStack_48 = (undefined1 *)0x11e07a4;
  uStack_8 = param_1;
  func_0x011e6418(*(undefined4 *)(*_DAT_0124f2e0 + 4),&uStack_1c);
  puStack_48 = (undefined1 *)0x11e07b5;
  func_0x0079acec(uStack_1c,CONCAT22(extraout_var,0x5e),2);
  puStack_48 = (undefined1 *)0x11e07bf;
  uStack_10 = func_0x0042d238(uStack_14,0);
  puStack_48 = (undefined1 *)0x11e07d4;
  func_0x0042cfdc(*(undefined4 *)(*_DAT_0124e2a0 + 0x10),&uStack_c);
  puStack_48 = (undefined1 *)0x11e07e0;
  piStack_18 = (int *)func_0x004d81f4(System_Classes__TStringList.self_vmt_va,1);
  puStack_4c = &UNK_011e085e;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  uVar3 = 0;
  piStack_34 = uStack_8;
  uStack_30 = 7;
  uStack_2c = uStack_10;
  uStack_28 = 0;
  uStack_24 = uStack_c;
  uStack_20 = 0x11;
  puStack_48 = (undefined1 *)((int)register0x00000010 + -4);
  cVar2 = ORNet_CallVistA(&UNK_011e08a4,&piStack_34,2,0,piStack_18);
  if (cVar2 == '\0') {
    (**(code **)(*piStack_18 + 0x48))();
  }
  (**(code **)(*uStack_8 + 0x48))();
  func_0x009b3eb4(piStack_18,uStack_8);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar3;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011e0865;
  func_0x004090bc(piStack_18,uVar3,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011e085c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

