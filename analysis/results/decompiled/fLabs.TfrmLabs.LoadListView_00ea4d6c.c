/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Heritage AFTER dead removal. Example location: s0xfffffff4 : 0x00ea53a5 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: stack */

void fLabs_TfrmLabs_LoadListView(void)

{
  code *pcVar1;
  char cVar2;
  int *piVar3;
  int *piVar4;
  undefined **ppuVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined2 extraout_var_04;
  undefined2 extraout_var_05;
  undefined2 extraout_var_06;
  undefined2 extraout_var_07;
  undefined2 extraout_var_08;
  undefined2 extraout_var_09;
  undefined2 extraout_var_10;
  undefined2 uVar9;
  undefined2 extraout_var_11;
  undefined2 extraout_var_12;
  undefined2 extraout_var_13;
  undefined2 extraout_var_14;
  undefined2 extraout_var_15;
  undefined2 extraout_var_16;
  undefined2 extraout_var_17;
  int *unaff_EBX;
  int iVar10;
  undefined4 unaff_ESI;
  int unaff_EDI;
  int *in_FS_OFFSET;
  undefined1 uVar11;
  undefined4 uStack_10c;
  int iStack_108;
  int iStack_104;
  undefined4 uStack_100;
  int *piStack_fc;
  undefined4 uStack_f8;
  int iStack_f4;
  int iStack_f0;
  undefined **ppuStack_ec;
  undefined4 uStack_e8;
  int iStack_e4;
  undefined4 uStack_e0;
  int iStack_dc;
  undefined *puStack_d8;
  int iStack_d4;
  int iStack_d0;
  int iStack_cc;
  undefined4 uStack_c8;
  int *piStack_c4;
  undefined4 uStack_c0;
  int iStack_bc;
  int iStack_b8;
  undefined **ppuStack_b4;
  undefined4 uStack_b0;
  int iStack_ac;
  undefined4 uStack_a8;
  int iStack_a4;
  int iStack_a0;
  undefined4 uStack_9c;
  int *piStack_98;
  undefined4 uStack_94;
  int iStack_90;
  int iStack_8c;
  int *piStack_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  int iStack_78;
  int iStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined4 uStack_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  int iStack_58;
  int iStack_54;
  undefined *puStack_50;
  int iStack_4c;
  int *piStack_48;
  int *piStack_44;
  int iStack_40;
  undefined4 *puStack_3c;
  undefined **ppuStack_38;
  int *piStack_34;
  int *piVar12;
  undefined4 *puStack_28;
  int *piStack_24;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_1c;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  iVar8 = 0x21;
  do {
    uStack_8 = 0;
    iVar8 = iVar8 + -1;
  } while (iVar8 != 0);
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00ea59af;
  piStack_24 = (int *)*in_FS_OFFSET;
  *in_FS_OFFSET = (int)&piStack_24;
  func_0x0040afd4((int)register0x00000010 + -0x18);
  iStack_40 = 0;
  puStack_28 = &uStack_1c;
  piVar12 = (int *)0xea4dbb;
  func_0x0079acec(_DAT_0125a334,CONCAT22(extraout_var,0x3a),1);
  if (_DAT_0125a2d8 == 5) {
    piVar12 = &iStack_58;
    func_0x0079acec(_DAT_0125a2dc,CONCAT22(extraout_var_00,0x3b),2);
    iVar8 = 0;
    if (iStack_58 != 0) {
      iVar8 = *(int *)(iStack_58 + -4);
    }
    if (0 < iVar8) {
      piStack_44 = *(int **)(UNRECOVERED_JUMPTABLE + 0x5bc);
      (**(code **)(*piStack_44 + 0x1d4))(piStack_44,3);
      piVar12 = (int *)(**(code **)(*piStack_24 + 0x14))();
      if (-1 < (int)((int)piVar12 + -1)) {
        uVar11 = piVar12 == (int *)0x0;
        puStack_28 = (undefined4 *)0x0;
        piStack_48 = piVar12;
        do {
          (**(code **)(*piStack_24 + 0xc))(piStack_24,puStack_28,&uStack_60);
          func_0x0079acec(uStack_60,CONCAT22(extraout_var_01,0x5e),1);
          func_0x0040c324(uStack_5c,&UNK_00ea59cc);
          if (!(bool)uVar11) {
            iStack_40 = func_0x0067cde0(piStack_44[0xbd]);
            (**(code **)(*piStack_24 + 0xc))(piStack_24,puStack_28,&uStack_64);
            func_0x0079acec(uStack_64,CONCAT22(extraout_var_02,0x5e),1);
            piStack_34 = (int *)0xea4eae;
            func_0x0079acec(unaff_EDI,CONCAT22(extraout_var_03,0x3b),1);
            piStack_34 = (int *)0xea4eb9;
            func_0x0067c4d8(iStack_40,uStack_68);
            piStack_34 = (int *)0xea4ec3;
            iVar8 = (**(code **)(*_DAT_0125a2d0 + 0x14))();
            if (1 < iVar8) {
              iVar8 = iVar8 + -1;
              iVar6 = 2;
              do {
                (**(code **)(*piStack_24 + 0xc))(piStack_24,puStack_28,&uStack_70);
                func_0x0079acec(uStack_70,CONCAT22(extraout_var_04,0x5e),iVar6);
                (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))(*(int **)(iStack_40 + 8),uStack_6c);
                iVar6 = iVar6 + 1;
                iVar8 = iVar8 + -1;
              } while (iVar8 != 0);
            }
          }
          puStack_28 = (undefined4 *)((int)puStack_28 + 1);
          piStack_48 = (int *)((int)piStack_48 + -1);
          uVar11 = piStack_48 == (int *)0x0;
        } while (!(bool)uVar11);
      }
      iVar8 = (**(code **)(*piStack_24 + 0x14))();
      if (iVar8 == 0) {
        func_0x0040b3c4(&DAT_0125a2b8,&UNK_00ea59e0);
        (**(code **)(**(int **)(*(int *)(UNRECOVERED_JUMPTABLE + 0x4f0) + 0x330) + 0x48))();
        piVar12 = (int *)0xea4f57;
        (**(code **)(**(int **)(*(int *)(UNRECOVERED_JUMPTABLE + 0x4f0) + 0x330) + 0x3c))
                  (*(int **)(*(int *)(UNRECOVERED_JUMPTABLE + 0x4f0) + 0x330),_DAT_0125a2b8);
      }
      else {
        piVar12 = (int *)0xea4f70;
        (**(code **)(**(int **)(*(int *)(UNRECOVERED_JUMPTABLE + 0x4f0) + 0x330) + 0x48))();
      }
    }
  }
  else if (_DAT_0125a2d8 == 6) {
    piVar12 = &iStack_74;
    func_0x0079acec(_DAT_0125a2dc,CONCAT22(extraout_var_00,0x3b),2);
    iVar8 = 0;
    if (iStack_74 != 0) {
      iVar8 = *(int *)(iStack_74 + -4);
    }
    uVar11 = iVar8 == 0;
    if (0 < iVar8) {
      piVar3 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
      puStack_3c = (undefined4 *)0x0;
      ppuStack_38 = (undefined **)0x0;
      piStack_34 = (int *)0x9;
      (**(code **)(*piVar3 + 0x48))();
      iStack_4c = *(int *)(UNRECOVERED_JUMPTABLE + 0x5bc);
      piVar3 = (int *)0xea4fda;
      piVar4 = (int *)(**(code **)(*piStack_24 + 0x14))();
      if (-1 < (int)((int)piVar4 + -1)) {
        puStack_28 = (undefined4 *)0x0;
        piStack_48 = piVar4;
        do {
          (**(code **)(*piStack_24 + 0xc))(piStack_24,puStack_28,&uStack_8);
          piVar3 = &iStack_78;
          piStack_34 = (int *)0xea5011;
          func_0x0079acec(uStack_8,CONCAT22(extraout_var_05,0x5e),1);
          piStack_34 = (int *)0xea501c;
          ppuVar5 = (undefined **)func_0x0042d238(iStack_78,0xffffffff);
          if (-1 < (int)ppuVar5) {
            piVar3 = (int *)0xea5030;
            iVar8 = (**(code **)(*_DAT_0125a2d0 + 0x14))();
            if (iVar8 + -1 < (int)ppuVar5) {
              piVar12 = (int *)0x1;
            }
            else {
              if ((int)ppuVar5 < (int)piStack_34) {
                piVar3 = (int *)0xea5052;
                iVar8 = (**(code **)(iRam00ea5030 + 0x14))();
                if (0 < iVar8) {
                  if (piStack_34 == (int *)0x1) {
                    iStack_40 = func_0x0067cde0(*(undefined4 *)(iStack_4c + 0x2f4));
                    piVar3 = (int *)((int)register0x00000010 + -0x18);
                    piStack_34 = (int *)0xea5087;
                    (**(code **)(unaff_EDI + 0xc))(piVar3,puStack_28,&uStack_7c);
                    piStack_34 = (int *)0xea5098;
                    func_0x0079acec(uStack_7c,CONCAT22(extraout_var_06,0x5e),1);
                    piStack_34 = &uStack_80;
                    ppuStack_38 = (undefined **)0xea50ad;
                    func_0x0079acec(unaff_EDI,CONCAT22(extraout_var_07,0x3b),1);
                    ppuStack_38 = (undefined **)0xea50b8;
                    func_0x0067c4d8(iStack_40,uStack_80);
                    ppuStack_38 = (undefined **)0xea50c6;
                    func_0x0042cfdc(puStack_3c,&piStack_88);
                    ppuStack_38 = (undefined **)piStack_88;
                    puStack_3c = (undefined4 *)&UNK_00ea5a14;
                    iStack_40 = 0xea50df;
                    func_0x0042cfdc(piStack_88,&iStack_8c);
                    iStack_40 = iStack_8c;
                    piStack_44 = (int *)0xea50f2;
                    func_0x0040c214(&uStack_84,3);
                    piStack_44 = (int *)0xea5100;
                    (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))
                              (*(int **)(iStack_40 + 8),uStack_84);
                  }
                  else {
                    uVar11 = 1;
                    (**(code **)(iRam00ea5052 + 0xc))(0xea5052,0,(int)register0x00000010 + -0x14);
                    piVar3 = &iStack_90;
                    piStack_34 = (int *)0xea512c;
                    (**(code **)(*_DAT_0125a2d0 + 0xc))(_DAT_0125a2d0,ppuStack_38,&uStack_94);
                    piStack_34 = (int *)0xea5140;
                    func_0x0079acec(uStack_94,CONCAT22(extraout_var_08,0x5e),4);
                    piStack_34 = (int *)0xea5150;
                    func_0x0040c324(iStack_90,&UNK_00ea5a24);
                    uVar9 = extraout_var_09;
                    if ((bool)uVar11) {
                      piStack_34 = (int *)0xea515f;
                      func_0x0040c134((int)register0x00000010 + -0x14,&UNK_00ea5a34);
                      uVar9 = extraout_var_10;
                    }
                    piStack_34 = (int *)((int)register0x00000010 + -0x10);
                    ppuStack_38 = (undefined **)0xea5174;
                    func_0x0079acec(unaff_ESI,CONCAT22(uVar9,0x5e),1);
                    ppuStack_38 = (undefined **)0xea5186;
                    puStack_50 = (undefined *)func_0x0040c4b0(&UNK_00ea5a48,unaff_ESI,1);
                    ppuStack_38 = (undefined **)&uStack_c;
                    puStack_3c = (undefined4 *)0xea519d;
                    func_0x0040c35c(unaff_ESI,puStack_50,9999);
                    puStack_3c = (undefined4 *)0xea51af;
                    iStack_54 = func_0x0040c4b0(&UNK_00ea5a48,uStack_c,1);
                    if (iStack_54 < 1) {
                      puStack_3c = (undefined4 *)0xea5230;
                      (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))
                                (*(int **)(iStack_40 + 8),uStack_c);
                    }
                    else {
                      while( true ) {
                        puStack_3c = (undefined4 *)0xea520c;
                        iVar8 = func_0x0040c4b0(&UNK_00ea5a48,uStack_c,1);
                        if (iVar8 < 1) break;
                        puStack_3c = (undefined4 *)0xea51cc;
                        iVar8 = func_0x0040c4b0(&UNK_00ea5a48,uStack_c,1);
                        puStack_3c = &uStack_c;
                        iStack_40 = 0xea51e2;
                        func_0x0040c35c(uStack_c,iVar8 + 1,9999);
                        piStack_34 = (int *)&UNK_00ea5a48;
                        ppuStack_38 = (undefined **)uStack_c;
                        puStack_3c = (undefined4 *)0xea51fa;
                        func_0x0040c214((int)register0x00000010 + -0x10,3);
                        piVar3 = unaff_EBX;
                      }
                      puStack_3c = (undefined4 *)0xea5220;
                      (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))
                                (*(int **)(iStack_40 + 8),unaff_EBX);
                    }
                  }
                  piStack_44 = (int *)0xea5243;
                  (**(code **)(*_DAT_0125a2d0 + 0xc))(_DAT_0125a2d0,ppuStack_38,&piStack_98);
                  piStack_44 = piStack_98;
                  iStack_4c = 0xea525c;
                  piStack_48 = piVar3;
                  func_0x0042cfdc(puStack_3c,&iStack_a0);
                  iStack_4c = iStack_a0;
                  puStack_50 = &UNK_00ea5a14;
                  iStack_54 = 0xea5275;
                  func_0x0042cfdc(ppuStack_38,&iStack_a4);
                  iStack_54 = iStack_a4;
                  iStack_58 = 0xea528b;
                  func_0x0040c214(&uStack_9c,3);
                  iStack_58 = 0xea52a0;
                  func_0x00c02470(*_DAT_0124ea90,unaff_EDI,uStack_9c);
                  iStack_58 = 0xea52a8;
                  (**(code **)(*piVar3 + 0x48))();
                }
                piStack_34 = (int *)0x0;
                puStack_3c = (undefined4 *)((int)puStack_3c + 1);
                ppuStack_38 = ppuVar5;
              }
              else if (ppuVar5 == ppuStack_38) {
                func_0x0040afd4((int)register0x00000010 + -0x10);
                piVar3 = &uStack_c;
                piStack_34 = (int *)0xea52de;
                func_0x0079acec(uStack_8,CONCAT22(extraout_var_11,0x5e),2);
                iVar8 = 0;
                if (uStack_c != (int *)0x0) {
                  iVar8 = uStack_c[-1];
                }
                if (0 < iVar8) {
                  piStack_34 = (int *)0xea52f7;
                  func_0x0040b40c((int)register0x00000010 + -0x10,uStack_c);
                }
                piStack_34 = (int *)0xea5309;
                iVar8 = func_0x0040c4b0(&UNK_00ea5a48,uStack_8,1);
                piStack_34 = &uStack_c;
                ppuStack_38 = (undefined **)0xea531f;
                func_0x0040c35c(uStack_8,iVar8 + 1,9999);
                ppuStack_38 = (undefined **)0xea5331;
                iVar8 = func_0x0040c4b0(&UNK_00ea5a48,uStack_c,1);
                if (iVar8 < 1) {
                  ppuStack_38 = (undefined **)0xea53aa;
                  (*(code *)uStack_c[0xf])(piVar3,uStack_c);
                }
                else {
                  while( true ) {
                    ppuStack_38 = (undefined **)0xea5389;
                    iVar8 = func_0x0040c4b0(&UNK_00ea5a48,uStack_c,1);
                    if (iVar8 < 1) break;
                    ppuStack_38 = (undefined **)0xea5349;
                    iVar8 = func_0x0040c4b0(&UNK_00ea5a48,uStack_c,1);
                    ppuStack_38 = (undefined **)&uStack_c;
                    puStack_3c = (undefined4 *)0xea535f;
                    func_0x0040c35c(uStack_c,iVar8 + 1,9999);
                    piVar3 = (int *)&UNK_00ea5a48;
                    piStack_34 = uStack_c;
                    ppuStack_38 = (undefined **)0xea5377;
                    func_0x0040c214((int)register0x00000010 + -0x10,3);
                    piVar12 = unaff_EBX;
                  }
                  ppuStack_38 = (undefined **)0xea539a;
                  (**(code **)(*piVar3 + 0x3c))(piVar3,unaff_EBX);
                }
                goto LAB_00ea562f;
              }
              iVar8 = (**(code **)(*piVar3 + 0x14))();
              if (0 < iVar8) {
                if (piStack_34 == (int *)0x1) {
                  iStack_40 = func_0x0067cde0(*(undefined4 *)(iStack_4c + 0x2f4));
                  piVar3 = (int *)((int)register0x00000010 + -0x18);
                  piStack_34 = (int *)0xea53ee;
                  (**(code **)(unaff_EDI + 0xc))(piVar3,0,&uStack_a8);
                  piStack_34 = (int *)0xea5402;
                  func_0x0079acec(uStack_a8,CONCAT22(extraout_var_12,0x5e),1);
                  piStack_34 = &iStack_ac;
                  ppuStack_38 = (undefined **)0xea541a;
                  func_0x0079acec(unaff_EDI,CONCAT22(extraout_var_13,0x3b),1);
                  ppuStack_38 = (undefined **)0xea5428;
                  func_0x0067c4d8(iStack_40,iStack_ac);
                  ppuStack_38 = (undefined **)0xea5436;
                  func_0x0042cfdc(puStack_3c,&ppuStack_b4);
                  ppuStack_38 = ppuStack_b4;
                  puStack_3c = (undefined4 *)&UNK_00ea5a14;
                  iStack_40 = 0xea544f;
                  func_0x0042cfdc(ppuStack_b4,&iStack_b8);
                  iStack_40 = iStack_b8;
                  piStack_44 = (int *)0xea5465;
                  func_0x0040c214(&uStack_b0,3);
                  piStack_44 = (int *)0xea5476;
                  (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))
                            (*(int **)(iStack_40 + 8),uStack_b0);
                }
                else {
                  uVar11 = 1;
                  (**(code **)(iRam00ea53b7 + 0xc))(0xea53b7,0,(int)register0x00000010 + -0x14);
                  piVar3 = &iStack_bc;
                  piStack_34 = (int *)0xea549f;
                  (**(code **)(*_DAT_0125a2d0 + 0xc))(_DAT_0125a2d0,ppuStack_38,&uStack_c0);
                  piStack_34 = (int *)0xea54b3;
                  func_0x0079acec(uStack_c0,CONCAT22(extraout_var_14,0x5e),4);
                  piStack_34 = (int *)0xea54c3;
                  func_0x0040c324(iStack_bc,&UNK_00ea5a24);
                  if ((bool)uVar11) {
                    piStack_34 = (int *)0xea54d2;
                    func_0x0040c134((int)register0x00000010 + -0x14,&UNK_00ea5a34);
                  }
                  piStack_34 = (int *)0xea54e0;
                  (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))
                            (*(int **)(iStack_40 + 8),unaff_ESI);
                }
                piStack_44 = (int *)0xea54f3;
                (**(code **)(*_DAT_0125a2d0 + 0xc))(_DAT_0125a2d0,ppuStack_38,&piStack_c4);
                piStack_44 = piStack_c4;
                iStack_4c = 0xea550c;
                piStack_48 = piVar3;
                func_0x0042cfdc(puStack_3c,&iStack_cc);
                iStack_4c = iStack_cc;
                puStack_50 = &UNK_00ea5a14;
                iStack_54 = 0xea5525;
                func_0x0042cfdc(ppuStack_38,&iStack_d0);
                iStack_54 = iStack_d0;
                iStack_58 = 0xea553b;
                func_0x0040c214(&uStack_c8,3);
                iStack_58 = 0xea5550;
                func_0x00c02470(*_DAT_0124ea90,unaff_EDI,uStack_c8);
                iStack_58 = 0xea5558;
                (**(code **)(*piVar3 + 0x48))();
              }
              piStack_34 = (int *)((int)piStack_34 + 1);
              ppuStack_38 = ppuVar5;
              func_0x0040afd4(&uStack_c);
              iVar8 = 2;
              do {
                piStack_34 = (int *)0xea5580;
                func_0x0079acec(uStack_8,0x5e,iVar8);
                piVar3 = uStack_c;
                iVar6 = 0;
                if (iStack_d4 != 0) {
                  iVar6 = *(int *)(iStack_d4 + -4);
                }
                piVar4 = &iStack_d4;
                if (0 < iVar6) {
                  iVar6 = 0;
                  if (uStack_c != (int *)0x0) {
                    iVar6 = uStack_c[-1];
                  }
                  if (iVar6 < 1) {
                    piVar4 = &iStack_dc;
                    piStack_34 = (int *)0xea55e6;
                    func_0x0079acec(uStack_8,0x5e,iVar8);
                    piStack_34 = (int *)0xea55f4;
                    func_0x0040c134(&uStack_c,iStack_dc);
                  }
                  else {
                    piStack_34 = (int *)&UNK_00ea5a48;
                    ppuStack_38 = &puStack_d8;
                    puStack_3c = (undefined4 *)0xea55bc;
                    func_0x0079acec(uStack_8,0x5e,iVar8);
                    puStack_3c = (undefined4 *)puStack_d8;
                    iStack_40 = 0xea55cf;
                    func_0x0040c214(&uStack_c,3);
                    piVar4 = piVar3;
                  }
                }
                iVar8 = iVar8 + 1;
              } while (iVar8 != 0xb);
              piVar3 = (int *)0xea5609;
              (**(code **)(*piVar4 + 0x3c))(piVar4,uStack_c);
              if ((0 < (int)piStack_34) && ((int)piStack_34 < (int)ppuStack_38)) {
                do {
                  piVar3 = (int *)0xea5624;
                  (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))(*(int **)(iStack_40 + 8),0);
                  piStack_34 = (int *)((int)piStack_34 + 1);
                } while ((int)piStack_34 < (int)ppuStack_38);
              }
            }
          }
