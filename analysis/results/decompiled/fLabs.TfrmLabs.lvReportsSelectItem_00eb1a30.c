/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fLabs_TfrmLabs_lvReportsSelectItem
               (int param_1,undefined4 param_2,undefined4 param_3,char param_4)

{
  int *piVar1;
  undefined4 *puVar2;
  code *pcVar3;
  char cVar4;
  int *piVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  undefined *puVar9;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined2 extraout_var_04;
  undefined2 extraout_var_05;
  undefined2 extraout_var_06;
  undefined2 extraout_var_07;
  undefined4 unaff_EBX;
  uint *in_FS_OFFSET;
  undefined1 uVar10;
  undefined1 uVar11;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined *puStack_a4;
  undefined4 uStack_a0;
  undefined *puStack_9c;
  undefined4 uStack_98;
  undefined *puStack_94;
  undefined **ppuStack_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined *puStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined **ppuStack_6c;
  undefined4 uStack_68;
  undefined *puStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined **ppuStack_4c;
  undefined4 uStack_48;
  undefined *puStack_44;
  undefined4 uStack_40;
  undefined4 *puStack_3c;
  undefined4 *puStack_38;
  undefined **ppuStack_34;
  int *piStack_30;
  undefined4 uStack_2c;
  undefined *puStack_28;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_14 = (undefined **)0x15;
  do {
    uStack_c = 0;
    uStack_14 = (undefined **)((int)uStack_14 + -1);
  } while (uStack_14 != (undefined **)0x0);
  LOCK();
  UNLOCK();
  puStack_28 = &UNK_00eb2397;
  uStack_2c = *in_FS_OFFSET;
  *in_FS_OFFSET = (uint)&uStack_2c;
  pcVar3 = (code *)((int)register0x00000010 + -4);
  uStack_8 = uStack_14;
  if (param_4 == '\0') goto LAB_00eb236a;
  piStack_30 = (int *)0xeb1a70;
  piVar5 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  piStack_30 = (int *)0xeb1a7c;
  (**(code **)(*_DAT_0125a2a8 + 0x48))();
  uStack_2c = uStack_2c & 0xffffff;
  piStack_30 = (int *)((int)register0x00000010 + -0x18);
  ppuStack_34 = (undefined **)0xeb1a97;
  func_0x0079acec(_DAT_0125a334,CONCAT22(extraout_var,0x3a),1);
  piStack_30 = *(int **)(param_1 + 0x5bc);
  ppuStack_34 = (undefined **)0xeb1ab0;
  (**(code **)(*piRam00000008 + 0xc))(piRam00000008,0,&uStack_8);
  if (_DAT_0125a2d8 == 6) {
    ppuStack_34 = (undefined **)0xeb1acd;
    iVar6 = (**(code **)(**(int **)(param_1 + 0x5bc) + 0x194))();
    if (iVar6 < 2) {
      ppuStack_34 = (undefined **)0xeb1ae3;
      (**(code **)(**(int **)(*(int *)(param_1 + 0x4f0) + 0x330) + 0x48))();
      DAT_0125a2ec = '\0';
    }
    ppuStack_34 = (undefined **)0xeb1af1;
    (**(code **)(*piVar5 + 0x48))();
    ppuStack_34 = (undefined **)0xeb1afc;
    iVar6 = (**(code **)(*piStack_30 + 0x194))();
    if ((iVar6 == 2) && (DAT_0125a2ec == '\0')) {
      DAT_0125a2ec = '\x01';
      ppuStack_34 = (undefined **)0xeb1b27;
      iVar6 = func_0x0067ce80(piStack_30[0xbd]);
      if (-1 < iVar6 + -1) {
        iVar6 = 0;
        do {
          ppuStack_34 = (undefined **)0xeb1b4c;
          uVar7 = func_0x0067ced0(piStack_30[0xbd],iVar6);
          ppuStack_34 = (undefined **)0xeb1b56;
          cVar4 = func_0x0067c668(uVar7,3);
          if (cVar4 != '\0') {
            ppuStack_34 = (undefined **)0xeb1b6f;
            iVar8 = func_0x0067ced0(piStack_30[0xbd],iVar6);
            uVar10 = 1;
            ppuStack_34 = (undefined **)0xeb1b7c;
            (**(code **)(**(int **)(iVar8 + 8) + 0xc))(*(int **)(iVar8 + 8),0,&uStack_40);
            ppuStack_34 = (undefined **)0xeb1b87;
            func_0x0040c324(uStack_8,uStack_40);
            if (!(bool)uVar10) {
              ppuStack_34 = (undefined **)0xeb1b9e;
              iVar8 = func_0x0067ced0(piStack_30[0xbd],iVar6);
              ppuStack_34 = (undefined **)0xeb1bab;
              (**(code **)(**(int **)(iVar8 + 8) + 0xc))(*(int **)(iVar8 + 8),0,&uStack_c);
              iVar8 = *(int *)(*(int *)(*_DAT_0124ea90 + 8) + 8);
              if (-1 < iVar8 + -1) {
                uVar10 = iVar8 == 0;
                UNRECOVERED_JUMPTABLE = (code *)0x0;
                do {
                  ppuStack_34 = &puStack_44;
                  puStack_38 = (undefined4 *)0xeb1be1;
                  func_0x0079acec(uStack_c,0x3a,1);
                  puStack_38 = (undefined4 *)puStack_44;
                  puStack_3c = &uStack_48;
                  uStack_40 = 0xeb1bfb;
                  iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),UNRECOVERED_JUMPTABLE)
                  ;
                  uStack_40 = 0xeb1c0c;
                  func_0x0079acec(*(undefined4 *)(iVar8 + 0x18),CONCAT22(extraout_var_00,0x3a),1);
                  puVar2 = puStack_3c;
                  puStack_3c = (undefined4 *)0xeb1c15;
                  func_0x0040c324(puVar2,uStack_48);
                  if ((bool)uVar10) {
                    ppuStack_34 = (undefined **)0xeb1c26;
                    (**(code **)(iRam00000000 + 0x18))(0,&ppuStack_4c);
                    ppuStack_34 = ppuStack_4c;
                    puStack_38 = &uStack_50;
                    puStack_3c = (undefined4 *)0xeb1c40;
                    iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),
                                            UNRECOVERED_JUMPTABLE);
                    puStack_3c = (undefined4 *)0xeb1c51;
                    func_0x0079acec(*(undefined4 *)(iVar8 + 8),CONCAT22(extraout_var_01,0x3b),1);
                    puVar2 = puStack_38;
                    puStack_38 = (undefined4 *)0xeb1c5a;
                    func_0x0040c324(puVar2,uStack_50);
                    if ((bool)uVar10) {
                      ppuStack_34 = (undefined **)0xeb1c72;
                      iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),
                                              UNRECOVERED_JUMPTABLE);
                      ppuStack_34 = (undefined **)0xeb1c7a;
                      iVar8 = (**(code **)(**(int **)(iVar8 + 0x20) + 0x14))();
                      uVar10 = iVar8 == 0;
                      if (0 < iVar8) {
                        ppuStack_34 = (undefined **)0xeb1c94;
                        iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),
                                                UNRECOVERED_JUMPTABLE);
                        ppuStack_34 = (undefined **)0xeb1ca1;
                        func_0x0040c324(*(undefined4 *)(iVar8 + 0xc),&UNK_00eb23b4);
                        if ((bool)uVar10) {
                          uStack_2c = CONCAT13(1,(undefined3)uStack_2c);
                          ppuStack_34 = (undefined **)0xeb1cbd;
                          iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),
                                                  UNRECOVERED_JUMPTABLE);
                          piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                          ppuStack_34 = (undefined **)0xeb1cd1;
                          (**(code **)(*piVar1 + 0x3c))(piVar1,*(undefined4 *)(iVar8 + 4));
                          ppuStack_34 = (undefined **)0xeb1ce3;
                          iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),
                                                  UNRECOVERED_JUMPTABLE);
                          ppuStack_34 = (undefined **)0xeb1ced;
                          func_0x009b3eb4(*(undefined4 *)(iVar8 + 0x20),piVar5);
                          ppuStack_34 = (undefined **)0xeb1cf4;
                          puVar9 = (undefined *)(**(code **)(*piVar5 + 0x14))();
                          if (-1 < (int)(puVar9 + -1)) {
                            puStack_28 = (undefined *)0x0;
                            puStack_3c = (undefined4 *)puVar9;
                            do {
                              ppuStack_34 = (undefined **)0xeb1d11;
                              (**(code **)(*piVar5 + 0xc))(piVar5,puStack_28,&uStack_58);
                              ppuStack_34 = (undefined **)0xeb1d21;
                              func_0x0040c18c(&uStack_54,&UNK_00eb23c4,uStack_58);
                              piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                              ppuStack_34 = (undefined **)0xeb1d35;
                              (**(code **)(*piVar1 + 0x3c))(piVar1,uStack_54);
                              puStack_28 = puStack_28 + 1;
                              puStack_3c = (undefined4 *)((int)puStack_3c + -1);
                            } while (puStack_3c != (undefined4 *)0x0);
                          }
                        }
                      }
                    }
                  }
                  UNRECOVERED_JUMPTABLE = UNRECOVERED_JUMPTABLE + 1;
                  puStack_38 = (undefined4 *)((int)puStack_38 + -1);
                  uVar10 = puStack_38 == (undefined4 *)0x0;
                } while (!(bool)uVar10);
              }
              if (uStack_2c._3_1_ == '\x01') {
                ppuStack_34 = (undefined **)0xeb1d5a;
                (**(code **)(iRam00000000 + 0x18))(0,&uStack_60);
                ppuStack_34 = (undefined **)0xeb1d6a;
                func_0x0040c18c(&uStack_5c,&UNK_00eb23d4,uStack_60);
                piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                ppuStack_34 = (undefined **)0xeb1d7e;
                (**(code **)(*piVar1 + 0x3c))(piVar1,uStack_5c);
                piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                ppuStack_34 = (undefined **)0xeb1d94;
                (**(code **)(*piVar1 + 0x3c))(piVar1,&UNK_00eb23f8);
              }
            }
          }
          iVar6 = iVar6 + 1;
        } while (ppuStack_34 != (undefined **)0x1);
      }
    }
    ppuStack_34 = (undefined **)0xeb1da7;
    (**(code **)(*piVar5 + 0x48))();
    uStack_2c = uStack_2c & 0xffffff;
    iVar6 = *(int *)(*(int *)(*_DAT_0124ea90 + 8) + 8);
    if (-1 < iVar6 + -1) {
      uVar10 = iVar6 == 0;
      iVar6 = 0;
      do {
        ppuStack_34 = &puStack_64;
        puStack_38 = (undefined4 *)0xeb1de1;
        func_0x0079acec(uStack_8,0x3a,1);
        puStack_38 = (undefined4 *)puStack_64;
        puStack_3c = &uStack_68;
        uStack_40 = 0xeb1dfb;
        iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),iVar6);
        uStack_40 = 0xeb1e0c;
        func_0x0079acec(*(undefined4 *)(iVar8 + 0x18),CONCAT22(extraout_var_02,0x3a),1);
        puVar2 = puStack_3c;
        puStack_3c = (undefined4 *)0xeb1e15;
        func_0x0040c324(puVar2,uStack_68);
        if ((bool)uVar10) {
          ppuStack_34 = (undefined **)0xeb1e26;
          (**(code **)(iRam00000000 + 0x18))(0,&ppuStack_6c);
          ppuStack_34 = ppuStack_6c;
          puStack_38 = &uStack_70;
          puStack_3c = (undefined4 *)0xeb1e40;
          iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),iVar6);
          puStack_3c = (undefined4 *)0xeb1e51;
          func_0x0079acec(*(undefined4 *)(iVar8 + 8),CONCAT22(extraout_var_03,0x3b),1);
          puVar2 = puStack_38;
          puStack_38 = (undefined4 *)0xeb1e5a;
          func_0x0040c324(puVar2,uStack_70);
          if ((bool)uVar10) {
            ppuStack_34 = (undefined **)0xeb1e72;
            iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),iVar6);
            ppuStack_34 = (undefined **)0xeb1e7a;
            iVar8 = (**(code **)(**(int **)(iVar8 + 0x20) + 0x14))();
            uVar10 = iVar8 == 0;
            if (0 < iVar8) {
              ppuStack_34 = (undefined **)0xeb1e94;
              iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),iVar6);
              ppuStack_34 = (undefined **)0xeb1ea1;
              func_0x0040c324(*(undefined4 *)(iVar8 + 0xc),&UNK_00eb23b4);
              if ((bool)uVar10) {
                uStack_2c = CONCAT13(1,(undefined3)uStack_2c);
                ppuStack_34 = (undefined **)0xeb1ebd;
                iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),iVar6);
                piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                ppuStack_34 = (undefined **)0xeb1ed1;
                (**(code **)(*piVar1 + 0x3c))(piVar1,*(undefined4 *)(iVar8 + 4));
                ppuStack_34 = (undefined **)0xeb1ee3;
                iVar8 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124ea90 + 8),iVar6);
                ppuStack_34 = (undefined **)0xeb1eed;
                func_0x009b3eb4(*(undefined4 *)(iVar8 + 0x20),piVar5);
                ppuStack_34 = (undefined **)0xeb1ef4;
                puVar9 = (undefined *)(**(code **)(*piVar5 + 0x14))();
                if (-1 < (int)(puVar9 + -1)) {
                  UNRECOVERED_JUMPTABLE = (code *)0x0;
                  puStack_38 = (undefined4 *)puVar9;
                  do {
                    ppuStack_34 = (undefined **)0xeb1f11;
                    (**(code **)(*piVar5 + 0xc))(piVar5,UNRECOVERED_JUMPTABLE,&uStack_78);
                    ppuStack_34 = (undefined **)0xeb1f21;
                    func_0x0040c18c(&uStack_74,&UNK_00eb23c4,uStack_78);
                    piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
                    ppuStack_34 = (undefined **)0xeb1f35;
                    (**(code **)(*piVar1 + 0x3c))(piVar1,uStack_74);
                    UNRECOVERED_JUMPTABLE = UNRECOVERED_JUMPTABLE + 1;
                    puStack_38 = (undefined4 *)((int)puStack_38 + -1);
                  } while (puStack_38 != (undefined4 *)0x0);
                }
              }
            }
          }
        }
        iVar6 = iVar6 + 1;
        uVar10 = ppuStack_34 == (undefined **)0x1;
      } while (!(bool)uVar10);
    }
    uVar10 = uStack_2c._3_1_ == '\x01';
    if ((bool)uVar10) {
      ppuStack_34 = (undefined **)0xeb1f5a;
      (**(code **)(iRam00000000 + 0x18))(0,&uStack_80);
      ppuStack_34 = (undefined **)0xeb1f6a;
      func_0x0040c18c(&uStack_7c,&UNK_00eb23d4,uStack_80);
      piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
      ppuStack_34 = (undefined **)0xeb1f7e;
      (**(code **)(*piVar1 + 0x3c))(piVar1,uStack_7c);
      piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
      ppuStack_34 = (undefined **)0xeb1f94;
      (**(code **)(*piVar1 + 0x3c))(piVar1,&UNK_00eb23f8);
    }
    ppuStack_34 = (undefined **)0xeb1fa3;
    func_0x0040c324(_DAT_0125a334,&UNK_00eb24a4);
    uVar11 = 0;
    if ((bool)uVar10) {
      ppuStack_34 = (undefined **)0xeb1fb4;
      iVar6 = (**(code **)(*piRam00000008 + 0x14))();
      if (iVar6 < 9) {
        ppuStack_34 = (undefined **)0xeb207d;
        iVar6 = (**(code **)(*piRam00000008 + 0x14))();
        if (iVar6 < 5) {
          ppuStack_34 = (undefined **)0xeb212a;
          iVar6 = func_0x0067cc34(0,1);
          uVar11 = 0;
          if (iVar6 == 1) {
            piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
            uVar11 = 1;
            ppuStack_34 = (undefined **)0xeb2145;
            (**(code **)(*piVar1 + 100))(piVar1,0,&UNK_00eb2520);
            piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
            ppuStack_34 = (undefined **)0xeb2160;
            (**(code **)(*piVar1 + 100))(piVar1,1,&UNK_00eb23c4);
          }
        }
        else {
          ppuStack_34 = (undefined **)&UNK_00eb2508;
          puStack_38 = (undefined4 *)0xeb20a1;
          (**(code **)(*piRam00000008 + 0xc))(piRam00000008,4,&puStack_94);
          puStack_38 = (undefined4 *)puStack_94;
          puStack_3c = (undefined4 *)&UNK_00eb24e4;
          uStack_40 = 0xeb20ba;
          (**(code **)(iRam00000000 + 0x18))(0,&uStack_98);
          uStack_40 = uStack_98;
          puStack_44 = (undefined *)0xeb20cd;
          func_0x0040c214(&uStack_10,4);
          puStack_44 = (undefined *)0xeb20da;
          iVar6 = func_0x0067cc34(0,1);
          uVar11 = (iVar6 == 1) == 0;
          puStack_44 = (undefined *)0xeb20f6;
          func_0x0040bf44(&puStack_9c,*(undefined2 *)(_DAT_0124fbe0 + (uint)(iVar6 == 1) * 2));
          puStack_44 = puStack_9c;
          uStack_48 = 0xeb210e;
          func_0x0079af38(&uStack_10,CONCAT22(extraout_var_05,0x5e),10);
          uStack_48 = 0xeb211b;
          func_0x011d3f74(&UNK_00eb24f4,uStack_10);
        }
      }
      else {
        ppuStack_34 = (undefined **)&UNK_00eb24d0;
        puStack_38 = (undefined4 *)0xeb1fd5;
        (**(code **)(*piRam00000008 + 0xc))(piRam00000008,8,&puStack_84);
        puStack_38 = (undefined4 *)puStack_84;
        puStack_3c = (undefined4 *)&UNK_00eb24e4;
        uStack_40 = 0xeb1ff3;
        (**(code **)(*piRam00000008 + 0xc))(piRam00000008,4,&uStack_88);
        uStack_40 = uStack_88;
        puStack_44 = &UNK_00eb24e4;
        uStack_48 = 0xeb200c;
        (**(code **)(iRam00000000 + 0x18))(0,&uStack_8c);
        uStack_48 = uStack_8c;
        ppuStack_4c = (undefined **)0xeb201f;
        func_0x0040c214(&uStack_10,6);
        ppuStack_4c = (undefined **)0xeb202c;
        iVar6 = func_0x0067cc34(0,1);
        uVar11 = (iVar6 == 1) == 0;
        ppuStack_4c = (undefined **)0xeb2048;
        func_0x0040bf44(&ppuStack_90,*(undefined2 *)(_DAT_0124fbe0 + (uint)(iVar6 == 1) * 2));
        ppuStack_4c = ppuStack_90;
        uStack_50 = 0xeb2060;
        func_0x0079af38(&uStack_10,CONCAT22(extraout_var_04,0x5e),10);
        uStack_50 = 0xeb206d;
        func_0x011d3f74(&UNK_00eb24f4,uStack_10);
      }
    }
    ppuStack_34 = (undefined **)0xeb216f;
    func_0x0040c324(_DAT_0125a334,&UNK_00eb257c);
    uVar10 = 0;
    if ((bool)uVar11) {
      ppuStack_34 = (undefined **)0xeb2180;
      iVar6 = (**(code **)(*piRam00000008 + 0x14))();
      uVar10 = iVar6 == 7;
      if (7 < iVar6) {
        ppuStack_34 = (undefined **)0xeb219f;
        (**(code **)(*piRam00000008 + 0xc))(piRam00000008,7,&uStack_a0);
        ppuStack_34 = (undefined **)0xeb21ac;
        iVar6 = func_0x0042d238(uStack_a0,0);
        uVar10 = iVar6 == 0;
        if (iVar6 < 1) {
          ppuStack_34 = (undefined **)0xeb21cc;
          func_0x0040b40c(&uStack_14,&UNK_00eb25b4);
        }
        else {
          ppuStack_34 = (undefined **)0xeb21bd;
          func_0x0040b40c(&uStack_14,&UNK_00eb23b4);
        }
        ppuStack_34 = (undefined **)&UNK_00eb25c4;
        puStack_38 = (undefined4 *)0xeb21e7;
        (**(code **)(*piRam00000008 + 0xc))(piRam00000008,7,&puStack_a4);
        puStack_38 = (undefined4 *)puStack_a4;
        puStack_3c = (undefined4 *)&UNK_00eb24e4;
        uStack_40 = 0xeb2208;
        (**(code **)(*piRam00000008 + 0xc))(piRam00000008,1,&uStack_a8);
        uStack_40 = uStack_a8;
        puStack_44 = &UNK_00eb24e4;
        uStack_48 = 0xeb2221;
        (**(code **)(iRam00000000 + 0x18))(0,&uStack_ac);
        uStack_48 = uStack_ac;
        ppuStack_4c = (undefined **)0xeb2234;
        func_0x0040c214(&uStack_10,6);
        ppuStack_4c = uStack_14;
        uStack_50 = 0xeb2249;
        func_0x0079af38(&uStack_10,CONCAT22(extraout_var_06,0x5e),10);
        uStack_50 = 0xeb2256;
        func_0x011d3f74(&UNK_00eb24f4,uStack_10);
      }
    }
    ppuStack_34 = (undefined **)0xeb2263;
    func_0x0040c324(unaff_EBX,&UNK_00eb25d8);
    if (!(bool)uVar10) {
      ppuStack_34 = (undefined **)0xeb2272;
      func_0x0040c324(unaff_EBX,&UNK_00eb25f4);
      if (!(bool)uVar10) {
        ppuStack_34 = (undefined **)0xeb2281;
        func_0x0040c324(unaff_EBX,&UNK_00eb2610);
        if (!(bool)uVar10) {
          ppuStack_34 = (undefined **)0xeb2290;
          func_0x0040c324(unaff_EBX,&UNK_00eb262c);
          if (!(bool)uVar10) goto LAB_00eb2338;
        }
      }
    }
    ppuStack_34 = (undefined **)0xeb22a1;
    iVar6 = (**(code **)(*piRam00000008 + 0x14))();
    if (7 < iVar6) {
      ppuStack_34 = (undefined **)0xeb22c0;
      (**(code **)(*piRam00000008 + 0xc))(piRam00000008,6,&uStack_b0);
      ppuStack_34 = (undefined **)0xeb22cd;
      iVar6 = func_0x0042d238(uStack_b0,0);
      if (iVar6 < 1) {
        ppuStack_34 = (undefined **)0xeb22ed;
        func_0x0040b40c(&uStack_14,&UNK_00eb25b4);
      }
      else {
        ppuStack_34 = (undefined **)0xeb22de;
        func_0x0040b40c(&uStack_14,&UNK_00eb23b4);
      }
      ppuStack_34 = (undefined **)0xeb2303;
      (**(code **)(*piRam00000008 + 0xc))(piRam00000008,7,&uStack_b4);
      ppuStack_34 = (undefined **)0xeb2316;
      func_0x0040c18c(&uStack_10,&UNK_00eb2648,uStack_b4);
      ppuStack_34 = uStack_14;
      puStack_38 = (undefined4 *)0xeb232b;
      func_0x0079af38(&uStack_10,CONCAT22(extraout_var_07,0x5e),10);
      puStack_38 = (undefined4 *)0xeb2338;
      func_0x011d3f74(&UNK_00eb24f4,uStack_10);
    }
  }
LAB_00eb2338:
  piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
  ppuStack_34 = (undefined **)0xeb2350;
  (**(code **)(*piVar1 + 100))(piVar1,0,&UNK_00eb23c4);
  piVar1 = *(int **)(*(int *)(param_1 + 0x4f0) + 0x330);
  ppuStack_34 = (undefined **)0xeb2363;
  (**(code **)(*piVar1 + 0x4c))(piVar1,0);
  ppuStack_34 = (undefined **)0xeb236a;
  func_0x004090bc(piVar5);
  pcVar3 = UNRECOVERED_JUMPTABLE;
LAB_00eb236a:
  UNRECOVERED_JUMPTABLE = pcVar3;
  pcVar3 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_2c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00eb239e;
  puStack_28 = (undefined *)0xeb2387;
  func_0x0040b034(&uStack_b4,0x1e,pcVar3);
  puStack_28 = (undefined *)0xeb2394;
  func_0x0040b034((int)register0x00000010 + -0x18,5);
                    /* WARNING: Could not recover jumptable at 0x00eb2395. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

