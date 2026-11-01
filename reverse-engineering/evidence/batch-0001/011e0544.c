/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_SendOrders(int *param_1,undefined4 param_2)

{
  code *pcVar1;
  char cVar2;
  int iVar3;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar4;
  undefined4 uVar5;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_6c;
  undefined1 *puStack_68;
  undefined4 uStack_64;
  undefined *puStack_60;
  undefined1 *puStack_5c;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined1 uStack_3c;
  int iStack_38;
  undefined1 uStack_34;
  undefined4 uStack_30;
  undefined1 uStack_2c;
  undefined4 uStack_28;
  undefined1 uStack_24;
  int *piStack_20;
  undefined1 uStack_1c;
  int iStack_18;
  int *piStack_14;
  int iStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_5c = (undefined1 *)((int)register0x00000010 + -4);
  uStack_50 = 0;
  uStack_54 = 0;
  uStack_48 = 0;
  uStack_4c = 0;
  uStack_44 = 0;
  puStack_60 = &UNK_011e06da;
  uStack_64 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_64;
  puStack_68 = (undefined1 *)0x11e057c;
  uStack_c = param_2;
  uStack_8 = param_1;
  piStack_14 = (int *)func_0x004d81f4(System_Classes__TStringList.self_vmt_va,1);
  puStack_6c = &UNK_011e06b6;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  uVar5 = 0;
  uStack_40 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  uStack_3c = 0x11;
  iStack_38 = *_DAT_0124e2a0 + 0x20;
  uStack_34 = 0x10;
  uStack_30 = *(undefined4 *)(*_DAT_0124e2a0 + 0x10);
  uStack_2c = 0;
  puStack_68 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x0040c18c(&uStack_44,&UNK_011e06f4,uStack_c,0,piStack_14);
  uStack_28 = uStack_44;
  uStack_24 = 0x11;
  piStack_20 = uStack_8;
  uStack_1c = 7;
  cVar2 = ORNet_CallVistA(&UNK_011e0704,&uStack_40,4);
  if (cVar2 == '\0') {
    (**(code **)(*piStack_14 + 0x48))();
  }
  iVar3 = (**(code **)(*piStack_14 + 0x14))();
  if (-1 < iVar3 + -1) {
    uVar4 = iVar3 == 0;
    iStack_10 = 0;
    iStack_18 = iVar3;
    do {
      (**(code **)(*piStack_14 + 0xc))(piStack_14,iStack_10,&uStack_4c,&uStack_48);
      func_0x0079acec(uStack_4c,CONCAT22(extraout_var,0x5e),4);
      func_0x0040c324(uStack_48,&UNK_011e0728);
      if ((bool)uVar4) {
        (**(code **)(*piStack_14 + 0xc))(piStack_14,iStack_10,&uStack_54,&uStack_50);
        func_0x0079acec(uStack_54,CONCAT22(extraout_var_00,0x5e),1);
        (**(code **)(*piStack_14 + 0x20))(piStack_14,iStack_10,uStack_50);
      }
      iStack_10 = iStack_10 + 1;
      iStack_18 = iStack_18 + -1;
      uVar4 = iStack_18 == 0;
    } while (!(bool)uVar4);
  }
  (**(code **)(*uStack_8 + 0x48))();
  func_0x009b3eb4(piStack_14,uStack_8);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar5;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011e06bd;
  func_0x004090bc(piStack_14,uVar5,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011e06b4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