LAB_00ea562f:
          puStack_28 = (undefined4 *)((int)puStack_28 + 1);
          piStack_48 = (int *)((int)piStack_48 + -1);
        } while (piStack_48 != (int *)0x0);
      }
      piVar4 = (int *)0xea5643;
      iVar8 = (**(code **)(*piVar3 + 0x14))();
      uVar11 = iVar8 == 0;
      if (0 < iVar8) {
        if (piStack_34 == (int *)0x1) {
          iStack_40 = func_0x0067cde0(*(undefined4 *)(iStack_4c + 0x2f4));
          piVar4 = (int *)((int)register0x00000010 + -0x18);
          uVar11 = 1;
          piStack_34 = (int *)0xea567a;
          (**(code **)(unaff_EDI + 0xc))(piVar4,0,&uStack_e0);
          piStack_34 = (int *)0xea568e;
          func_0x0079acec(uStack_e0,CONCAT22(extraout_var_15,0x5e),1);
          piStack_34 = &iStack_e4;
          ppuStack_38 = (undefined **)0xea56a6;
          func_0x0079acec(unaff_EDI,CONCAT22(extraout_var_16,0x3b),1);
          ppuStack_38 = (undefined **)0xea56b4;
          func_0x0067c4d8(iStack_40,iStack_e4);
          ppuStack_38 = (undefined **)0xea56c2;
          func_0x0042cfdc(puStack_3c,&ppuStack_ec);
          ppuStack_38 = ppuStack_ec;
          puStack_3c = (undefined4 *)&UNK_00ea5a14;
          iStack_40 = 0xea56db;
          func_0x0042cfdc(ppuStack_ec,&iStack_f0);
          iStack_40 = iStack_f0;
          piStack_44 = (int *)0xea56f1;
          func_0x0040c214(&uStack_e8,3);
          piStack_44 = (int *)0xea5702;
          (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))(*(int **)(iStack_40 + 8),uStack_e8);
        }
        else {
          uVar11 = 1;
          (**(code **)(iRam00ea5643 + 0xc))(0xea5643,0,(int)register0x00000010 + -0x14);
          piVar4 = &iStack_f4;
          piStack_34 = (int *)0xea572b;
          (**(code **)(*_DAT_0125a2d0 + 0xc))(_DAT_0125a2d0,ppuStack_38,&uStack_f8);
          piStack_34 = (int *)0xea573f;
          func_0x0079acec(uStack_f8,CONCAT22(extraout_var_17,0x5e),4);
          piStack_34 = (int *)0xea574f;
          func_0x0040c324(iStack_f4,&UNK_00ea5a24);
          if ((bool)uVar11) {
            piStack_34 = (int *)0xea575e;
            func_0x0040c134((int)register0x00000010 + -0x14,&UNK_00ea5a34);
          }
          piStack_34 = (int *)0xea576c;
          (**(code **)(**(int **)(iStack_40 + 8) + 0x3c))(*(int **)(iStack_40 + 8),unaff_ESI);
        }
        piStack_44 = (int *)0xea577f;
        (**(code **)(*_DAT_0125a2d0 + 0xc))(_DAT_0125a2d0,ppuStack_38,&piStack_fc);
        piStack_44 = piStack_fc;
        iStack_4c = 0xea5798;
        piStack_48 = piVar4;
        func_0x0042cfdc(puStack_3c,&iStack_104);
        iStack_4c = iStack_104;
        puStack_50 = &UNK_00ea5a14;
        iStack_54 = 0xea57b1;
        func_0x0042cfdc(ppuStack_38,&iStack_108);
        iStack_54 = iStack_108;
        iStack_58 = 0xea57c7;
        func_0x0040c214(&uStack_100,3);
        iStack_58 = 0xea57dc;
        func_0x00c02470(*_DAT_0124ea90,unaff_EDI,uStack_100);
        iStack_58 = 0xea57e4;
        (**(code **)(*piVar4 + 0x48))();
      }
      func_0x004090bc(piVar4);
    }
    func_0x0040c324(uStack_1c,&UNK_00ea5a58);
    if (((((bool)uVar11) || (func_0x0040c324(uStack_1c,&UNK_00ea5a74), (bool)uVar11)) ||
        (func_0x0040c324(uStack_1c,&UNK_00ea5a90), (bool)uVar11)) ||
       (func_0x0040c324(uStack_1c,&UNK_00ea5aac), (bool)uVar11)) {
      iVar8 = *(int *)(UNRECOVERED_JUMPTABLE + 0x5bc);
      func_0x0068263c(iVar8,*(undefined4 *)(*_DAT_0124efd4 + 0x74));
      func_0x009d8d18(*(undefined4 *)(UNRECOVERED_JUMPTABLE + 0x644));
      iVar6 = func_0x0067ce80(*(undefined4 *)(iVar8 + 0x2f4));
      if (-1 < iVar6 + -1) {
        iVar10 = 0;
        piStack_48 = (int *)iVar6;
        do {
          iVar6 = func_0x0067ced0(*(undefined4 *)(iVar8 + 0x2f4),iVar10);
          iVar6 = (**(code **)(**(int **)(iVar6 + 8) + 0x14))();
          if (iVar6 < 7) {
LAB_00ea58d5:
            uVar7 = func_0x0067ced0(*(undefined4 *)(iVar8 + 0x2f4),iVar10);
            piVar12 = (int *)0xea58f1;
            func_0x0067cc40(uVar7,1,6);
          }
          else {
            iVar6 = func_0x0067ced0(*(undefined4 *)(iVar8 + 0x2f4),iVar10);
            (**(code **)(**(int **)(iVar6 + 8) + 0xc))(*(int **)(iVar6 + 8),6,&uStack_10c);
            iVar6 = func_0x0042d1fc(uStack_10c);
            if (iVar6 < 1) goto LAB_00ea58d5;
            uVar7 = func_0x0067ced0(*(undefined4 *)(iVar8 + 0x2f4),iVar10);
            piVar12 = (int *)0xea58d3;
            func_0x0067cc40(uVar7,1,1);
          }
          iVar10 = iVar10 + 1;
          piStack_48 = (int *)((int)piStack_48 + -1);
        } while (piStack_48 != (int *)0x0);
        piStack_48 = (int *)0x0;
      }
    }
    else {
      func_0x0068263c(*(undefined4 *)(UNRECOVERED_JUMPTABLE + 0x5bc),_DAT_0125a330);
      func_0x009d8d18(*(undefined4 *)(UNRECOVERED_JUMPTABLE + 0x644));
    }
  }
  if ((piVar12 == (int *)0x1) &&
     (cVar2 = func_0x011d431c(*_DAT_0124f9dc,&UNK_00ea5ac8), cVar2 != '\0')) {
    func_0x0079c19c(&UNK_00ea5aec,0,0);
  }
  iVar8 = func_0x0067ce80(*(undefined4 *)(*(int *)(UNRECOVERED_JUMPTABLE + 0x5bc) + 0x2f4));
  if (0 < iVar8) {
    uVar7 = func_0x0067ced0(*(undefined4 *)(*(int *)(UNRECOVERED_JUMPTABLE + 0x5bc) + 0x2f4),0);
    func_0x0067c6d8(uVar7,3,1);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = (int)puStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00ea59b6;
  piStack_24 = (int *)0xea599f;
  func_0x0040b034(&uStack_10c,0x2e,pcVar1);
  piStack_24 = (int *)0xea59ac;
  func_0x0040b034(&uStack_1c,6);
                    /* WARNING: Could not recover jumptable at 0x00ea59ad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

