/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fPtSel_TfrmPtSel_cmdOKClick(int param_1)

{
  double dVar1;
  code *pcVar2;
  char cVar3;
  int iVar4;
  undefined2 extraout_var;
  undefined4 *in_FS_OFFSET;
  float10 in_ST0;
  undefined4 uStack_58;
  undefined4 uStack_54;
  int iStack_50;
  undefined1 auStack_4c [16];
  undefined4 uStack_3c;
  undefined *puStack_38;
  undefined *puStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined *puStack_24;
  undefined4 uStack_20;
  undefined *puStack_1c;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)(auStack_4c + 0x48);
  iVar4 = 10;
  do {
    uStack_8 = 0;
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  puStack_1c = &UNK_00e82ec1;
  uStack_20 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_20;
  puStack_24 = (undefined *)0xe82d73;
  func_0x007b3b04(*(undefined4 *)(param_1 + 0x480),&uStack_2c);
  puStack_24 = (undefined *)0xe82d7e;
  func_0x0044973c(&puStack_1c,&uStack_2c);
  iVar4 = 0;
  if (puStack_1c != (undefined *)0x0) {
    iVar4 = *(int *)(puStack_1c + -4);
  }
  if (iVar4 < 1) {
    puStack_24 = (undefined *)0xe82d9d;
    func_0x009b44a8(&UNK_00e82f10,&UNK_00e82edc,0);
  }
  else {
    puStack_24 = (undefined *)0xe82db0;
    func_0x007b3b04(*(undefined4 *)(param_1 + 0x480),&uStack_3c);
    puStack_24 = (undefined *)0xe82dbb;
    func_0x0044973c(&uStack_c,&uStack_3c);
    puStack_24 = (undefined *)0xe82dc9;
    func_0x007b3b04(*(undefined4 *)(param_1 + 0x480),auStack_4c);
    puStack_24 = (undefined *)0xe82dd4;
    func_0x0044973c(&uStack_8,auStack_4c);
    puStack_24 = (undefined *)0xe82dde;
    cVar3 = func_0x00e86810(param_1,&uStack_8);
    if (cVar3 != '\0') {
      puStack_24 = (undefined *)0xe82ded;
      func_0x0042c5fc(uStack_8,&iStack_50);
      if (iStack_50 == 0) goto LAB_00e82e7c;
      puStack_24 = (undefined *)0xe82e02;
      func_0x0040b40c(&uStack_c,uStack_8);
    }
    puStack_24 = (undefined *)0xe82e0d;
    cVar3 = uCore_AllowAccessToSensitivePatient(uStack_c,&UNRECOVERED_JUMPTABLE);
    if (cVar3 != '\0') {
      puStack_24 = (undefined *)0xe82e19;
      func_0x011ce34c(uStack_c);
      dVar1 = (double)in_ST0;
      if (0.0 < dVar1) {
        puStack_24 = &UNK_00e82f60;
        uStack_10 = (undefined4)((ulonglong)dVar1 >> 0x20);
        uStack_28 = uStack_10;
        uStack_2c = SUB84(dVar1,0);
        uStack_30 = 0xe82e42;
        func_0x009b11a0(&UNK_00e82f94,&uStack_58);
        uStack_30 = uStack_58;
        puStack_34 = &UNK_00e82fc4;
        puStack_38 = &UNK_00e82fd8;
        uStack_3c = 0xe82e5c;
        func_0x0040c214(&uStack_54,4);
        uStack_3c = 0xe82e6d;
        iVar4 = func_0x009b44a8(uStack_54,&UNK_00e83018,CONCAT22(extraout_var,0x104));
        if (iVar4 == 7) goto LAB_00e82e7c;
      }
      puStack_24 = (undefined *)0xe82e7c;
      fPtSel_TfrmPtSel_SelectPtByDFN(param_1,uStack_c);
    }
  }
LAB_00e82e7c:
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_20;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e82ec8;
  puStack_1c = (undefined *)0xe82e96;
  func_0x0040b034(&uStack_58,3,pcVar2);
  puStack_1c = (undefined *)0xe82ea9;
  func_0x0040d1c4(auStack_4c,_DAT_004012c8,3);
  puStack_1c = (undefined *)0xe82eb1;
  func_0x0040afd4(&puStack_1c);
  puStack_1c = (undefined *)0xe82ebe;
  func_0x0040b034(&uStack_c,2);
                    /* WARNING: Could not recover jumptable at 0x00e82ebf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

