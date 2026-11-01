/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rReports_LoadReportText
               (int *param_1,undefined4 param_2,int param_3,undefined4 param_4,int param_5)

{
  double dVar1;
  short sVar2;
  int iVar3;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined2 extraout_var_04;
  undefined2 extraout_var_05;
  undefined4 uVar4;
  undefined4 *in_FS_OFFSET;
  float10 in_ST0;
  float10 in_ST1;
  undefined4 in_stack_ffffff44;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puVar5;
  undefined4 uVar6;
  undefined4 uStack_a8;
  undefined *puStack_a4;
  undefined1 *puStack_a0;
  float10 fStack_94;
  float10 fStack_88;
  undefined4 uStack_7c;
  undefined1 uStack_78;
  undefined4 uStack_74;
  undefined1 uStack_70;
  undefined4 uStack_6c;
  undefined1 uStack_68;
  undefined4 uStack_64;
  undefined1 uStack_60;
  undefined4 uStack_5c;
  undefined1 uStack_58;
  float10 *pfStack_54;
  undefined1 uStack_50;
  float10 *pfStack_4c;
  undefined1 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined8 uStack_3c;
  double dStack_34;
  double dStack_2c;
  int *piStack_24;
  int iStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_44 = 0;
  uStack_40 = 0;
  uStack_c = 0;
  uStack_10 = 0;
  uStack_14 = 0;
  uStack_18 = 0;
  uStack_1c = 0;
  iStack_20 = 0;
  puStack_a0 = (undefined1 *)0xc03f85;
  piStack_24 = param_1;
  uStack_8 = param_2;
  func_0x0040b0c8(param_2);
  puStack_a0 = (undefined1 *)0xc03f8d;
  func_0x0040b0c8(param_5);
  puStack_a0 = (undefined1 *)0xc03f95;
  func_0x0040b0c8(param_4);
  puStack_a4 = &UNK_00c04238;
  uStack_a8 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_a8;
  puStack_a0 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x0040afd4(&uStack_c);
  func_0x0040afd4(&uStack_10);
  func_0x0040afd4(&uStack_14);
  dStack_2c = 0.0;
  dStack_34 = 0.0;
  sVar2 = func_0x009b1bc4(param_3,1);
  if (sVar2 == 0x54) {
    func_0x009b2f6c(param_3,CONCAT22(extraout_var,0x3b),1,&uStack_40);
    func_0x011ca88c(uStack_40);
    dStack_2c = (double)in_ST0;
    func_0x009b2f6c(param_3,CONCAT22(extraout_var_00,0x3b),2,&uStack_44);
    func_0x011ca88c(uStack_44);
    dVar1 = (double)in_ST1;
    dStack_34 = dVar1;
    uStack_3c = (double)CONCAT44(uStack_3c._4_4_,(undefined4)uStack_3c);
    if (dVar1 < dStack_2c) {
      dStack_34 = dStack_2c;
      dStack_2c = dVar1;
      uStack_3c = dVar1;
    }
    func_0x009b2f6c(param_3,CONCAT22(extraout_var_01,0x3b),3,&uStack_18);
    in_stack_ffffff44 = 0xc0407c;
    func_0x009b3114(&param_4,CONCAT22(extraout_var_02,0x3b),4,uStack_18);
  }
  sVar2 = func_0x009b1bc4(param_3,1);
  if (sVar2 == 100) {
    func_0x009b2f6c(param_3,CONCAT22(extraout_var_03,0x3b),2,&uStack_18);
    func_0x009b3114(&param_4,CONCAT22(extraout_var_04,0x3b),4,uStack_18);
    func_0x009b2f6c(param_3,CONCAT22(extraout_var_05,0x3b),1,&iStack_20);
    uVar4 = 0;
    if (iStack_20 != 0) {
      uVar4 = *(undefined4 *)(iStack_20 + -4);
    }
    in_stack_ffffff44 = 0xc040e8;
    func_0x0040c35c(iStack_20,2,uVar4,&uStack_10);
  }
  sVar2 = func_0x009b1bc4(param_3,1);
  if (sVar2 == 0x68) {
    uVar4 = 0;
    if (param_3 != 0) {
      uVar4 = *(undefined4 *)(param_3 + -4);
    }
    func_0x0040c35c(param_3,2,uVar4,&uStack_c);
  }
  sVar2 = func_0x009b1bc4(param_3,1);
  if (sVar2 == 0x69) {
    uVar4 = 0;
    if (param_3 != 0) {
      uVar4 = *(undefined4 *)(param_3 + -4);
    }
    func_0x0040c35c(param_3,2,uVar4,&uStack_14);
  }
  puVar5 = &UNK_00c04254;
  uVar4 = param_4;
  uVar6 = uStack_8;
  func_0x0040c214(&uStack_1c,3);
  iVar3 = 0;
  if (param_5 != 0) {
    iVar3 = *(int *)(param_5 + -4);
  }
  if (iVar3 < 1) {
    (**(code **)(*piStack_24 + 0x3c))(piStack_24,&UNK_00c04264,*piStack_24,uVar4,puVar5,uVar6);
    (**(code **)(*piStack_24 + 0x3c))(piStack_24,&UNK_00c042dc);
  }
  else {
    in_stack_ffffff44 = 0;
    uStack_7c = *(undefined4 *)(*_DAT_0124f2e0 + 4);
    uStack_78 = 0x11;
    uStack_74 = uStack_1c;
    uStack_70 = 0x11;
    uStack_6c = uStack_c;
    uStack_68 = 0x11;
    uStack_64 = uStack_10;
    uStack_60 = 0x11;
    uStack_5c = uStack_14;
    uStack_58 = 0x11;
    fStack_88 = (float10)dStack_2c;
    pfStack_54 = &fStack_88;
    uStack_50 = 3;
    fStack_94 = (float10)dStack_34;
    pfStack_4c = &fStack_94;
    uStack_48 = 3;
    ORNet_CallVistA(param_5,&uStack_7c,6,0,piStack_24);
  }
  *in_FS_OFFSET = in_stack_ffffff44;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00c0423f;
  func_0x0040b034(&uStack_44,2,uVar4);
  func_0x0040b034(&iStack_20,7);
  func_0x0040b034(&param_4,2);
                    /* WARNING: Could not recover jumptable at 0x00c04236. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

