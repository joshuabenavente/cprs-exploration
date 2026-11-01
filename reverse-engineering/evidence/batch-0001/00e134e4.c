/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fNotes_TfrmNotes_acSignExecute(int param_1)

{
  bool bVar1;
  undefined1 *puVar2;
  char cVar3;
  undefined1 uVar4;
  int iVar5;
  undefined4 uVar6;
  int *piVar7;
  undefined4 uVar8;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  int *extraout_EDX;
  undefined4 extraout_EDX_00;
  int *extraout_EDX_01;
  undefined4 unaff_EBX;
  undefined4 unaff_ESI;
  int unaff_EDI;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_90;
  undefined1 auStack_8c [16];
  undefined4 uStack_7c;
  undefined1 auStack_78 [16];
  undefined4 uStack_68;
  undefined1 auStack_64 [16];
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined1 auStack_30 [2];
  char cStack_2e;
  char cStack_2d;
  int *piStack_2c;
  undefined4 uStack_28;
  undefined *puStack_24;
  undefined4 UNRECOVERED_JUMPTABLE;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  uStack_10 = 0x11;
  do {
    uStack_8 = 0;
    uStack_10 = uStack_10 + -1;
  } while (uStack_10 != 0);
  UNRECOVERED_JUMPTABLE = (code *)0xe13507;
  func_0x0040c99c(&puStack_24,_DAT_00a13fd8);
  UNRECOVERED_JUMPTABLE = (code *)0xe13515;
  func_0x0040c99c(&piStack_2c,_DAT_00a13fd8);
  puStack_24 = &UNK_00e13ae0;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  piStack_2c = (int *)0xe13531;
  UNRECOVERED_JUMPTABLE = (code *)(auStack_30 + 0x2c);
  func_0x007ae008(*(undefined4 *)(param_1 + 0x4dc),&uStack_40);
  piStack_2c = (int *)0xe1353c;
  func_0x0044973c(auStack_30 + 0x1c,&uStack_40);
  piStack_2c = (int *)0xe1354a;
  func_0x0040b3c4(param_1 + 0x924,unaff_EBX);
  piStack_2c = (int *)0xe13558;
  iVar5 = (**(code **)(**(int **)(param_1 + 0x4dc) + 0x16c))();
  if (iVar5 == *(int *)(param_1 + 0x7bc)) {
    *(undefined1 *)(param_1 + 0x92a) = 0;
    piStack_2c = (int *)0xe13573;
    func_0x00e1946c(param_1,&cStack_2d);
    if ((cStack_2d == '\0') || (*(char *)(param_1 + 0x92a) != '\0')) goto LAB_00e13a65;
  }
  else if (-1 < *(int *)(param_1 + 0x7bc)) {
    piStack_2c = (int *)0xe1359a;
    piVar7 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
    piStack_2c = (int *)0xe135a8;
    (**(code **)(*piVar7 + 0xc))(piVar7,*(undefined4 *)(param_1 + 0x7bc),auStack_30 + 0x18);
    piStack_2c = (int *)(auStack_30 + 0x14);
    _auStack_30 = 0xe135bd;
    func_0x0079acec(unaff_ESI,CONCAT22(extraout_var_03,0x5e),1);
  }
  piStack_2c = (int *)0xe135c8;
  func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
  piStack_2c = (int *)0xe135cd;
  cVar3 = func_0x00a0ed10();
  if (cVar3 == '\0') {
    piStack_2c = (int *)0xe135e4;
    func_0x009b44a8(&UNK_00e13b20,&UNK_00e13afc,CONCAT22(extraout_var,0x10));
  }
  else {
    piStack_2c = (int *)0xe135f4;
    _auStack_30 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
    uStack_34 = 0xe135fb;
    cVar3 = func_0x00a0c188();
    if (cVar3 == '\0') {
      piStack_2c = (int *)0xe13612;
      iVar5 = func_0x009b44a8(&UNK_00e13bc8,&UNK_00e13b90,CONCAT22(extraout_var_00,0x134));
      if (iVar5 != 6) goto LAB_00e13a65;
    }
    piStack_2c = (int *)0xe13626;
    func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
    piStack_2c = (int *)0xe1362b;
    cVar3 = rTIU_CosignDocument();
    if (cVar3 == '\0') {
      piStack_2c = (int *)0xe13658;
      func_0x0040b40c(&uStack_10,&UNK_00e13d5c);
      piStack_2c = (int *)0xe13665;
      func_0x0040b40c(&uStack_8,&UNK_00e13d7c);
    }
    else {
      piStack_2c = (int *)0xe1363c;
      func_0x0040b40c(&uStack_10,&UNK_00e13d14);
      piStack_2c = (int *)0xe13649;
      func_0x0040b40c(&uStack_8,&UNK_00e13d38);
    }
    piStack_2c = (int *)0xe13670;
    _auStack_30 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
    uStack_34 = 0xe13679;
    piStack_2c = extraout_EDX;
    cVar3 = func_0x00e16210(param_1);
    if (cVar3 != '\0') {
      _auStack_30 = (uint3)(ushort)auStack_30;
      bVar1 = true;
      piStack_2c = (int *)0xe13692;
      uVar6 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
      piStack_2c = (int *)0xe1369f;
      func_0x00a0b1e8(&puStack_24,uVar6,uStack_8);
      if ((char)puStack_24 == '\0') {
        bVar1 = false;
        piStack_2c = (int *)0xe138d0;
        func_0x009b44a8(UNRECOVERED_JUMPTABLE,&UNK_00e13e4c,0);
      }
      else {
        piStack_2c = (int *)0xe136b4;
        uVar6 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
        piStack_2c = (int *)0xe136c0;
        uVar4 = func_0x011f3bfc(_DAT_0125a100,uVar6);
        auStack_30 = (undefined1  [2])CONCAT11(uVar4,auStack_30[0]);
        if (*(char *)(*_DAT_0124f7c4 + 0x6e3) != '\0') goto LAB_00e13a65;
        if (*(char *)(_DAT_0125a100 + 4) != '\0') {
          *(undefined1 *)(_DAT_0125a100 + 4) = 0;
          piStack_2c = (int *)0xe136f4;
          fNotes_TfrmNotes_lstNotesClick(param_1,param_1);
        }
        piStack_2c = (int *)0xe136ff;
        func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
        piStack_2c = (int *)0xe13704;
        cVar3 = func_0x00a0b304();
        if (cVar3 == '\0') {
          piStack_2c = (int *)0xe13716;
          uVar6 = (**(code **)(**(int **)(param_1 + 0x4dc) + 0x16c))();
          piStack_2c = (int *)0xe13722;
          fNotes_TfrmNotes_GetTitleText(param_1,uVar6,&uStack_48);
          piStack_2c = (int *)0xe13732;
          func_0x0040c18c(&uStack_44,&UNK_00e13d9c,uStack_48);
          piStack_2c = (int *)0xe13743;
          iVar5 = func_0x009b44a8(uStack_44,&UNK_00e13d5c,CONCAT22(extraout_var_01,4));
          if (iVar5 == 7) goto LAB_00e13a65;
        }
        if (auStack_30[1] != '\0') {
          piStack_2c = &iStack_c;
          _auStack_30 = 0xe13768;
          _auStack_30 = (**(code **)(**(int **)(param_1 + 0x4dc) + 0x16c))();
          uStack_34 = 0xe13774;
          piVar7 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
          uVar6 = _auStack_30;
          _auStack_30 = 0xe1377d;
          (**(code **)(*piVar7 + 0xc))(piVar7,uVar6,&uStack_50);
          _auStack_30 = 0xe13788;
          func_0x00a14ad8(uStack_50,&uStack_4c);
          _auStack_30 = uStack_4c;
          uStack_34 = 0xe13794;
          uVar8 = func_0x005cdd74(*(undefined4 *)(param_1 + 0x74));
          uVar6 = _auStack_30;
          _auStack_30 = 0xe1379d;
          func_0x00cf29a4(uVar8,uVar6,uStack_10);
          iVar5 = 0;
          if (iStack_c != 0) {
            iVar5 = *(int *)(iStack_c + -4);
          }
          if (iVar5 < 1) {
            _auStack_30 = 0xe13898;
            func_0x007ae008(*(undefined4 *)(param_1 + 0x4dc),auStack_8c);
            _auStack_30 = 0xe138a6;
            func_0x0044973c(&uStack_7c,auStack_8c);
            _auStack_30 = 0xe138ba;
            uVar4 = func_0x011d5c38(*_DAT_0124f8dc,10,uStack_7c);
            _auStack_30 = CONCAT12(uVar4,auStack_30);
          }
          else {
            _auStack_30 = 0xe137ba;
            uVar6 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
            _auStack_30 = 0xe137c7;
            rTIU_SignDocument(&piStack_2c,uVar6,iStack_c);
            _auStack_30 = 0xe137d2;
            uStack_34 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
            uStack_38 = 0xe137dd;
            _auStack_30 = extraout_EDX_00;
            func_0x00e1c124(param_1,0);
            uStack_38 = 0xe137eb;
            func_0x007ae008(*(undefined4 *)(param_1 + 0x4dc),auStack_64);
            uStack_38 = 0xe137f6;
            func_0x0044973c(&uStack_54,auStack_64);
            uStack_38 = 0xe1380a;
            uVar4 = func_0x011d5c38(*_DAT_0124f8dc,10,uStack_54);
            _auStack_30 = CONCAT12(uVar4,auStack_30);
            uStack_38 = 0xe1381b;
            func_0x007ae008(*(undefined4 *)(param_1 + 0x4dc),auStack_78);
            uStack_38 = 0xe13826;
            func_0x0044973c(&uStack_68,auStack_78);
            uStack_38 = 0xe1383a;
            func_0x011d5ee8(*_DAT_0124f8dc,10,uStack_68);
            if ((char)piStack_2c == '\0') {
              uStack_38 = 0xe13885;
              func_0x009b44a8(uStack_28,&UNK_00e13e18,0);
            }
            else {
              if (*(int *)(*_DAT_0124f308 + 0x754) == -1) {
                uStack_38 = 0;
                uStack_3c = 0xb;
                uStack_40 = 0x2815;
                uStack_44 = 0xe13865;
                uStack_44 = func_0x0060ca58(*_DAT_0124f308);
                uStack_48 = 0xe1386b;
                func_0x0041c028();
              }
              uStack_38 = 0xe13874;
              fNotes_TfrmNotes_lstNotesClick(param_1,param_1);
            }
          }
        }
      }
      if (cStack_2e == '\0') {
        piStack_2c = (int *)0xe138e1;
        _auStack_30 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
        uStack_34 = 0xe138e8;
        func_0x00a0c130();
      }
      piStack_2c = (int *)0xe138f3;
      _auStack_30 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
      uStack_34 = 0xe138fe;
      piStack_2c = extraout_EDX_01;
      func_0x00e1644c(param_1,0);
      if (bVar1) {
        piStack_2c = (int *)0xe1390f;
        fNotes_TfrmNotes_LoadNotes(param_1,0);
        if (unaff_EDI != 0) {
          piStack_2c = (int *)0xe13924;
          piVar7 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
          piStack_2c = (int *)0xe1392e;
          (**(code **)(*piVar7 + 100))(piVar7,0,unaff_ESI);
          piStack_2c = (int *)0xe13938;
          piStack_2c = (int *)func_0x00a125bc(&UNK_00e13e90);
          uVar6 = *(undefined4 *)(*(int *)(param_1 + 0x4cc) + 0x330);
          _auStack_30 = 0xe1394c;
          uVar8 = func_0x0066fb68(uVar6);
          _auStack_30 = 0xe1395a;
          uVar6 = func_0x0066f7e8(uVar6,uVar8,&UNK_00e13ee8);
          _auStack_30 = 0xe13968;
          func_0x007b5794(uVar6,&UNK_00e13e90);
          _auStack_30 = 0xe13971;
          func_0x0066dc74(uVar6,0);
          _auStack_30 = 0xe13979;
          _auStack_30 = func_0x00a125bc(unaff_ESI);
          uStack_34 = 0xe13988;
          func_0x00a14ad8(unaff_ESI,&uStack_90);
          uStack_34 = 0xe139a1;
          uVar6 = func_0x0066f798(*(undefined4 *)(*(int *)(param_1 + 0x4cc) + 0x330),uVar6,uStack_90
                                 );
          uStack_34 = 0xe139af;
          func_0x007b5794(uVar6,unaff_ESI);
          uStack_34 = 0xe139c1;
          func_0x00a10e14(uVar6,param_1 + 2000,6);
          uStack_34 = 0xe139cf;
          uVar6 = func_0x007ae0d4(*(undefined4 *)(param_1 + 0x4dc),unaff_EDI);
          uStack_34 = 0xe139d8;
          func_0x00e1e48c(param_1,uVar6);
        }
        iVar5 = *(int *)(param_1 + 0x4cc);
        piStack_2c = (int *)0xe139e9;
        piStack_2c = (int *)func_0x0066fb68(*(undefined4 *)(iVar5 + 0x330));
        _auStack_30 = 0xe139fb;
        uVar6 = func_0x007b5f00(iVar5,*(undefined4 *)(param_1 + 0x924),
                                CONCAT22(extraout_var_02,0x5e));
        _auStack_30 = 0xe13a04;
        func_0x00672184(iVar5,uVar6);
        _auStack_30 = 0xe13a0f;
        iVar5 = func_0x0067213c(*(undefined4 *)(param_1 + 0x4cc));
        if (iVar5 == 0) {
          _auStack_30 = 0xe13a3c;
          iVar5 = func_0x0066f6b0(*(undefined4 *)(*(int *)(param_1 + 0x4cc) + 0x330));
          if (0 < iVar5) {
            iVar5 = *(int *)(param_1 + 0x4cc);
            _auStack_30 = 0xe13a53;
            uVar6 = func_0x0066fb94(*(undefined4 *)(iVar5 + 0x330),0);
            _auStack_30 = 0xe13a5c;
            func_0x00672184(iVar5,uVar6);
          }
        }
        else {
          _auStack_30 = 0xe13a1e;
          uVar6 = func_0x0067213c(*(undefined4 *)(param_1 + 0x4cc));
          _auStack_30 = 0xe13a29;
          fNotes_TfrmNotes_tvNotesChange(param_1,param_1,uVar6);
        }
        _auStack_30 = 0xe13a65;
        func_0x00e23934(param_1,1);
      }
    }
  }
LAB_00e13a65:
  puVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e13ae7;
  puStack_24 = (undefined *)0xe13a7d;
  func_0x0040afd4(&uStack_90,uStack_28,puVar2);
  puStack_24 = (undefined *)0xe13a88;
  func_0x00443770(auStack_8c);
  puStack_24 = (undefined *)0xe13a90;
  func_0x0040afd4(&uStack_7c);
  puStack_24 = (undefined *)0xe13a98;
  func_0x00443770(auStack_78);
  puStack_24 = (undefined *)0xe13aa0;
  func_0x0040afd4(&uStack_68);
  puStack_24 = (undefined *)0xe13aa8;
  func_0x00443770(auStack_64);
  puStack_24 = (undefined *)0xe13ab5;
  func_0x0040b034(&uStack_54,5);
  puStack_24 = (undefined *)0xe13abd;
  func_0x00443770(&uStack_40);
  puStack_24 = (undefined *)0xe13ad0;
  func_0x0040d1c4(&piStack_2c,_DAT_00a13fd8,2);
  puStack_24 = (undefined *)0xe13add;
  func_0x0040b034(auStack_30 + 0x14,6);
                    /* WARNING: Could not recover jumptable at 0x00e13ade. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

