/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fODBase_TResponses_SaveOrder(int param_1,int *param_2,undefined4 param_3,undefined1 param_4)

{
  uint uVar1;
  undefined1 uVar2;
  char cVar3;
  undefined4 uVar4;
  int *piVar5;
  int iVar6;
  int iVar7;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined2 extraout_var_04;
  undefined4 *in_FS_OFFSET;
  bool bVar8;
  undefined4 uStack_dc;
  undefined4 uStack_d8;
  undefined4 *puStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  undefined4 uStack_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  undefined1 auStack_80 [4];
  undefined1 auStack_7c [4];
  int iStack_78;
  undefined4 uStack_74;
  undefined2 uStack_70;
  undefined4 auStack_6c [2];
  undefined4 uStack_64;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined1 auStack_48 [4];
  undefined4 uStack_44;
  undefined1 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 *puStack_2c;
  undefined4 *puStack_28;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 UNRECOVERED_JUMPTABLE;
  int iStack_14;
  undefined4 uStack_10;
  undefined1 auStack_c [8];
  
  iVar7 = 0x1a;
  do {
    iVar7 = iVar7 + -1;
  } while (iVar7 != 0);
  LOCK();
  UNLOCK();
  uStack_10 = 0;
  UNRECOVERED_JUMPTABLE = (code *)0x10f24b4;
  func_0x0040c99c(&uStack_84,_DAT_010e929c);
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  uStack_20 = 0;
  UNRECOVERED_JUMPTABLE = (code *)((uint)(auStack_c + 8) & 0xffffff);
  if (0 < *(int *)(param_1 + 0x24)) {
    uStack_10 = *(undefined4 *)(param_1 + 0x24);
    puStack_28 = (undefined4 *)0x10f24ee;
    func_0x0042cfdc(*(undefined4 *)(param_1 + 0x24),&uStack_88);
    puStack_28 = (undefined4 *)0x10f24f9;
    uVar2 = func_0x011db684(uStack_88);
    UNRECOVERED_JUMPTABLE = (code *)CONCAT13(uVar2,(undefined3)UNRECOVERED_JUMPTABLE);
  }
  puStack_28 = (undefined4 *)0x10f250f;
  func_0x0040b3c4(*param_2 + 0x6c,*(undefined4 *)(param_1 + 0x18));
  if (fODBase_XfInToOutNow == '\0') {
    puStack_28 = (undefined4 *)0x10f253b;
    func_0x0040b40c(&uStack_84,*(undefined4 *)(param_1 + 4));
  }
  else {
    puStack_28 = (undefined4 *)0x10f252b;
    func_0x0040c18c(&uStack_84,*(undefined4 *)(param_1 + 4),&UNK_010f2bc4);
  }
  puStack_28 = (undefined4 *)0x10f2549;
  func_0x0040b40c(auStack_80,*(undefined4 *)(param_1 + 0x2c));
  puStack_28 = (undefined4 *)0x10f2557;
  func_0x0040b40c(auStack_7c,*(undefined4 *)(param_1 + 0x30));
  iStack_78 = *(int *)(param_1 + 0x20);
  uStack_74 = uStack_10;
  uStack_70 = *(undefined2 *)(param_1 + 0x34);
  uStack_64 = *(undefined4 *)(param_1 + 0x40);
  uStack_5c = *(undefined4 *)(param_1 + 0x48);
  uStack_58 = *(undefined4 *)(param_1 + 0x4c);
  uStack_54 = *(undefined4 *)(param_1 + 0x60);
  uStack_50 = *(undefined4 *)(param_1 + 100);
  uStack_4c = *(undefined4 *)(param_1 + 0x28);
  puStack_28 = (undefined4 *)0x10f25af;
  func_0x0040b40c(auStack_48,_DAT_0125a914);
  uStack_40 = param_4;
  if (*(char *)(*_DAT_0124f2e0 + 0x35) == '\0') {
    puStack_28 = (undefined4 *)0x10f25df;
    cVar3 = func_0x011e8bf8(*(undefined4 *)(*_DAT_0124e2a0 + 0x10),
                            *(undefined4 *)(*_DAT_0124f2e0 + 4));
    if (cVar3 != '\x01') goto LAB_010f264b;
    puStack_28 = (undefined4 *)0x10f25f5;
    puStack_2c = (undefined4 *)func_0x0040c4b0(&UNK_010f2bd8,uStack_84,1);
    bVar8 = puStack_2c == (undefined4 *)0x0;
    if (((int)puStack_2c < 1) || (bVar8 = *_DAT_0124ecbc == iStack_78, !bVar8)) {
      puStack_28 = (undefined4 *)0x10f2617;
      func_0x0040c324(uStack_84,&UNK_010f2c24);
      if ((bVar8) && (*_DAT_0124ecbc == iStack_78)) goto LAB_010f2644;
      bVar8 = false;
      puStack_28 = (undefined4 *)0x10f2632;
      func_0x0040c324(uStack_84,&UNK_010f2c54);
      if ((bVar8) && (*_DAT_0124ecbc == iStack_78)) goto LAB_010f2644;
      uVar2 = 0;
    }
    else {
LAB_010f2644:
      uVar2 = 1;
    }
    uStack_30 = (undefined4 *)CONCAT13(uVar2,(undefined3)uStack_30);
  }
  else {
LAB_010f264b:
    uStack_30 = (undefined4 *)((uint)uStack_30 & 0xffffff);
  }
  if ((((uStack_30._3_1_ != '\0') && (*(int *)(param_1 + 0x18) == 0)) &&
      (*(int *)(param_1 + 0x3c) == 0)) && (*(int *)(param_1 + 0x14) == 0)) {
    uStack_40 = 1;
    iStack_78 = *_DAT_0124fd20;
  }
  uStack_3c = _fODBase_EventDefaultOD;
  if ((fODBase_IsUDGroup != '\0' || UNRECOVERED_JUMPTABLE._3_1_ != '\0') &&
     (iVar7 = *(int *)(*(int *)(param_1 + 0xc) + 8), -1 < iVar7 + -1)) {
    uVar2 = iVar7 == 0;
    iStack_14 = 0;
    do {
      puStack_28 = (undefined4 *)0x10f26b7;
      iVar7 = func_0x004d2ff0(*(undefined4 *)(param_1 + 0xc),iStack_14);
      puStack_28 = (undefined4 *)0x10f26c5;
      func_0x0042c1a8(*(undefined4 *)(iVar7 + 8),&uStack_8c);
      puStack_28 = (undefined4 *)0x10f26d5;
      func_0x0040c324(uStack_8c,&UNK_010f2c94);
      if ((bool)uVar2) {
        puStack_28 = (undefined4 *)0x10f26e5;
        func_0x004d2e68(*(undefined4 *)(param_1 + 0xc),iStack_14);
        break;
      }
      iStack_14 = iStack_14 + 1;
      uVar2 = puStack_28 == (undefined4 *)0x1;
    } while (!(bool)uVar2);
  }
  if (fODBase_SaveAsCurrent != '\0') {
    uStack_70 = 0;
  }
  uStack_44 = *(undefined4 *)(param_1 + 0xc);
  if (0 < *(int *)(param_1 + 0x38)) {
    puStack_28 = (undefined4 *)0x10f2729;
    iVar7 = func_0x011e8a04(*(undefined4 *)(*_DAT_0124f2e0 + 4),*(undefined4 *)(param_1 + 0x38));
    if (0 < iVar7) {
      puStack_28 = (undefined4 *)0x10f2746;
      uVar4 = func_0x011e8a04(*(undefined4 *)(*_DAT_0124f2e0 + 4),*(undefined4 *)(param_1 + 0x38));
      puStack_28 = (undefined4 *)0x10f274e;
      func_0x0042cfdc(uVar4,&uStack_24);
      puStack_28 = (undefined4 *)0x10f2759;
      func_0x0040b40c(auStack_6c,uStack_24);
      puStack_28 = (undefined4 *)0x10f276a;
      func_0x010eb48c(param_2,&uStack_84,_fODBase_OrderSource);
      if (fODBase_SaveAsCurrent == '\0') {
        puStack_28 = (undefined4 *)0x10f2787;
        func_0x0040b3c4(*param_2 + 0x74,auStack_6c[0]);
        puStack_28 = &uStack_94;
        puStack_2c = (undefined4 *)0x10f279c;
        func_0x011db390(uStack_24,&uStack_98);
        puStack_2c = (undefined4 *)0x10f27b0;
        func_0x0079acec(uStack_98,CONCAT22(extraout_var,0x5e),4);
        puStack_2c = (undefined4 *)0x10f27c3;
        func_0x009b2a68(uStack_94,0,&uStack_90);
        puStack_2c = (undefined4 *)0x10f27db;
        func_0x0040c18c(*param_2 + 0x78,&UNK_010f2cb0,uStack_90);
      }
      goto LAB_010f2b30;
    }
  }
  puStack_28 = (undefined4 *)0x10f27f1;
  func_0x010eb48c(param_2,&uStack_84,_fODBase_OrderSource);
  if (fODBase_SaveAsCurrent == '\0') {
    if ((*(int *)(param_1 + 0x38) < 1) || (*(int *)(param_1 + 0x50) < 1)) {
      if ((0 < *(int *)(param_1 + 0x38)) && (*(int *)(param_1 + 0x50) == 0)) {
        puStack_28 = (undefined4 *)0x10f293e;
        func_0x011e8930(*(undefined4 *)(*_DAT_0124f2e0 + 4),*(undefined4 *)(param_1 + 0x38),
                        *(undefined4 *)(*param_2 + 0xc));
        puStack_28 = (undefined4 *)0x10f2953;
        uStack_20 = func_0x011e8a04(*(undefined4 *)(*_DAT_0124f2e0 + 4),
                                    *(undefined4 *)(param_1 + 0x38));
        puStack_28 = (undefined4 *)0x10f2964;
        func_0x0042cfdc(uStack_20,&uStack_b0);
        puStack_28 = (undefined4 *)0x10f2977;
        func_0x0040b3c4(*param_2 + 0x74,uStack_b0);
        puStack_28 = &uStack_b8;
        puStack_2c = (undefined4 *)0x10f298c;
        func_0x0042cfdc(uStack_20,&uStack_c0);
        puStack_2c = (undefined4 *)0x10f299d;
        func_0x011db390(uStack_c0,&uStack_bc);
        puStack_2c = (undefined4 *)0x10f29b1;
        func_0x0079acec(uStack_bc,CONCAT22(extraout_var_01,0x5e),4);
        puStack_2c = (undefined4 *)0x10f29c4;
        func_0x009b2a68(uStack_b8,0,&uStack_b4);
        puStack_2c = (undefined4 *)0x10f29dc;
        func_0x0040c18c(*param_2 + 0x78,&UNK_010f2cb0,uStack_b4);
      }
    }
    else {
      puStack_28 = (undefined4 *)0x10f2835;
      func_0x011e8930(*(undefined4 *)(*_DAT_0124f2e0 + 4),*(undefined4 *)(param_1 + 0x50),
                      *(undefined4 *)(*param_2 + 0xc));
      puStack_28 = (undefined4 *)0x10f284a;
      uStack_20 = func_0x011e8a04(*(undefined4 *)(*_DAT_0124f2e0 + 4),
                                  *(undefined4 *)(param_1 + 0x50));
      puStack_28 = (undefined4 *)0x10f285b;
      func_0x0042cfdc(uStack_20,&uStack_9c);
      puStack_28 = (undefined4 *)0x10f286e;
      func_0x0040b3c4(*param_2 + 0x74,uStack_9c);
      puStack_28 = &uStack_a4;
      puStack_2c = (undefined4 *)0x10f2883;
      func_0x0042cfdc(uStack_20,&uStack_ac);
      puStack_2c = (undefined4 *)0x10f2894;
      func_0x011db390(uStack_ac,&uStack_a8);
      puStack_2c = (undefined4 *)0x10f28a8;
      func_0x0079acec(uStack_a8,CONCAT22(extraout_var_00,0x5e),4);
      puStack_2c = (undefined4 *)0x10f28bb;
      func_0x009b2a68(uStack_a4,0,&uStack_a0);
      puStack_2c = (undefined4 *)0x10f28d3;
      func_0x0040c18c(*param_2 + 0x78,&UNK_010f2cb0,uStack_a0);
      puStack_2c = (undefined4 *)0x10f28ea;
      func_0x011e8930(*(undefined4 *)(*_DAT_0124f2e0 + 4),*(undefined4 *)(param_1 + 0x38),0);
      puStack_2c = (undefined4 *)0x10f28ff;
      uStack_20 = func_0x011e8a04(*(undefined4 *)(*_DAT_0124f2e0 + 4),
                                  *(undefined4 *)(param_1 + 0x38));
    }
    if (0 < *(int *)(param_1 + 0x38)) {
      puStack_28 = (undefined4 *)0x10f29fb;
      piVar5 = (int *)func_0x007b1014(*(undefined4 *)(*_DAT_0124e090 + 0x540));
      puStack_28 = (undefined4 *)0x10f2a00;
      iVar7 = (**(code **)(*piVar5 + 0x14))();
      if (0 < iVar7 + -1) {
        iVar7 = 1;
        do {
          puStack_28 = &uStack_c4;
          puStack_2c = &uStack_c8;
          uStack_30 = (undefined4 *)0x10f2a33;
          piVar5 = (int *)func_0x007b1014(*(undefined4 *)(*_DAT_0124e090 + 0x540));
          uStack_30 = (undefined4 *)0x10f2a41;
          (**(code **)(*piVar5 + 0xc))(piVar5,iVar7,&uStack_cc);
          uStack_30 = (undefined4 *)0x10f2a55;
          func_0x0079acec(uStack_cc,CONCAT22(extraout_var_02,0x5e),1);
          uStack_30 = (undefined4 *)0x10f2a69;
          func_0x0079acec(uStack_c8,CONCAT22(extraout_var_03,0x3b),1);
          uStack_30 = (undefined4 *)0x10f2a74;
          iVar6 = func_0x0042d1fc(uStack_c4);
          if (iVar6 == *(int *)(param_1 + 0x38)) {
            puStack_28 = (undefined4 *)0x10f2a8e;
            func_0x0042cfdc(uStack_20,&puStack_d4);
            puStack_28 = puStack_d4;
            puStack_2c = (undefined4 *)&UNK_010f2cd0;
            uStack_30 = &uStack_d8;
            uStack_34 = 0x10f2ab2;
            piVar5 = (int *)func_0x007b1014(*(undefined4 *)(*_DAT_0124e090 + 0x540));
            uStack_34 = 0x10f2ac0;
            (**(code **)(*piVar5 + 0xc))(piVar5,iVar7,&uStack_dc);
            uStack_34 = 0x10f2ad4;
            func_0x0079acec(uStack_dc,CONCAT22(extraout_var_04,0x5e),2);
            uStack_34 = uStack_d8;
            uStack_38 = 0x10f2aea;
            func_0x0040c214(&uStack_d0,3);
            uStack_38 = uStack_d0;
            uStack_3c = 0x10f2b03;
            piVar5 = (int *)func_0x007b1014(*(undefined4 *)(*_DAT_0124e090 + 0x540));
            uVar4 = uStack_38;
            uStack_38 = 0x10f2b0c;
            (**(code **)(*piVar5 + 0x20))(piVar5,iVar7,uVar4);
            uStack_38 = 0x10f2b24;
            (**(code **)(**(int **)(*_DAT_0124e090 + 0x540) + 0x170))
                      (*(int **)(*_DAT_0124e090 + 0x540),iVar7);
          }
          iVar7 = iVar7 + 1;
        } while (puStack_28 != (undefined4 *)0x1);
      }
    }
  }
LAB_010f2b30:
  puStack_28 = (undefined4 *)0x10f2b3a;
  func_0x0040afd4(&DAT_0125a914);
  puStack_28 = (undefined4 *)0x10f2b4d;
  func_0x0040b3c4(*param_2 + 0x6c,*(undefined4 *)(param_1 + 0x18));
  puStack_28 = (undefined4 *)0x10f2b52;
  cVar3 = func_0x00d82fdc();
  if (cVar3 != '\0') {
    puStack_28 = (undefined4 *)0x10f2b60;
    func_0x0040afd4(_DAT_0124eaa4);
    puStack_28 = (undefined4 *)0x10f2b72;
    func_0x0040b3c4(_DAT_0124eaa4,*(undefined4 *)(*param_2 + 0xc));
  }
  uVar1 = (uint)UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_24;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_010f2baf;
  uStack_20 = 0x10f2b8f;
  func_0x0040b034(&uStack_dc,0x16,uVar1);
  uStack_20 = 0x10f2b9d;
  func_0x0040cd88(&uStack_84,_DAT_010e929c);
  uStack_20 = 0x10f2ba5;
  func_0x0040afd4(&uStack_24);
                    /* WARNING: Could not recover jumptable at 0x010f2ba6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

