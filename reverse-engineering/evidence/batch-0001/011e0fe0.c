/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_LockOrder(int param_1,int *param_2,undefined4 param_3)

{
  char cVar1;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 uVar2;
  undefined2 extraout_var_01;
  int *in_FS_OFFSET;
  undefined1 uVar3;
  undefined4 uVar4;
  code *UNRECOVERED_JUMPTABLE;
  int iStack_34;
  undefined *puStack_30;
  int iStack_2c;
  undefined4 uStack_24;
  undefined4 uStack_20;
  int iStack_1c;
  undefined1 uStack_18;
  int iStack_14;
  undefined4 uStack_10;
  int *piStack_c;
  undefined4 uStack_8;
  
  uStack_24 = 0;
  uStack_20 = 0;
  iStack_2c = 0x11e1000;
  uStack_10 = param_3;
  piStack_c = param_2;
  uStack_8 = param_1;
  func_0x0040b0c8(param_1);
  puStack_30 = &UNK_011e10e6;
  iStack_34 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_34;
  uVar4 = 0;
  iStack_1c = uStack_8;
  uStack_18 = 0x11;
  iStack_2c = (int)register0x00000010 + -4;
  cVar1 = ORNet_CallVistA(&UNK_011e1100,&iStack_1c,0,0,0,piStack_c);
  uVar3 = cVar1 == '\0';
  uVar2 = extraout_var;
  if ((bool)uVar3) {
    func_0x0040b3c4(piStack_c,&UNK_011e1130);
    uVar2 = extraout_var_00;
  }
  func_0x0079acec(*piStack_c,CONCAT22(uVar2,0x5e),1);
  func_0x0040c324(uStack_20,&UNK_011e1180);
  if ((bool)uVar3) {
    func_0x0040afd4(piStack_c);
  }
  else {
    func_0x0079acec(*piStack_c,CONCAT22(extraout_var_01,0x5e),2,&uStack_24);
    func_0x0040b3c4(piStack_c,uStack_24);
  }
  iStack_14 = *piStack_c;
  if (iStack_14 != 0) {
    iStack_14 = *(int *)(iStack_14 + -4);
  }
  if (iStack_14 == 0) {
    func_0x011e95c0(_DAT_0125aad8,uStack_8,uStack_10,1);
  }
  *in_FS_OFFSET = (int)&uStack_20;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011e10ed;
  func_0x0040b034(&uStack_24,2,uVar4);
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x011e10e4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

