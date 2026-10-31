/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fLabs_TfrmLabs_lstDatesClick(int param_1)

{
  int *piVar1;
  undefined *puVar2;
  undefined4 ***pppuVar3;
  undefined4 *puVar4;
  int **ppiVar5;
  char cVar6;
  undefined4 uVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  uint uVar11;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  int extraout_EDX;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined2 extraout_var_04;
  undefined2 extraout_var_05;
  undefined2 extraout_var_06;
  undefined2 extraout_var_07;
  undefined2 extraout_var_08;
  undefined2 extraout_var_09;
  undefined2 extraout_var_10;
  undefined2 extraout_var_11;
  undefined2 extraout_var_12;
  undefined2 extraout_var_13;
  undefined2 extraout_var_14;
  undefined2 extraout_var_15;
  undefined2 extraout_var_16;
  undefined2 extraout_var_17;
  undefined2 uVar12;
  undefined4 unaff_EBX;
  int *in_FS_OFFSET;
  undefined1 uVar13;
  unkbyte10 in_ST0;
  float10 in_ST1;
  float10 in_ST2;
  float10 in_ST3;
  undefined1 auStack_140 [16];
  undefined4 auStack_130 [4];
  undefined4 uStack_120;
  undefined4 ***pppuStack_11c;
  undefined4 *puStack_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined *puStack_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 **ppuStack_ec;
  undefined4 *puStack_e8;
  undefined4 **ppuStack_e4;
  undefined4 *puStack_e0;
  undefined4 uStack_dc;
  undefined4 *puStack_d8;
  code *pcStack_d4;
  undefined4 **ppuStack_d0;
  undefined *puStack_cc;
  undefined4 *puStack_c8;
  undefined4 **ppuStack_c4;
  undefined *puStack_c0;
  undefined4 **ppuStack_bc;
  undefined4 ***pppuStack_b8;
  undefined *puStack_b4;
  undefined4 ****ppppuStack_b0;
  undefined4 ***pppuStack_ac;
  undefined4 ***UNRECOVERED_JUMPTABLE;
  code **UNRECOVERED_JUMPTABLE_00;
  undefined4 **ppuStack_a0;
  undefined4 *puStack_9c;
  undefined4 **ppuStack_98;
  undefined4 *puStack_94;
  undefined *puStack_90;
  undefined *puStack_8c;
  undefined8 uStack_88;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined4 uStack_68;
  int *piStack_64;
  undefined *puStack_60;
  undefined *puStack_5c;
  undefined **ppuStack_58;
  code *pcStack_54;
  undefined *puStack_50;
  ushort uStack_4c;
  undefined2 uStack_4a;
  int *piStack_48;
  undefined *puStack_44;
  int iStack_40;
  undefined8 uStack_3c;
  undefined8 uStack_34;
  undefined8 uStack_2c;
  undefined *puStack_24;
  undefined1 *puStack_20;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_20 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_10 = 0x27;
  do {
    uStack_8 = 0;
    uStack_10 = uStack_10 + -1;
  } while (uStack_10 != 0);
  puStack_24 = &UNK_00eab453;
  uStack_2c._4_4_ = (undefined4 ***)*in_FS_OFFSET;
  *in_FS_OFFSET = (int)&uStack_2c + 4;
  _DAT_0125a320 = 0;
  uStack_2c._0_4_ = (undefined4 ***)0xea9f22;
  func_0x006b861c(*(undefined4 *)(param_1 + 0x4e4),3000);
  uVar12 = extraout_var;
  if (DAT_0125a31c == '\x01') {
    uStack_2c._0_4_ = (undefined4 ***)0xea9f3b;
    func_0x006025b0(*(undefined4 *)(param_1 + 0x4ec),0);
    uVar12 = extraout_var_00;
  }
  uStack_2c._0_4_ = (undefined4 ***)0xea9f4b;
  func_0x00729a50(*_DAT_0124fe08,CONCAT22(uVar12,0xfff5));
  uVar13 = 1;
  uStack_2c._0_4_ = (undefined4 ***)0xea9f55;
  func_0x00ea5bd0(param_1);
  uStack_2c._0_4_ = (undefined4 ***)0xea9f5f;
  func_0x0040afd4(0x125a324);
  uStack_2c._0_4_ = (undefined4 ***)0xea9f67;
  func_0x00ebd410(param_1);
  DAT_0125a2ef = 1;
  uStack_2c._0_4_ = (undefined4 ***)0xea9f7f;
  func_0x007ae008(*(undefined4 *)(param_1 + 0x670),&piStack_64);
  uStack_2c._0_4_ = (undefined4 ***)&piStack_64;
  uStack_34 = (double)CONCAT44(0xea9f8f,(undefined4 **)uStack_34);
  func_0x0044a008(&uStack_74,CONCAT22(extraout_var_01,0x53));
  ppiVar5 = (int **)(undefined4 ***)uStack_2c;
  uStack_2c._0_4_ = (undefined4 ***)0xea9f98;
  func_0x0044e1b8(ppiVar5,&uStack_74);
  if ((bool)uVar13) {
    iVar8 = *(int *)(param_1 + 0x4d4);
    uStack_2c._0_4_ = (undefined4 ***)0xea9fae;
    cVar6 = func_0x00ad9eac(iVar8);
    if (cVar6 == '\0') {
      uStack_2c._0_4_ = (undefined4 ***)0xeaa0c2;
      (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),0xffffffff);
    }
    else {
      iVar10 = 0;
      if (*(int *)(iVar8 + 0x40) != 0) {
        iVar10 = *(int *)(*(int *)(iVar8 + 0x40) + -4);
      }
      if (iVar10 < 1) {
        uStack_2c._0_4_ = (undefined4 ***)0xeaa0ac;
        (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),0xffffffff);
      }
      else {
        iVar10 = 0;
        if (*(int *)(iVar8 + 0x44) != 0) {
          iVar10 = *(int *)(*(int *)(iVar8 + 0x44) + -4);
        }
        if (iVar10 < 1) {
          uStack_2c._0_4_ = (undefined4 ***)0xeaa096;
          (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),0xffffffff);
        }
        else {
          piVar9 = *(int **)(param_1 + 0x670);
          uStack_2c._0_4_ = (undefined4 ***)0xea9fea;
          uStack_2c._0_4_ = (undefined4 ***)func_0x007b1014(piVar9);
          uStack_34 = (double)CONCAT44(*(undefined4 *)(iVar8 + 0x58),&UNK_00eab470);
          uStack_3c = (double)CONCAT44(*(undefined4 *)(iVar8 + 0x5c),&UNK_00eab480);
          iStack_40 = *(undefined4 *)(iVar8 + 0x40);
          puStack_44 = &UNK_00eab490;
          piStack_48 = *(int **)(iVar8 + 0x44);
          uStack_4c = 0xa013;
          uStack_4a = 0xea;
          func_0x0040c214(&uStack_78,7);
          piVar1 = piStack_48;
          iVar10 = *piStack_48;
          piStack_48 = (int *)0xeaa01c;
          uVar7 = (**(code **)(iVar10 + 0x3c))(piVar1,uStack_78);
          piStack_48 = (int *)0xeaa028;
          (**(code **)(*piVar9 + 0x170))(piVar9,uVar7);
          piVar9 = *(int **)(param_1 + 0x674);
          piStack_48 = (int *)0xeaa038;
          piStack_48 = (int *)func_0x007b1014(piVar9);
          uStack_4c = (ushort)*(undefined4 *)(iVar8 + 0x58);
          uStack_4a = (undefined2)((uint)*(undefined4 *)(iVar8 + 0x58) >> 0x10);
          puStack_50 = &UNK_00eab470;
          pcStack_54 = *(code **)(iVar8 + 0x5c);
          ppuStack_58 = (undefined **)&UNK_00eab480;
          puStack_5c = *(undefined **)(iVar8 + 0x40);
          puStack_60 = &UNK_00eab490;
          piStack_64 = *(int **)(iVar8 + 0x44);
          uStack_68 = 0xeaa061;
          func_0x0040c214(&uStack_7c,7);
          piVar1 = piStack_64;
          iVar8 = *piStack_64;
          piStack_64 = (int *)0xeaa06a;
          uVar7 = (**(code **)(iVar8 + 0x3c))(piVar1,uStack_7c);
          piStack_64 = (int *)0xeaa076;
          (**(code **)(*piVar9 + 0x170))(piVar9,uVar7);
          piStack_64 = (int *)0xeaa080;
          func_0x00ea5bd0(param_1,0);
        }
      }
    }
  }
  uStack_2c._0_4_ = (undefined4 ***)0xeaa0c7;
  func_0x011ca688();
  pcStack_54 = (code *)in_ST0;
  puStack_50 = (undefined *)((unkuint10)in_ST0 >> 0x20);
  uStack_4c = (ushort)((unkuint10)in_ST0 >> 0x40);
  uStack_2c = (double)CONCAT44(uStack_2c._4_4_,(uint)uStack_4c);
  uStack_34 = (double)in_ST0;
  uStack_3c = (double)CONCAT44(0xeaa0e3,(undefined4)uStack_3c);
  func_0x00430914(_DAT_0124f788,&uStack_80);
  uStack_3c = (double)CONCAT44(0xeaa0ee,(undefined4)uStack_3c);
  func_0x00eafe78(param_1,uStack_80);
  uStack_3c._0_4_ = SUB84((double)in_ST1,0);
  uStack_3c = (double)CONCAT44(0xeaa100,(undefined4)uStack_3c);
  iVar8 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x670));
  uVar13 = extraout_EDX == 0;
  if ((bool)uVar13) {
    uVar13 = true;
    if (iVar8 == 0) goto LAB_00eaa160;
LAB_00eaa10e:
    uStack_3c = (double)CONCAT44(0xeaa11c,(undefined4)uStack_3c);
    puStack_20 = (undefined1 *)func_0x007adbdc(*(undefined4 *)(param_1 + 0x670));
    uStack_3c = (double)CONCAT44(0xeaa124,(undefined4)uStack_3c);
    func_0x011ca688();
    uStack_2c = (double)in_ST2;
    uVar13 = puStack_20 == (undefined1 *)0x1;
    if ((bool)uVar13) {
      iStack_40 = 0xeaa139;
      func_0x009b0d84();
      uStack_34 = (double)in_ST3;
    }
    else {
      uStack_88 = uStack_3c - (double)(int)puStack_20;
      iStack_40 = 0xeaa15a;
      uStack_3c = uStack_88;
      func_0x009b0d84();
      uStack_34 = (double)in_ST3;
    }
  }
  else {
    if (0 < extraout_EDX) goto LAB_00eaa10e;
LAB_00eaa160:
    uStack_3c = (double)CONCAT44(&puStack_20,0xeaa172);
    func_0x00eb3fac(param_1,&uStack_2c,&uStack_34);
  }
  uStack_2c = (double)(_DAT_00eab49c + (float10)uStack_2c);
  iStack_40 = 0xeaa18b;
  func_0x0040afd4(0x125a324);
  iStack_40 = 0xeaa193;
  func_0x00eb4234(param_1);
  iStack_40 = (int)register0x00000010 + -0x14;
  puStack_44 = (undefined *)0xeaa1aa;
  func_0x0079acec(_DAT_0125a334,CONCAT22(extraout_var_02,0x3a),1);
  puStack_44 = (undefined *)0xeaa1b7;
  func_0x0040c324(unaff_EBX,&UNK_00eab4b4);
  if ((bool)uVar13) {
    puStack_44 = (undefined *)0xeaa1ce;
    (**(code **)(**(int **)(param_1 + 0x65c) + 0x178))();
    puStack_44 = (undefined *)0xeaa1df;
    (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
    puStack_44 = (undefined *)0xeaa1e9;
    (**(code **)(*_DAT_0125a2a8 + 0x48))();
    puStack_44 = (undefined *)0xeaa1f3;
    (**(code **)(*_DAT_0125a2ac + 0x48))();
    puStack_44 = (undefined *)0xeaa1fd;
    func_0x009b60ec(&UNK_00eab4c8);
    puStack_44 = (undefined *)0x0;
    piStack_48 = (int *)0x15;
    uStack_4c = 0;
    uStack_4a = 0;
    puStack_50 = (undefined *)0x2;
    pcStack_54 = _DAT_0125a328;
    ppuStack_58 = (undefined **)0x0;
    puStack_5c = (undefined *)0xeaa21b;
    func_0x0042cfdc(puStack_20,&puStack_8c);
    puStack_5c = puStack_8c;
    puStack_60 = (undefined *)0x0;
    piStack_64 = (int *)uStack_2c._4_4_;
    uStack_68 = (undefined4 ***)uStack_2c;
    uStack_6c = uStack_34._4_4_;
    uStack_70 = (undefined4 **)uStack_34;
    uStack_74 = 0xeaa240;
    func_0x00ebc24c(param_1,_DAT_0125a2ac,0);
    uStack_74 = 0xeaa257;
    (**(code **)(*(int *)(param_1 + 0x5d4) + 0x308))
              (*(undefined4 *)(*(int *)(param_1 + 0x5d4) + 0x30c),0);
    uStack_74 = uStack_2c._4_4_;
    uStack_78 = (undefined4 ***)uStack_2c;
    uStack_7c = uStack_34._4_4_;
    uStack_80 = (undefined4 **)uStack_34;
    uStack_88._0_4_ = 0xeaa280;
    uStack_88._4_4_ = _DAT_0125a328;
    func_0x00c86560(_DAT_0125a2a8,*(undefined4 *)(*_DAT_0124f2e0 + 4),puStack_20);
    uStack_88._0_4_ = 0xeaa290;
    func_0x006025b0(*(undefined4 *)(param_1 + 0x5d0),1);
    uStack_88._0_4_ = 0xeaa2a0;
    func_0x006025b0(*(undefined4 *)(param_1 + 0x660),1);
    if (*(int *)(*(int *)(param_1 + 0x65c) + 0x5c) < 0x14) {
      uStack_88._0_4_ = 0xeaa2b9;
      func_0x006019e4(*(int *)(param_1 + 0x65c),0x32);
    }
    uStack_88._0_4_ = 0xeaa2c3;
    iVar8 = (**(code **)(*_DAT_0125a2a8 + 0x14))();
    if (0 < iVar8) {
      uStack_88._0_4_ = 0xeaa2e2;
      (**(code **)(*(int *)(param_1 + 0x5d4) + 0x308))
                (*(undefined4 *)(*(int *)(param_1 + 0x5d4) + 0x30c),0);
      uStack_88._0_4_ = 0xeaa2f0;
      piVar9 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x65c));
      uStack_88._0_4_ = 0xeaa2f5;
      iVar8 = (**(code **)(*piVar9 + 0x14))();
      if (0 < iVar8) {
        uStack_88._0_4_ = 0xeaa30c;
        (**(code **)(**(int **)(param_1 + 0x65c) + 0x170))(*(int **)(param_1 + 0x65c),0);
        uStack_88._0_4_ = 0xeaa31c;
        func_0x006025b0(*(undefined4 *)(param_1 + 0x5cc),1);
        uStack_88._0_4_ = 0xeaa32c;
        func_0x006025b0(*(undefined4 *)(param_1 + 0x5d0),1);
        uStack_88._0_4_ = 0xeaa33c;
        func_0x0060cdec(*(undefined4 *)(param_1 + 0x65c),1);
        if (*(int *)(*(int *)(param_1 + 0x648) + 0x5c) < 0x96) {
          uStack_88._0_4_ = 0xeaa358;
          func_0x006019e4(*(int *)(param_1 + 0x648),0x96);
        }
      }
    }
    piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
    uStack_88._0_4_ = 0xeaa373;
    (**(code **)(*piVar9 + 100))(piVar9,0,&UNK_00eab528);
    uVar13 = 1;
    uStack_88 = (double)CONCAT44(uStack_88._4_4_,0xeaa389);
    (**(code **)(**(int **)(*(int *)(param_1 + 0x4f0) + 0x330) + 0x4c))();
  }
  else {
    puStack_44 = (undefined *)0xeaa39b;
    func_0x0040c324(unaff_EBX,&UNK_00eab538);
    if ((bool)uVar13) {
      puStack_44 = (undefined *)0xeaa3b2;
      (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
      puStack_44 = (undefined *)0xeaa3bc;
      (**(code **)(*_DAT_0125a2a8 + 0x48))();
      puStack_44 = (undefined *)0xeaa3c6;
      (**(code **)(*_DAT_0125a2ac + 0x48))();
      puStack_44 = (undefined *)0xeaa3d0;
      func_0x009b60ec(&UNK_00eab548);
      puStack_44 = (undefined *)0x0;
      piStack_48 = (int *)0x3;
      uStack_4c = 0;
      uStack_4a = 0;
      puStack_50 = (undefined *)0x3;
      pcStack_54 = _DAT_0125a328;
      ppuStack_58 = (undefined **)0x0;
      puStack_5c = (undefined *)0x0;
      puStack_60 = (undefined *)0x0;
      piStack_64 = (int *)uStack_2c._4_4_;
      uStack_68 = (undefined4 ***)uStack_2c;
      uStack_6c = uStack_34._4_4_;
      uStack_70 = (undefined4 **)uStack_34;
      uStack_74 = 0xeaa400;
      func_0x00ebc24c(param_1,_DAT_0125a2ac,0);
      uStack_74 = 0xeaa417;
      (**(code **)(*(int *)(param_1 + 0x5d4) + 0x308))
                (*(undefined4 *)(*(int *)(param_1 + 0x5d4) + 0x30c),0);
      uStack_74 = uStack_2c._4_4_;
      uStack_78 = (undefined4 ***)uStack_2c;
      uStack_7c = uStack_34._4_4_;
      uStack_80 = (undefined4 **)uStack_34;
      uStack_88 = (double)CONCAT44(0xeaa43d,(undefined4)uStack_88);
      rLabs_Interim(_DAT_0125a2a8,*(undefined4 *)(*_DAT_0124f2e0 + 4),_DAT_0125a328);
      uStack_88 = (double)CONCAT44(0xeaa447,(undefined4)uStack_88);
      iVar8 = (**(code **)(*_DAT_0125a2a8 + 0x14))();
      if (iVar8 < 1) {
        uStack_88 = (double)CONCAT44(0xeaa459,(undefined4)uStack_88);
        (**(code **)(*_DAT_0125a2a8 + 0x3c))(_DAT_0125a2a8,&UNK_00eab5a0);
      }
      uStack_88 = (double)CONCAT44(0xeaa467,(undefined4)uStack_88);
      iVar8 = func_0x00668488(*(undefined4 *)(param_1 + 0x5d4));
      if (iVar8 < 1) {
        uStack_88 = (double)CONCAT44(0xeaa47d,(undefined4)uStack_88);
        func_0x009b3d64(_DAT_0125a2a8,*(undefined4 *)(param_1 + 0x4f0));
      }
      piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
      uStack_88 = (double)CONCAT44(0xeaa498,(undefined4)uStack_88);
      (**(code **)(*piVar9 + 100))(piVar9,0,&UNK_00eab528);
      piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
      uStack_88 = (double)CONCAT44(0xeaa4ae,(undefined4)uStack_88);
      (**(code **)(*piVar9 + 0x4c))(piVar9,0);
      uVar13 = 1;
      uStack_88 = (double)CONCAT44(0xeaa4c1,(undefined4)uStack_88);
      (**(code **)(**(int **)(param_1 + 0x4f0) + 0x18c))();
    }
    else {
      puStack_44 = (undefined *)0xeaa4d3;
      func_0x0040c324(unaff_EBX,&UNK_00eab5f0);
      if ((bool)uVar13) {
        puStack_44 = (undefined *)0xeaa4ea;
        (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
        puStack_44 = (undefined *)0xeaa4f4;
        (**(code **)(*_DAT_0125a2a8 + 0x48))();
        puStack_44 = (undefined *)0xeaa4fe;
        (**(code **)(*_DAT_0125a2ac + 0x48))();
        puStack_44 = (undefined *)0xeaa508;
        func_0x009b60ec(&UNK_00eab600);
        puStack_44 = (undefined *)uStack_2c._4_4_;
        piStack_48 = (int *)(undefined4 ***)uStack_2c;
        uStack_4c = (ushort)((ulonglong)uStack_34 >> 0x20);
        uStack_4a = (undefined2)((ulonglong)uStack_34 >> 0x30);
        puStack_50 = (undefined *)(undefined4 **)uStack_34;
        pcStack_54 = (code *)0xeaa522;
        uVar7 = func_0x007b1014(*(undefined4 *)(param_1 + 0x5b8));
        pcStack_54 = (code *)0xeaa538;
        rLabs_setInterimSelect(_DAT_0125a2a8,*(undefined4 *)(*_DAT_0124f2e0 + 4),uVar7);
        pcStack_54 = (code *)0xeaa542;
        iVar8 = (**(code **)(*_DAT_0125a2a8 + 0x14))();
        if (iVar8 < 1) {
          piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
          pcStack_54 = (code *)0xeaa574;
          (**(code **)(*piVar9 + 0x3c))(piVar9,&UNK_00eab658);
        }
        else {
          pcStack_54 = (code *)0xeaa559;
          func_0x009b3d64(_DAT_0125a2a8,*(undefined4 *)(param_1 + 0x4f0));
        }
        uVar13 = 1;
        pcStack_54 = (code *)0xeaa587;
        (**(code **)(**(int **)(param_1 + 0x4f0) + 0x18c))();
      }
      else {
        puStack_44 = (undefined *)0xeaa599;
        func_0x0040c324(unaff_EBX,&UNK_00eab6cc);
        if ((bool)uVar13) {
          puStack_44 = (undefined *)0xeaa5b5;
          func_0x008235c0(*(undefined4 *)(*(int *)(param_1 + 0x560) + 0x430),1);
          puStack_44 = (undefined *)0xeaa5c8;
          (**(code **)(**(int **)(param_1 + 0x51c) + 0x170))(*(int **)(param_1 + 0x51c),0);
          puStack_44 = (undefined *)0xeaa5db;
          (**(code **)(**(int **)(param_1 + 0x514) + 0x170))(*(int **)(param_1 + 0x514),0);
          puStack_44 = (undefined *)0xeaa5ec;
          (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
          puStack_44 = (undefined *)0xeaa5f6;
          (**(code **)(*_DAT_0125a2a8 + 0x48))();
          puStack_44 = (undefined *)0xeaa600;
          (**(code **)(*_DAT_0125a2ac + 0x48))();
          puStack_44 = (undefined *)0xeaa610;
          func_0x006015e8(*(undefined4 *)(param_1 + 0x550),5);
          puStack_44 = (undefined *)0xeaa61a;
          func_0x009b60ec(&UNK_00eab6dc);
          puStack_44 = (undefined *)uStack_2c._4_4_;
          piStack_48 = (int *)(undefined4 ***)uStack_2c;
          uStack_4c = (ushort)((ulonglong)uStack_34 >> 0x20);
          uStack_4a = (undefined2)((ulonglong)uStack_34 >> 0x30);
          puStack_50 = (undefined *)(undefined4 **)uStack_34;
          pcStack_54 = (code *)0xeaa634;
          pcStack_54 = (code *)func_0x007b1014(*(undefined4 *)(param_1 + 0x5b8));
          ppuStack_58 = &puStack_90;
          puStack_5c = (undefined *)0xeaa650;
          func_0x006026ac(*(undefined4 *)(param_1 + 0x5ac),&puStack_94);
          puStack_5c = (undefined *)0xeaa664;
          func_0x0079acec(puStack_94,CONCAT22(extraout_var_03,0x5e),1);
          puStack_5c = (undefined *)0xeaa67e;
          func_0x00c86d9c(_DAT_0125a2a0,*(undefined4 *)(*_DAT_0124f2e0 + 4),puStack_90);
          uVar13 = *(int *)(*(int *)(param_1 + 0x510) + 0x2e0) == 0;
          if ((bool)uVar13) {
            puStack_5c = (undefined *)0xeaa69e;
            func_0x00eac294(param_1,_DAT_0125a2a0);
          }
          else {
            puStack_5c = (undefined *)0xeaa6ae;
            func_0x00eaca0c(param_1,_DAT_0125a2a0);
          }
          puStack_5c = (undefined *)0xeaa6bc;
          func_0x00eabd04(param_1,_DAT_0125a2a0);
          puStack_5c = (undefined *)0xeaa6ca;
          func_0x00ead170(param_1,_DAT_0125a2a0);
          puStack_5c = (undefined *)0xeaa6d5;
          func_0x00eb0c24(param_1,param_1);
        }
        else {
          puStack_44 = (undefined *)0xeaa6e7;
          func_0x0040c324(unaff_EBX,&UNK_00eab72c);
          if ((bool)uVar13) {
            uVar13 = 0;
            if (DAT_0125a31d == '\0') {
              uStack_88._0_4_ = 0xeaa710;
              func_0x008235c0(*(undefined4 *)(*(int *)(param_1 + 0x560) + 0x430),1);
              uStack_88._0_4_ = 0xeaa723;
              (**(code **)(**(int **)(param_1 + 0x530) + 0x170))(*(int **)(param_1 + 0x530),0);
              uStack_88._0_4_ = 0xeaa72e;
              func_0x00eb279c(param_1,param_1);
              uStack_88._0_4_ = 0xeaa73f;
              (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
              uStack_88._0_4_ = 0xeaa749;
              (**(code **)(*_DAT_0125a2a8 + 0x48))();
              uStack_88._0_4_ = 0xeaa753;
              (**(code **)(*_DAT_0125a2ac + 0x48))();
              uStack_88._0_4_ = 0xeaa75f;
              piVar9 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
              uStack_88 = (double)CONCAT44(uStack_88._4_4_,(int)register0x00000010 + -4);
              puStack_8c = &UNK_00eaaadd;
              puStack_90 = (undefined *)*in_FS_OFFSET;
              *in_FS_OFFSET = (int)&puStack_90;
              puStack_94 = (undefined4 *)0xeaa77a;
              func_0x009b60ec(&UNK_00eab73c);
              puStack_94 = uStack_2c._4_4_;
              ppuStack_98 = (undefined4 ***)uStack_2c;
              puStack_9c = uStack_34._4_4_;
              ppuStack_a0 = (undefined4 **)uStack_34;
              UNRECOVERED_JUMPTABLE_00 = (code **)&ppuStack_98;
              UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeaa7a1;
              func_0x006026ac(*(undefined4 *)(param_1 + 0x5b0),&puStack_9c);
              UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeaa7b5;
              func_0x0079acec(puStack_9c,CONCAT22(extraout_var_04,0x5e),1);
              UNRECOVERED_JUMPTABLE = (undefined4 ***)ppuStack_98;
              pppuStack_ac = &ppuStack_a0;
              ppppuStack_b0 = (undefined4 ****)0xeaa7d7;
              func_0x006026ac(*(undefined4 *)(param_1 + 0x5ac),&UNRECOVERED_JUMPTABLE_00);
              ppppuStack_b0 = (undefined4 ****)0xeaa7eb;
              func_0x0079acec(UNRECOVERED_JUMPTABLE_00,CONCAT22(extraout_var_05,0x5e),1);
              ppppuStack_b0 = (undefined4 ****)0xeaa803;
              func_0x00c87400(piVar9,*(undefined4 *)(*_DAT_0124f2e0 + 4),ppuStack_a0);
              ppppuStack_b0 = (undefined4 ****)0xeaa80b;
              iVar8 = (**(code **)(*piVar9 + 0x14))();
              if (iVar8 < 2) {
                uVar11 = *(int *)(*(int *)(param_1 + 0x560) + 0x58) -
                         *(int *)(*(int *)(param_1 + 0x558) + 0x58);
                iVar8 = (int)uVar11 >> 1;
                if (iVar8 < 0) {
                  iVar8 = iVar8 + (uint)((uVar11 & 1) != 0);
                }
                iVar8 = iVar8 + *(int *)(*(int *)(param_1 + 0x560) + 0x50);
                uVar13 = iVar8 == 0;
                ppppuStack_b0 = (undefined4 ****)0xeaa942;
                func_0x00601944(*(int *)(param_1 + 0x558),iVar8);
                ppppuStack_b0 = (undefined4 ****)0xeaa955;
                func_0x00601978(*(undefined4 *)(param_1 + 0x558),2);
                ppppuStack_b0 = (undefined4 ****)0xeaa965;
                func_0x006025b0(*(undefined4 *)(param_1 + 0x558),1);
                ppppuStack_b0 = &pppuStack_b8;
                puStack_b4 = (undefined *)0xeaa980;
                func_0x006026ac(*(undefined4 *)(param_1 + 0x5ac),&ppuStack_bc);
                puStack_b4 = (undefined *)0xeaa994;
                func_0x0079acec(ppuStack_bc,CONCAT22(extraout_var_07,0x5e),1);
                puStack_b4 = (undefined *)0xeaa9a4;
                func_0x0040c324(pppuStack_b8,&UNK_00eab7c8);
                if ((bool)uVar13) {
                  puStack_b4 = &UNK_00eab7d8;
                  pppuStack_b8 = &ppuStack_c4;
                  ppuStack_bc = (undefined4 **)0xeaa9c6;
                  func_0x006026ac(*(undefined4 *)(param_1 + 0x5b0),&puStack_c8);
                  ppuStack_bc = (undefined4 **)0xeaa9da;
                  func_0x0079acec(puStack_c8,CONCAT22(extraout_var_08,0x5e),2);
                  ppuStack_bc = ppuStack_c4;
                  puStack_c0 = &UNK_00eab824;
                  ppuStack_c4 = (undefined4 **)&UNK_00eab860;
                  puStack_c8 = (undefined4 *)0xeaa9fa;
                  func_0x0040c214(&puStack_c0,4);
                  puStack_c8 = (undefined4 *)0xeaaa0e;
                  func_0x006026fc(*(undefined4 *)(param_1 + 0x554),puStack_c0);
                }
                else {
                  puStack_b4 = &UNK_00eab7d8;
                  pppuStack_b8 = &ppuStack_d0;
                  ppuStack_bc = (undefined4 **)0xeaaa33;
                  func_0x006026ac(*(undefined4 *)(param_1 + 0x5b0),&pcStack_d4);
                  ppuStack_bc = (undefined4 **)0xeaaa47;
                  func_0x0079acec(pcStack_d4,CONCAT22(extraout_var_09,0x5e),2);
                  ppuStack_bc = ppuStack_d0;
                  puStack_c0 = &UNK_00eab90c;
                  ppuStack_c4 = &puStack_d8;
                  puStack_c8 = (undefined4 *)0xeaaa6d;
                  func_0x006026ac(*(undefined4 *)(param_1 + 0x5ac),&uStack_dc);
                  puStack_c8 = (undefined4 *)0xeaaa81;
                  func_0x0079acec(uStack_dc,CONCAT22(extraout_var_10,0x5e),2);
                  puStack_c8 = puStack_d8;
                  puStack_cc = &UNK_00eab920;
                  ppuStack_d0 = (undefined4 **)&UNK_00eab860;
                  pcStack_d4 = (code *)0xeaaaa1;
                  func_0x0040c214(&puStack_cc,6);
                  pcStack_d4 = (code *)0xeaaab5;
                  func_0x006026fc(*(undefined4 *)(param_1 + 0x554),puStack_cc);
                }
                puStack_c8 = (undefined4 *)0xeaaac5;
                func_0x006025b0(*(undefined4 *)(param_1 + 0x560),0);
              }
              else {
                ppppuStack_b0 = (undefined4 ****)0xeaa822;
                func_0x006025b0(*(undefined4 *)(param_1 + 0x560),1);
                ppppuStack_b0 = (undefined4 ****)0xeaa836;
                func_0x006026ac(*(undefined4 *)(param_1 + 0x5b0),&UNRECOVERED_JUMPTABLE);
                ppppuStack_b0 = (undefined4 ****)0xeaa847;
                func_0x00eb0104(param_1,UNRECOVERED_JUMPTABLE,piVar9);
                ppppuStack_b0 = &pppuStack_ac;
                puStack_b4 = (undefined *)0xeaa85e;
                (**(code **)(*piVar9 + 0xc))(piVar9,0,&ppppuStack_b0);
                puStack_b4 = (undefined *)0xeaa872;
                func_0x0079acec(ppppuStack_b0,CONCAT22(extraout_var_06,0x5e),1);
                puStack_b4 = (undefined *)0xeaa87d;
                iVar8 = func_0x0042d1fc(pppuStack_ac);
                iVar8 = iVar8 + 1;
                puStack_b4 = (undefined *)0xeaa888;
                iVar10 = (**(code **)(*piVar9 + 0x14))();
                if (iVar8 <= iVar10 + -1) {
                  iVar10 = ((iVar10 + -1) - iVar8) + 1;
                  do {
                    puStack_b4 = (undefined *)0xeaa8a0;
                    (**(code **)(*piVar9 + 0xc))(piVar9,iVar8,&puStack_b4);
                    puVar2 = puStack_b4;
                    piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                    puStack_b4 = (undefined *)0xeaa8ba;
                    (**(code **)(*piVar1 + 0x3c))(piVar1,puVar2);
                    iVar8 = iVar8 + 1;
                    iVar10 = iVar10 + -1;
                  } while (iVar10 != 0);
                }
                puStack_b4 = (undefined *)0xeaa8d2;
                iVar8 = (**(code **)(**(int **)(*(int *)(param_1 + 0x4f0) + 0x330) + 0x14))();
                if (iVar8 < 2) {
                  piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                  puStack_b4 = (undefined *)0xeaa8f0;
                  (**(code **)(*piVar1 + 0x3c))(piVar1,&UNK_00eab784);
                }
                puStack_b4 = (undefined *)0xeaa903;
                (**(code **)(**(int **)(param_1 + 0x4f0) + 0x18c))(*(int **)(param_1 + 0x4f0),0);
                puStack_b4 = (undefined *)0xeaa913;
                func_0x006025b0(*(undefined4 *)(param_1 + 0x558),0);
              }
              pppuVar3 = UNRECOVERED_JUMPTABLE;
              *in_FS_OFFSET = (int)ppppuStack_b0;
              UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeaaf18;
              pppuStack_ac = (undefined4 ***)0xeaaada;
              func_0x004090bc(piVar9,ppppuStack_b0,pppuVar3);
                    /* WARNING: Could not recover jumptable at 0x00eaaadb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
              (*(code *)UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
              return;
            }
          }
          else {
            uStack_88._0_4_ = 0xeaaaf1;
            func_0x0040c324(unaff_EBX,&UNK_00eab95c);
            if ((bool)uVar13) {
              uStack_88._0_4_ = 0xeaab08;
              (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
              uStack_88._0_4_ = 0xeaab12;
              (**(code **)(*_DAT_0125a2a8 + 0x48))();
              uStack_88._0_4_ = 0xeaab1c;
              (**(code **)(*_DAT_0125a2ac + 0x48))();
              uStack_88._0_4_ = 0xeaab26;
              func_0x009b60ec(&UNK_00eab96c);
              uStack_88 = (double)(ZEXT48(uStack_88._4_4_) << 0x20);
              puStack_8c = (undefined *)0x4;
              puStack_90 = (undefined *)0x0;
              puStack_94 = (undefined4 *)0x4;
              ppuStack_98 = (undefined4 **)_DAT_0125a328;
              puStack_9c = (undefined4 *)0x0;
              ppuStack_a0 = (undefined4 **)0x0;
              UNRECOVERED_JUMPTABLE_00 = (code **)0x0;
              UNRECOVERED_JUMPTABLE = uStack_2c._4_4_;
              pppuStack_ac = (undefined4 ***)uStack_2c;
              ppppuStack_b0 = (undefined4 ****)uStack_34._4_4_;
              puStack_b4 = (undefined *)(undefined4 **)uStack_34;
              pppuStack_b8 = (undefined4 ***)0xeaab56;
              func_0x00ebc24c(param_1,_DAT_0125a2ac,0);
              pppuStack_b8 = (undefined4 ***)0xeaab6d;
              (**(code **)(*(int *)(param_1 + 0x5d4) + 0x308))
                        (*(undefined4 *)(*(int *)(param_1 + 0x5d4) + 0x30c),0);
              pppuStack_b8 = uStack_2c._4_4_;
              ppuStack_bc = (undefined4 ***)uStack_2c;
              puStack_c0 = (undefined *)uStack_34._4_4_;
              ppuStack_c4 = (undefined4 **)uStack_34;
              puStack_c8 = (undefined4 *)0xeaab93;
              func_0x00c86a24(_DAT_0125a2a8,*(undefined4 *)(*_DAT_0124f2e0 + 4),_DAT_0125a328);
              puStack_c8 = (undefined4 *)0xeaab9d;
              iVar8 = (**(code **)(*_DAT_0125a2a8 + 0x14))();
              if (iVar8 < 1) {
                puStack_c8 = (undefined4 *)0xeaabaf;
                (**(code **)(*_DAT_0125a2a8 + 0x3c))(_DAT_0125a2a8,&UNK_00eab9b8);
              }
              puStack_c8 = (undefined4 *)0xeaabbd;
              iVar8 = func_0x00668488(*(undefined4 *)(param_1 + 0x5d4));
              if (iVar8 < 1) {
                puStack_c8 = (undefined4 *)0xeaabd3;
                func_0x009b3d64(_DAT_0125a2a8,*(undefined4 *)(param_1 + 0x4f0));
              }
              piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
              puStack_c8 = (undefined4 *)0xeaabee;
              (**(code **)(*piVar9 + 100))(piVar9,0,&UNK_00eab528);
              piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
              puStack_c8 = (undefined4 *)0xeaac04;
              (**(code **)(*piVar9 + 0x4c))(piVar9,0);
              uVar13 = 1;
              puStack_c8 = (undefined4 *)0xeaac17;
              (**(code **)(**(int **)(param_1 + 0x4f0) + 0x18c))();
            }
            else {
              uStack_88._0_4_ = 0xeaac29;
              func_0x0040c324(unaff_EBX,&UNK_00eaba24);
              if ((bool)uVar13) {
                uStack_88._0_4_ = 0xeaac40;
                (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
                uStack_88._0_4_ = 0xeaac4a;
                (**(code **)(*_DAT_0125a2a8 + 0x48))();
                uStack_88._0_4_ = 0xeaac54;
                (**(code **)(*_DAT_0125a2ac + 0x48))();
                uStack_88._0_4_ = 0xeaac5e;
                func_0x009b60ec(&UNK_00eaba38);
                uStack_88 = (double)(ZEXT48(uStack_88._4_4_) << 0x20);
                puStack_8c = (undefined *)0xa;
                puStack_90 = (undefined *)0x0;
                puStack_94 = (undefined4 *)0x1;
                ppuStack_98 = (undefined4 **)_DAT_0125a328;
                puStack_9c = (undefined4 *)0x0;
                ppuStack_a0 = (undefined4 **)0xeaac7c;
                func_0x0042cfdc(puStack_20,&puStack_e0);
                ppuStack_a0 = (undefined4 **)puStack_e0;
                UNRECOVERED_JUMPTABLE_00 = (code **)0x0;
                UNRECOVERED_JUMPTABLE = uStack_2c._4_4_;
                pppuStack_ac = (undefined4 ***)uStack_2c;
                ppppuStack_b0 = (undefined4 ****)uStack_34._4_4_;
                puStack_b4 = (undefined *)(undefined4 **)uStack_34;
                pppuStack_b8 = (undefined4 ***)0xeaaca1;
                func_0x00ebc24c(param_1,_DAT_0125a2ac,0);
                pppuStack_b8 = (undefined4 ***)0xeaacb8;
                (**(code **)(*(int *)(param_1 + 0x5d4) + 0x308))
                          (*(undefined4 *)(*(int *)(param_1 + 0x5d4) + 0x30c),0);
                pppuStack_b8 = (undefined4 ***)0x0;
                ppuStack_bc = (undefined4 **)0xeaacc8;
                func_0x0042cfdc(puStack_20,&ppuStack_e4);
                ppuStack_bc = ppuStack_e4;
                puStack_c0 = (undefined *)0x0;
                ppuStack_c4 = uStack_2c._4_4_;
                puStack_c8 = (undefined4 ***)uStack_2c;
                puStack_cc = (undefined *)uStack_34._4_4_;
                ppuStack_d0 = (undefined4 **)uStack_34;
                pcStack_d4 = _DAT_0125a328;
                puStack_d8 = (undefined4 *)0xeaacfc;
                func_0x00c86e6c(_DAT_0125a2a8,*(undefined4 *)(*_DAT_0124f2e0 + 4),&UNK_00eaba80);
                puStack_d8 = (undefined4 *)0xeaad06;
                iVar8 = (**(code **)(*_DAT_0125a2a8 + 0x14))();
                if (iVar8 < 1) {
                  puStack_d8 = (undefined4 *)0xeaad18;
                  (**(code **)(*_DAT_0125a2a8 + 0x3c))(_DAT_0125a2a8,&UNK_00eaba98);
                }
                puStack_d8 = (undefined4 *)0xeaad26;
                iVar8 = func_0x00668488(*(undefined4 *)(param_1 + 0x5d4));
                if (iVar8 < 1) {
                  puStack_d8 = (undefined4 *)0xeaad3c;
                  func_0x009b3d64(_DAT_0125a2a8,*(undefined4 *)(param_1 + 0x4f0));
                }
                piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                puStack_d8 = (undefined4 *)0xeaad57;
                (**(code **)(*piVar9 + 100))(piVar9,0,&UNK_00eab528);
                piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                puStack_d8 = (undefined4 *)0xeaad6d;
                (**(code **)(*piVar9 + 0x4c))(piVar9,0);
                uVar13 = 1;
                puStack_d8 = (undefined4 *)0xeaad80;
                (**(code **)(**(int **)(param_1 + 0x4f0) + 0x18c))();
              }
              else {
                uStack_88._0_4_ = 0xeaad96;
                (**(code **)(**(int **)(param_1 + 0x65c) + 0x178))();
                uStack_88._0_4_ = 0xeaada7;
                (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
                uStack_88._0_4_ = 0xeaadb1;
                (**(code **)(*_DAT_0125a2a8 + 0x48))();
                uStack_88._0_4_ = 0xeaadbb;
                (**(code **)(*_DAT_0125a2ac + 0x48))();
                uStack_88._0_4_ = 0xeaadc5;
                func_0x009b60ec(&UNK_00eabafc);
                uStack_88 = (double)(ZEXT48(uStack_88._4_4_) << 0x20);
                puStack_8c = (undefined *)0x1;
                puStack_90 = (undefined *)0x0;
                puStack_94 = (undefined4 *)0x1;
                ppuStack_98 = (undefined4 **)_DAT_0125a328;
                puStack_9c = (undefined4 *)0x0;
                ppuStack_a0 = (undefined4 **)0xeaade3;
                func_0x0042cfdc(puStack_20,&puStack_e8);
                ppuStack_a0 = (undefined4 **)puStack_e8;
                UNRECOVERED_JUMPTABLE_00 = (code **)0x0;
                UNRECOVERED_JUMPTABLE = uStack_2c._4_4_;
                pppuStack_ac = (undefined4 ***)uStack_2c;
                ppppuStack_b0 = (undefined4 ****)uStack_34._4_4_;
                puStack_b4 = (undefined *)(undefined4 **)uStack_34;
                pppuStack_b8 = (undefined4 ***)0xeaae08;
                func_0x00ebc24c(param_1,_DAT_0125a2ac,0);
                pppuStack_b8 = (undefined4 ***)0xeaae1f;
                (**(code **)(*(int *)(param_1 + 0x5d4) + 0x308))
                          (*(undefined4 *)(*(int *)(param_1 + 0x5d4) + 0x30c),0);
                pppuStack_b8 = (undefined4 ***)0x0;
                ppuStack_bc = (undefined4 **)0xeaae2f;
                func_0x0042cfdc(puStack_20,&ppuStack_ec);
                ppuStack_bc = ppuStack_ec;
                puStack_c0 = (undefined *)0x0;
                ppuStack_c4 = uStack_2c._4_4_;
                puStack_c8 = (undefined4 ***)uStack_2c;
                puStack_cc = (undefined *)uStack_34._4_4_;
                ppuStack_d0 = (undefined4 **)uStack_34;
                pcStack_d4 = _DAT_0125a328;
                puStack_d8 = &uStack_f4;
                uStack_dc = 0xeaae64;
                func_0x0079acec(_DAT_0125a334,CONCAT22(extraout_var_11,0x5e),1);
                uStack_dc = 0xeaae7a;
                func_0x0040c18c(&uStack_f0,&UNK_00eabb38,uStack_f4);
                uStack_dc = 0xeaae94;
                func_0x00c86e6c(_DAT_0125a2a8,*(undefined4 *)(*_DAT_0124f2e0 + 4),uStack_f0);
                uStack_dc = 0xeaae9e;
                iVar8 = (**(code **)(*_DAT_0125a2a8 + 0x14))();
                if (iVar8 < 1) {
                  uStack_dc = 0xeaaeb0;
                  (**(code **)(*_DAT_0125a2a8 + 0x3c))(_DAT_0125a2a8,&UNK_00eabb4c);
                }
                uStack_dc = 0xeaaebe;
                iVar8 = func_0x00668488(*(undefined4 *)(param_1 + 0x5d4));
                if (iVar8 < 1) {
                  uStack_dc = 0xeaaed4;
                  func_0x009b3d64(_DAT_0125a2a8,*(undefined4 *)(param_1 + 0x4f0));
                }
                piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                uStack_dc = 0xeaaeef;
                (**(code **)(*piVar9 + 100))(piVar9,0,&UNK_00eab528);
                piVar9 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                uStack_dc = 0xeaaf05;
                (**(code **)(*piVar9 + 0x4c))(piVar9,0);
                uVar13 = 1;
                uStack_dc = 0xeaaf18;
                (**(code **)(**(int **)(param_1 + 0x4f0) + 0x18c))();
              }
            }
          }
        }
      }
    }
  }
  uStack_88._0_4_ = 0xeaaf27;
  func_0x0040c324(_DAT_0125a2c4,&UNK_00eabb98);
  if ((bool)uVar13) {
    uStack_88 = (double)CONCAT44(uStack_88._4_4_,&UNK_00eabba8);
    puStack_8c = (undefined *)0xeaaf3e;
    (**(code **)(*_DAT_0125a2a8 + 0x1c))(_DAT_0125a2a8,&puStack_f8);
    puStack_8c = puStack_f8;
    puStack_90 = &UNK_00eabc90;
    puStack_94 = (undefined4 *)0xeaaf58;
    func_0x0040c214(0x125a324,3);
  }
  else {
    uStack_88._0_4_ = 0xeaaf6a;
    (**(code **)(*_DAT_0125a2a8 + 0x1c))(_DAT_0125a2a8,&uStack_fc);
    uStack_88._0_4_ = uStack_fc;
    puStack_8c = (undefined *)0xeaaf82;
    func_0x0040bff4(&uStack_100,_DAT_0125a32c);
    uVar7 = (undefined4)uStack_88;
    uStack_88 = (double)CONCAT44(uStack_88._4_4_,0xeaaf93);
    func_0x0040c18c(0x125a324,uStack_100,uVar7);
  }
  puStack_94 = (undefined4 *)0xeaafa1;
  func_0x00729a50(*_DAT_0124fe08,0);
  if (DAT_0125a2ee == '\0') {
    puStack_94 = (undefined4 *)0xeaafc1;
    (**(code **)(**(int **)(param_1 + 0x628) + 0x170))(*(int **)(param_1 + 0x628),0);
    puStack_94 = (undefined4 *)0xeaafd4;
    (**(code **)(**(int **)(param_1 + 0x610) + 0x170))(*(int **)(param_1 + 0x610),0);
    puStack_94 = (undefined4 *)0xeaafe7;
    (**(code **)(**(int **)(param_1 + 0x614) + 0x170))(*(int **)(param_1 + 0x614),0);
    puStack_94 = (undefined4 *)0xeaaffa;
    (**(code **)(**(int **)(param_1 + 0x618) + 0x170))(*(int **)(param_1 + 0x618),0);
    puStack_94 = (undefined4 *)0xeab00d;
    (**(code **)(**(int **)(param_1 + 0x61c) + 0x170))(*(int **)(param_1 + 0x61c),0);
    puStack_94 = (undefined4 *)0xeab020;
    (**(code **)(**(int **)(param_1 + 0x620) + 0x170))(*(int **)(param_1 + 0x620),0);
    puStack_94 = (undefined4 *)0xeab033;
    (**(code **)(**(int **)(param_1 + 0x624) + 0x170))(*(int **)(param_1 + 0x624),0);
    puStack_94 = (undefined4 *)0xeab044;
    iVar8 = (**(code **)(**(int **)(param_1 + 0x670) + 0x16c))();
    if (iVar8 == 1) {
      puStack_94 = (undefined4 *)0xeab05a;
      (**(code **)(**(int **)(param_1 + 0x628) + 0x170))(*(int **)(param_1 + 0x628),1);
    }
    puStack_94 = (undefined4 *)0xeab06b;
    iVar8 = (**(code **)(**(int **)(param_1 + 0x670) + 0x16c))();
    if (iVar8 == 2) {
      puStack_94 = (undefined4 *)0xeab083;
      (**(code **)(**(int **)(param_1 + 0x610) + 0x170))(*(int **)(param_1 + 0x610),1);
    }
    puStack_94 = (undefined4 *)0xeab094;
    iVar8 = (**(code **)(**(int **)(param_1 + 0x670) + 0x16c))();
    if (iVar8 == 3) {
      puStack_94 = (undefined4 *)0xeab0ac;
      (**(code **)(**(int **)(param_1 + 0x614) + 0x170))(*(int **)(param_1 + 0x614),1);
    }
    puStack_94 = (undefined4 *)0xeab0bd;
    iVar8 = (**(code **)(**(int **)(param_1 + 0x670) + 0x16c))();
    if (iVar8 == 4) {
      puStack_94 = (undefined4 *)0xeab0d5;
      (**(code **)(**(int **)(param_1 + 0x618) + 0x170))(*(int **)(param_1 + 0x618),1);
    }
    puStack_94 = (undefined4 *)0xeab0e6;
    iVar8 = (**(code **)(**(int **)(param_1 + 0x670) + 0x16c))();
    if (iVar8 == 5) {
      puStack_94 = (undefined4 *)0xeab0fe;
      (**(code **)(**(int **)(param_1 + 0x61c) + 0x170))(*(int **)(param_1 + 0x61c),1);
    }
    puStack_94 = (undefined4 *)0xeab10f;
    iVar8 = (**(code **)(**(int **)(param_1 + 0x670) + 0x16c))();
    if (iVar8 == 6) {
      puStack_94 = (undefined4 *)0xeab127;
      (**(code **)(**(int **)(param_1 + 0x620) + 0x170))(*(int **)(param_1 + 0x620),1);
    }
    puStack_94 = (undefined4 *)0xeab138;
    iVar8 = (**(code **)(**(int **)(param_1 + 0x670) + 0x16c))();
    if (iVar8 == 7) {
      puStack_94 = (undefined4 *)0xeab150;
      (**(code **)(**(int **)(param_1 + 0x624) + 0x170))(*(int **)(param_1 + 0x624),1);
    }
    DAT_0125a2f1 = '\x01';
    puStack_94 = (undefined4 *)0xeab168;
    _DAT_0125a2f4 = (**(code **)(**(int **)(param_1 + 0x670) + 0x16c))();
  }
  uVar13 = DAT_0125a2f1 == '\0';
  if (((!(bool)uVar13) && (uVar13 = _DAT_0125a2f4 == 0, 0 < _DAT_0125a2f4)) &&
     (uVar13 = DAT_0125a2ee == '\0', !(bool)uVar13)) {
    puStack_94 = (undefined4 *)0xeab19f;
    (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),_DAT_0125a2f4);
  }
  piVar9 = *(int **)(param_1 + 0x670);
  puStack_94 = (undefined4 *)0xeab1b2;
  uVar7 = (**(code **)(*piVar9 + 0x16c))();
  puStack_94 = (undefined4 *)0xeab1be;
  func_0x007ab6d8(piVar9,uVar7,&uStack_8);
  puStack_94 = &uStack_c;
  ppuStack_98 = (undefined4 **)0xeab1d3;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_12,0x20),1);
  ppuStack_98 = (undefined4 **)&uStack_10;
  puStack_9c = (undefined4 *)0xeab1e8;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_13,0x20),3);
  puStack_9c = (undefined4 *)0xeab1f7;
  func_0x0040c324(_DAT_0125a334,&UNK_00eabccc);
  uVar12 = extraout_var_14;
  if (!(bool)uVar13) {
    puStack_9c = &uStack_108;
    ppuStack_a0 = (undefined4 **)0xeab216;
    func_0x0040c35c(uStack_c,1,1);
    ppuStack_a0 = (undefined4 **)0xeab227;
    func_0x0042c1a8(uStack_108,&uStack_104);
    ppuStack_a0 = (undefined4 **)0xeab237;
    func_0x0040c324(uStack_104,&UNK_00eabcf4);
    uVar12 = extraout_var_15;
    if ((bool)uVar13) {
      puStack_9c = &uStack_110;
      ppuStack_a0 = (undefined4 **)0xeab256;
      func_0x0040c35c(uStack_10,1,1);
      ppuStack_a0 = (undefined4 **)0xeab267;
      func_0x0042c1a8(uStack_110,&uStack_10c);
      ppuStack_a0 = (undefined4 **)0xeab277;
      func_0x0040c324(uStack_10c,&UNK_00eabcf4);
      uVar12 = extraout_var_16;
      if ((bool)uVar13) {
        puStack_9c = &puStack_118;
        ppuStack_a0 = (undefined4 **)0xeab291;
        func_0x0079acec(uStack_8,CONCAT22(extraout_var_16,0x20),1);
        ppuStack_a0 = (undefined4 **)puStack_118;
        UNRECOVERED_JUMPTABLE_00 = (code **)&UNK_00eab470;
        UNRECOVERED_JUMPTABLE = &pppuStack_11c;
        pppuStack_ac = (undefined4 ***)0xeab2b4;
        func_0x0079acec(uStack_8,CONCAT22(extraout_var_17,0x20),2);
        pppuStack_ac = pppuStack_11c;
        ppppuStack_b0 = (undefined4 ****)0xeab2ca;
        func_0x0040c214(&uStack_114,3);
        ppppuStack_b0 = (undefined4 ****)0xeab2d8;
        func_0x00ea5bd0(param_1,uStack_114);
        goto LAB_00eab32f;
      }
    }
  }
  puStack_9c = (undefined4 *)0xeab2e9;
  func_0x0044a008(auStack_130,CONCAT22(uVar12,100));
  puStack_9c = auStack_130;
  ppuStack_a0 = (undefined4 **)0xeab304;
  func_0x007ae008(*(undefined4 *)(param_1 + 0x670),auStack_140);
  puVar4 = puStack_9c;
  puStack_9c = (undefined4 *)0xeab310;
  func_0x0044e1a0(puVar4,auStack_140);
  puStack_9c = (undefined4 *)0xeab321;
  func_0x0044973c(&uStack_120,auStack_130);
  puStack_9c = (undefined4 *)0xeab32f;
  func_0x00ea5bd0(param_1,uStack_120);
LAB_00eab32f:
  ppppuStack_b0 = (undefined4 ****)0xeab336;
  func_0x009b60ec(0);
  DAT_0125a2ef = 0;
  *in_FS_OFFSET = (int)pppuStack_ac;
  UNRECOVERED_JUMPTABLE_00 = (code **)&UNK_00eab45d;
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab360;
  func_0x0040d1c4(auStack_140,_DAT_004012c8,2);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab370;
  func_0x0040b034(&uStack_120,0x11);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab37b;
  func_0x0040afd4(&uStack_dc);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab386;
  func_0x0040afd4(&puStack_d8);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab391;
  func_0x0040afd4(&pcStack_d4);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab3a1;
  func_0x0040b034(&ppuStack_d0,2);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab3ac;
  func_0x0040afd4(&puStack_c8);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab3bc;
  func_0x0040b034(&ppuStack_c4,2);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab3c7;
  func_0x0040afd4(&ppuStack_bc);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab3d7;
  func_0x0040b034(&pppuStack_b8,4);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab3e7;
  func_0x0040b034(&UNRECOVERED_JUMPTABLE,2);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab3f2;
  func_0x0040afd4(&ppuStack_a0);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab3fd;
  func_0x0040afd4(&puStack_9c);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab408;
  func_0x0040afd4(&ppuStack_98);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab413;
  func_0x0040afd4(&puStack_94);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab423;
  func_0x0040b034(&puStack_90,2);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab430;
  func_0x0040b034(&uStack_80,3);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab443;
  func_0x0040d1c4(&uStack_74,_DAT_004012c8,2);
  UNRECOVERED_JUMPTABLE = (undefined4 ***)0xeab450;
  func_0x0040b034((int)register0x00000010 + -0x14,4);
                    /* WARNING: Could not recover jumptable at 0x00eab451. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

