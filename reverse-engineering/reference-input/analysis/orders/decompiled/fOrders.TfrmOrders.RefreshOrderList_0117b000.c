/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_RefreshOrderList(int param_1,char param_2,int param_3)

{
  code *pcVar1;
  char cVar2;
  undefined4 uVar3;
  int iVar4;
  undefined2 extraout_var;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined *puVar8;
  undefined4 *puVar9;
  undefined4 uStack_54;
  undefined *puStack_50;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_48;
  undefined *puStack_44;
  undefined1 *puStack_40;
  undefined4 uStack_38;
  undefined1 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  int iStack_24;
  int iStack_20;
  int iStack_1c;
  undefined4 uStack_18;
  int iStack_14;
  int iStack_10;
  char cStack_9;
  undefined4 uStack_8;
  
  uStack_30 = 0;
  uStack_28 = 0;
  uStack_2c = 0;
  uStack_18 = 0;
  puStack_40 = (undefined1 *)0x117b026;
  iStack_10 = param_3;
  cStack_9 = param_2;
  uStack_8 = param_1;
  func_0x0040b0c8(param_3);
  puStack_44 = &UNK_0117b474;
  uStack_48 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_48;
  iStack_1c = *(int *)(uStack_8 + 0x688);
  if (0 < *(int *)(iStack_1c + 0x4c)) {
    *(undefined1 *)(uStack_8 + 0x68c) = 0;
  }
  UNRECOVERED_JUMPTABLE = (code *)0x117b061;
  puStack_40 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x00608594(*(undefined4 *)(uStack_8 + 0x538));
  puStack_50 = &UNK_0117b3a2;
  uStack_54 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_54;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  (**(code **)(**(int **)(uStack_8 + 0x538) + 0x178))();
  if (cStack_9 != '\0') {
    func_0x009b60ec(&UNK_0117b48c);
    if (*(char *)(uStack_8 + 0x68d) == '\0') {
      cVar2 = func_0x011d6c8c(*_DAT_0124f490);
      if (cVar2 == '\0') {
        if (*(int *)(*(int *)(uStack_8 + 0x688) + 0xc) == -1) {
          puVar8 = &UNK_0117b4cc;
          uVar7 = 0;
          uVar6 = 0;
          uVar3 = func_0x011de93c();
          func_0x0117b878(uStack_8,2,uVar3,uVar6,uVar7,puVar8);
        }
        func_0x011dc634(_DAT_0125a9e0,*(undefined4 *)(uStack_8 + 0x688),iStack_10);
      }
      else {
        puVar9 = &uStack_28;
        func_0x011d6b48(*_DAT_0124f490,&uStack_2c);
        func_0x0079acec(uStack_2c,CONCAT22(extraout_var,0x5e),2,puVar9);
        func_0x011dcb68(_DAT_0125a9e0,*(undefined4 *)(uStack_8 + 0x688),iStack_10,uStack_28);
        func_0x011d6b48(*_DAT_0124f490,&uStack_30);
        func_0x009b60ec(uStack_30);
      }
    }
    else {
      func_0x011db7c0(_DAT_0125a9e0);
      (**(code **)(*_DAT_0125a9e4 + 8))();
      (**(code **)(*_DAT_0125a9e8 + 8))();
      func_0x011dccc0(_DAT_0125a9e4,_DAT_0125a9e8,*(undefined4 *)(uStack_8 + 0x688),iStack_10);
    }
  }
  iStack_24 = iStack_10;
  if (iStack_10 != 0) {
    iStack_24 = *(int *)(iStack_10 + -4);
  }
  if ((((iStack_24 < 1) && (iVar4 = *(int *)(*(int *)(uStack_8 + 0x688) + 0xc), 2 < iVar4 - 0xfU))
      && (iVar4 != 0x18)) && (*(int *)(*(int *)(uStack_8 + 0x688) + 0x54) < 1)) {
LAB_0117b207:
    func_0x01187b88(uStack_8);
  }
  else {
    if (*(char *)(uStack_8 + 0x68c) != '\0') {
      iVar4 = (**(code **)(**(int **)(uStack_8 + 0x540) + 0x16c))();
      if (-1 < iVar4) goto LAB_0117b207;
    }
    if (*(char *)(uStack_8 + 0x68d) != '\0') goto LAB_0117b207;
    func_0x01187c08(uStack_8);
  }
  if (*(char *)(uStack_8 + 0x68d) != '\0') goto LAB_0117b2c2;
  if ((*(char *)(uStack_8 + 0x6e8) != '\0') && (0 < *(int *)(iStack_1c + 0x4c))) {
    func_0x011de8dc(_DAT_0125a9e0,0,1);
    *(undefined1 *)(uStack_8 + 0x6e8) = 0;
  }
  uStack_38 = *(undefined4 *)(iStack_1c + 8);
  uStack_34 = 0;
  uVar5 = 1;
  ORNet_CallVistA(&UNK_0117b55c,&uStack_38,0,0,0,&uStack_18);
  func_0x0040c324(uStack_18,&UNK_0117b580);
  if ((bool)uVar5) {
LAB_0117b28e:
    func_0x0118d8e8(uStack_8,_DAT_0125a9e0);
  }
  else {
    func_0x0040c324(uStack_18,&UNK_0117b5a8);
    if ((bool)uVar5) goto LAB_0117b28e;
    func_0x011de8dc(_DAT_0125a9e0,*(undefined1 *)(iStack_1c + 0x11),
                    *(undefined1 *)(iStack_1c + 0x10));
  }
  func_0x0118a5e4(uStack_8,_DAT_0125a9e0);
LAB_0117b2c2:
  if (*(char *)(uStack_8 + 0x68d) != '\0') {
    if (0 < _DAT_0125a9e8[2]) {
      func_0x011de8dc(_DAT_0125a9e8,1,1);
      if (-1 < _DAT_0125a9e8[2] + -1) {
        iStack_14 = 0;
        iStack_20 = _DAT_0125a9e8[2];
        do {
          uVar3 = func_0x004d2ff0(_DAT_0125a9e8,iStack_14);
          func_0x004d2e10(_DAT_0125a9e0,uVar3);
          iStack_14 = iStack_14 + 1;
          iStack_20 = iStack_20 + -1;
        } while (iStack_20 != 0);
      }
    }
    if (0 < _DAT_0125a9e4[2]) {
      func_0x011de8dc(_DAT_0125a9e4,1,1);
      if (-1 < _DAT_0125a9e4[2] + -1) {
        iStack_14 = 0;
        iStack_20 = _DAT_0125a9e4[2];
        do {
          uVar3 = func_0x004d2ff0(_DAT_0125a9e4,iStack_14);
          func_0x004d2e10(_DAT_0125a9e0,uVar3);
          iStack_14 = iStack_14 + 1;
          iStack_20 = iStack_20 + -1;
        } while (iStack_20 != 0);
      }
    }
    func_0x0118a5e4(uStack_8,_DAT_0125a9e0);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_54;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0117b3a9;
  puStack_50 = (undefined *)0x117b39f;
  func_0x006085cc(*(undefined4 *)(uStack_8 + 0x538),uStack_54,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x0117b3a0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

