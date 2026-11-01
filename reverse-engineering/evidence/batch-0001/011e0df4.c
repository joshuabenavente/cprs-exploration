/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_LockPatient(int *param_1)

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
  int iStack_28;
  undefined *puStack_24;
  int iStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined1 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  iStack_20 = (int)register0x00000010 + -4;
  uStack_1c = 0;
  uStack_18 = 0;
  puStack_24 = &UNK_011e0ef0;
  iStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_28;
  uVar4 = 0;
  uStack_14 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  uStack_10 = 0x11;
  uStack_8 = param_1;
  cVar1 = ORNet_CallVistA(&UNK_011e0f08,&uStack_14,0,0,0,param_1);
  uVar3 = cVar1 == '\0';
  uVar2 = extraout_var;
  if ((bool)uVar3) {
    func_0x0040b3c4(uStack_8,&UNK_011e0f2c);
    uVar2 = extraout_var_00;
  }
  func_0x0079acec(*uStack_8,CONCAT22(uVar2,0x5e),1);
  func_0x0040c324(uStack_18,&UNK_011e0f70);
  if ((bool)uVar3) {
    func_0x0040afd4(uStack_8);
  }
  else {
    func_0x0079acec(*uStack_8,CONCAT22(extraout_var_01,0x5e),2,&uStack_1c);
    func_0x0040b3c4(uStack_8,uStack_1c);
  }
  iStack_c = *uStack_8;
  if (iStack_c != 0) {
    iStack_c = *(int *)(iStack_c + -4);
  }
  if (iStack_c == 0) {
    func_0x011e95c0(_DAT_0125aad8,*(undefined4 *)(*_DAT_0124f2e0 + 4),0,0);
  }
  *in_FS_OFFSET = (int)&uStack_18;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011e0ef7;
  func_0x0040b034(&uStack_1c,2,uVar4);
                    /* WARNING: Could not recover jumptable at 0x011e0eee. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

