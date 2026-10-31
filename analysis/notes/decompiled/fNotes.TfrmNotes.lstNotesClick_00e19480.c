/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fNotes_TfrmNotes_lstNotesClick(int param_1)

{
  int *piVar1;
  int **ppiVar2;
  undefined4 *puVar3;
  undefined1 *puVar4;
  char cVar5;
  int iVar6;
  int *piVar7;
  undefined4 uVar8;
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
  undefined4 unaff_EBX;
  undefined4 unaff_ESI;
  undefined4 unaff_EDI;
  undefined4 *in_FS_OFFSET;
  float10 in_ST0;
  undefined *puVar9;
  undefined *puVar10;
  undefined8 uStack_6c;
  int *piStack_64;
  undefined *puStack_60;
  int **ppiStack_5c;
  int **ppiStack_58;
  int ***pppiStack_54;
  int *piStack_50;
  undefined *puStack_4c;
  undefined **ppuStack_48;
  undefined *puStack_44;
  undefined4 uStack_40;
  int iStack_3c;
  undefined *puStack_38;
  undefined4 *puStack_34;
  int *piStack_30;
  int **ppiStack_2c;
  undefined4 uStack_28;
  undefined *puStack_24;
  undefined4 UNRECOVERED_JUMPTABLE;
  int *piStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  piStack_10 = (undefined4 *)0xc;
  do {
    uStack_8 = 0;
    piStack_10 = (int *)((int)piStack_10 + -1);
  } while (piStack_10 != (undefined4 *)0x0);
  puStack_24 = &UNK_00e198bd;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  piVar1 = *(int **)(param_1 + 0x4dc);
  ppiStack_2c = (int **)0xe194b3;
  iVar6 = (**(code **)(*piVar1 + 0x16c))();
  if (-1 < iVar6) {
    ppiStack_2c = (int **)0xe194c5;
    iVar6 = (**(code **)(*piVar1 + 0x16c))();
    if (iVar6 == *(int *)(param_1 + 0x7bc)) {
      ppiStack_2c = (int **)0xe194d6;
      func_0x00e0fe84(param_1,0);
      ppiStack_2c = (int **)0xe194e3;
      func_0x00709128(*(undefined4 *)(param_1 + 0x56c),0);
      ppiStack_2c = (int **)0xe194ee;
      cVar5 = func_0x01011c80(6,0,0);
      if ((cVar5 == '\0') ||
         ((*(int *)(param_1 + 0x8f4) != 0 && (*(char *)(param_1 + 0x928) == '\0')))) {
        uVar8 = 0;
      }
      else {
        uVar8 = 1;
      }
      ppiStack_2c = (int **)0xe19515;
      func_0x00709128(*(undefined4 *)(param_1 + 0x598),uVar8);
      ppiStack_2c = (int **)0xe19520;
      uVar8 = func_0x01011c80(6,0,0);
      ppiStack_2c = (int **)0xe1952d;
      func_0x00709128(*(undefined4 *)(param_1 + 0x59c),uVar8);
      ppiStack_2c = (int **)0xe19532;
      func_0x00d8f7f8();
      ppiStack_2c = (int **)0xe1953d;
      func_0x00a95d0c(*(undefined4 *)(param_1 + 0x770));
    }
    else {
      ppiStack_2c = (int **)0xe1954c;
      func_0x009b60ec(&UNK_00e198d8);
      ppiStack_2c = (int **)0xe1955c;
      func_0x00729a50(*_DAT_0124fe08,CONCAT22(extraout_var,0xfff5));
      ppiStack_2c = (int **)0xe19565;
      func_0x00e0fe84(param_1,1);
      ppiStack_2c = (int **)0xe1956a;
      func_0x00d8f7f8();
      ppiStack_2c = &piStack_10;
      piStack_30 = (int *)((int)register0x00000010 + -0x14);
      puStack_34 = (undefined4 *)0xe1957c;
      puStack_34 = (undefined4 *)(**(code **)(*piVar1 + 0x16c))();
      puStack_38 = (undefined *)0xe19584;
      piVar7 = (int *)func_0x007b1014(piVar1);
      puVar3 = puStack_34;
      puStack_34 = (undefined4 *)0xe1958d;
      (**(code **)(*piVar7 + 0xc))(piVar7,puVar3,(int)register0x00000010 + -0x18);
      puStack_34 = (undefined4 *)0xe1959e;
      func_0x0079acec(unaff_ESI,CONCAT22(extraout_var_00,0x5e),8);
      puStack_34 = (undefined4 *)0xe195af;
      func_0x0079acec(unaff_EBX,CONCAT22(extraout_var_01,0x3b),1);
      puStack_34 = piStack_10;
      puStack_38 = &UNK_00e19930;
      iStack_3c = (int)register0x00000010 + -0x1c;
      uStack_40 = 0xe195c5;
      uStack_40 = (**(code **)(*piVar1 + 0x16c))();
      puStack_44 = (undefined *)0xe195cd;
      piVar7 = (int *)func_0x007b1014(piVar1);
      uVar8 = uStack_40;
      uStack_40 = 0xe195d6;
      (**(code **)(*piVar7 + 0xc))(piVar7,uVar8,&UNRECOVERED_JUMPTABLE);
      uStack_40 = 0xe195e7;
      func_0x0079acec(UNRECOVERED_JUMPTABLE,CONCAT22(extraout_var_02,0x5e),2);
      puStack_44 = &UNK_00e19940;
      ppuStack_48 = &puStack_24;
      puStack_4c = (undefined *)0xe195fd;
      uStack_40 = unaff_EDI;
      puStack_4c = (undefined *)(**(code **)(*piVar1 + 0x16c))();
      piStack_50 = (int *)0xe19605;
      piVar7 = (int *)func_0x007b1014(piVar1);
      puVar10 = puStack_4c;
      puStack_4c = (undefined *)0xe1960e;
      (**(code **)(*piVar7 + 0xc))(piVar7,puVar10,&uStack_28);
      puStack_4c = (undefined *)0xe1961f;
      func_0x0079acec(uStack_28,CONCAT22(extraout_var_03,0x5e),6);
      puStack_4c = puStack_24;
      piStack_50 = (int *)&UNK_00e19940;
      pppiStack_54 = &ppiStack_2c;
      ppiStack_58 = &piStack_30;
      ppiStack_5c = (int **)0xe19639;
      ppiStack_5c = (int **)(**(code **)(*piVar1 + 0x16c))();
      puStack_60 = (undefined *)0xe19641;
      piVar7 = (int *)func_0x007b1014(piVar1);
      ppiVar2 = ppiStack_5c;
      ppiStack_5c = (int **)0xe1964a;
      (**(code **)(*piVar7 + 0xc))(piVar7,ppiVar2,&puStack_34);
      ppiStack_5c = (int **)0xe1965b;
      func_0x0079acec(puStack_34,CONCAT22(extraout_var_04,0x5e),5);
      ppiStack_5c = (int **)0xe1966c;
      func_0x0079acec(piStack_30,CONCAT22(extraout_var_05,0x3b),2);
      ppiStack_5c = ppiStack_2c;
      puStack_60 = &UNK_00e19954;
      piStack_64 = &iStack_3c;
      uStack_6c = (double)CONCAT44(0xe19682,(undefined4)uStack_6c);
      uStack_6c._4_4_ = (**(code **)(*piVar1 + 0x16c))();
      uStack_6c._0_4_ = 0xe1968a;
      piVar7 = (int *)func_0x007b1014(piVar1);
      uVar8 = uStack_6c._4_4_;
      uStack_6c = (double)CONCAT44(0xe19693,(undefined4)uStack_6c);
      (**(code **)(*piVar7 + 0xc))(piVar7,uVar8,&uStack_40);
      uStack_6c = (double)CONCAT44(0xe196a4,(undefined4)uStack_6c);
      func_0x0079acec(uStack_40,CONCAT22(extraout_var_06,0x5e),3);
      uStack_6c = (double)CONCAT44(0xe196ac,(undefined4)uStack_6c);
      func_0x009b18cc(iStack_3c);
      uStack_6c = (double)in_ST0;
      func_0x009b11a0(&UNK_00e19968,&puStack_38);
      puVar9 = &UNK_00e19994;
      puVar10 = puStack_38;
      func_0x0040c214(&iStack_c,10);
      func_0x009fffc4(*(undefined4 *)(param_1 + 0x4c8),iStack_c);
      uVar8 = func_0x007adbdc(piVar1);
      rTIU_LoadDocumentText(*(undefined4 *)(*(int *)(param_1 + 0x74c) + 0x330),uVar8);
      iVar6 = **(int **)(param_1 + 0x74c);
      (**(code **)(iVar6 + 0x18c))(*(int **)(param_1 + 0x74c),0,iVar6,puVar9,puVar10);
      func_0x00709128(*(undefined4 *)(param_1 + 0x56c),1);
      func_0x007090d4(*(undefined4 *)(param_1 + 0x56c),0);
      func_0x00709128(*(undefined4 *)(param_1 + 0x598),0);
      func_0x00709128(*(undefined4 *)(param_1 + 0x59c),0);
      func_0x00729a50(*_DAT_0124fe08,0);
      func_0x009b60ec(0);
      if (*(char *)(param_1 + 0x92e) != '\0') {
        func_0x006a60c4(*(undefined4 *)(param_1 + 0x5e4),*(undefined4 *)(param_1 + 0x930));
        iVar6 = *(int *)(param_1 + 0x5e4);
        *(undefined2 *)(iVar6 + 0x78) = 0;
        func_0x00e05190(*_DAT_0124efd4,*(undefined4 *)(param_1 + 0x74c),iVar6,DAT_00e19998,
                        0xff00000d);
      }
      func_0x00a95d0c(*(undefined4 *)(param_1 + 0x768));
    }
    if (*_DAT_0124eacc != 0) {
      ppiStack_2c = (int **)0xe197be;
      func_0x00d4b324(*_DAT_0124eacc);
    }
    ppiStack_2c = (int **)0xe197c5;
    func_0x00e152c4(param_1);
    ppiStack_2c = (int **)0xe197d3;
    (**(code **)(**(int **)(param_1 + 0x4c4) + 0xdc))();
    ppiStack_2c = (int **)0xe197e1;
    (**(code **)(**(int **)(param_1 + 0x74c) + 0xdc))();
    ppiStack_2c = (int **)0xe197e8;
    cVar5 = func_0x00e0ff00(param_1);
    if (cVar5 == '\0') {
      ppiStack_2c = (int **)0xe197f3;
      func_0x00e14f40(param_1);
    }
    ppiStack_2c = (int **)0xe19800;
    func_0x00449fdc(&piStack_50,&UNK_00e199a8);
    ppiStack_2c = &piStack_50;
    piStack_30 = (int *)0xe19812;
    func_0x007ae008(*(undefined4 *)(param_1 + 0x4dc),&puStack_60);
    ppiVar2 = ppiStack_2c;
    ppiStack_2c = (int **)0xe1981b;
    func_0x0044e1a0(ppiVar2,&puStack_60);
    ppiStack_2c = (int **)0xe19826;
    func_0x0044973c(&uStack_8,&piStack_50);
    ppiStack_2c = &piStack_64;
    piStack_30 = (int *)0xe19838;
    piStack_30 = (int *)(**(code **)(**(int **)(param_1 + 0x4dc) + 0x16c))();
    puStack_34 = (undefined4 *)0xe19844;
    piVar7 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
    piVar1 = piStack_30;
    piStack_30 = (int *)0xe1984d;
    (**(code **)(*piVar7 + 0xc))(piVar7,piVar1,(int)&uStack_6c + 4);
    piStack_30 = (int *)0xe1985e;
    func_0x0079acec(uStack_6c._4_4_,CONCAT22(extraout_var_07,0x5e),0xb);
    piStack_30 = piStack_64;
    puStack_34 = (undefined4 *)0xe19873;
    func_0x0079af38(&uStack_8,CONCAT22(extraout_var_08,0x5e),10);
    puStack_34 = (undefined4 *)0xe19880;
    func_0x011d3f74(&UNK_00e199c0,uStack_8);
  }
  puVar4 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e198c4;
  puStack_24 = (undefined *)0xe1989a;
  func_0x0040b034((int)&uStack_6c + 4,2,puVar4);
  puStack_24 = (undefined *)0xe198ad;
  func_0x0040d1c4(&puStack_60,_DAT_004012c8,2);
  puStack_24 = (undefined *)0xe198ba;
  func_0x0040b034(&uStack_40,0xf);
                    /* WARNING: Could not recover jumptable at 0x00e198bb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

