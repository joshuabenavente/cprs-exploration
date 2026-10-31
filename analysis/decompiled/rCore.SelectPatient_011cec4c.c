/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rCore_SelectPatient(undefined4 param_1,int param_2)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
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
  undefined2 uVar4;
  undefined2 extraout_var_09;
  undefined2 extraout_var_10;
  undefined2 extraout_var_11;
  undefined2 extraout_var_12;
  undefined2 extraout_var_13;
  undefined2 extraout_var_14;
  undefined2 extraout_var_15;
  undefined2 extraout_var_16;
  undefined2 extraout_var_17;
  undefined2 extraout_var_18;
  undefined2 extraout_var_19;
  undefined2 extraout_var_20;
  undefined2 extraout_var_21;
  undefined2 extraout_var_22;
  undefined2 extraout_var_23;
  undefined2 extraout_var_24;
  undefined2 extraout_var_25;
  undefined4 unaff_EBX;
  undefined4 unaff_ESI;
  int *in_FS_OFFSET;
  undefined1 uVar5;
  float10 in_ST0;
  float10 in_ST1;
  undefined4 *puVar6;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_80;
  undefined4 *puStack_7c;
  undefined4 ***pppuStack_78;
  undefined4 ***pppuStack_74;
  undefined4 ***pppuStack_70;
  undefined4 ***pppuStack_6c;
  int **ppiStack_68;
  undefined4 **ppuStack_64;
  undefined4 **ppuStack_60;
  undefined4 ***pppuStack_5c;
  int **ppiStack_58;
  undefined4 **ppuStack_54;
  int *piStack_50;
  undefined4 *puStack_4c;
  undefined4 *puStack_48;
  undefined4 **ppuStack_44;
  int *piStack_40;
  undefined **ppuStack_3c;
  undefined4 *puStack_38;
  int iStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 *puStack_28;
  int iStack_24;
  undefined *puStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  uStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  iVar3 = 0xf;
  do {
    uStack_8 = 0;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  puStack_20 = &UNK_011cf0cb;
  iStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_24;
  puStack_28 = &uStack_8;
  uStack_2c = 0;
  uStack_30 = 0;
  uStack_c = 0x11;
  iStack_34 = 0x11cec8e;
  uStack_10 = param_1;
  ORNet_CallVistA(&UNK_011cf0e4,&uStack_10,0);
  *_DAT_0124e118 = 0;
  iStack_34 = (int)register0x00000010 + -0x14;
  puStack_38 = (undefined4 *)0x11cecab;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var,0x5e),1);
  puStack_38 = (undefined4 *)0x11cecb5;
  func_0x0040b3c4(param_2,unaff_EBX);
  puStack_38 = (undefined4 *)((int)register0x00000010 + -0x18);
  ppuStack_3c = (undefined **)0x11cecca;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_00,0x5e),0xe);
  ppuStack_3c = (undefined **)0x11cecd5;
  func_0x0040b3c4(param_2 + 4,unaff_ESI);
  ppuStack_3c = &puStack_20;
  piStack_40 = (int *)0x11cecea;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_01,0x5e),4);
  piStack_40 = (int *)0x11cecf5;
  func_0x011ca4f0(puStack_20,&uStack_1c);
  piStack_40 = (int *)0x11ced00;
  func_0x0040b3c4(param_2 + 0xc,uStack_1c);
  piStack_40 = &iStack_24;
  ppuStack_44 = (undefined4 **)0x11ced15;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_02,0x5e),3);
  ppuStack_44 = (undefined4 **)0x11ced1d;
  func_0x009b18cc(iStack_24);
  *(double *)(param_2 + 0x10) = (double)in_ST0;
  ppuStack_44 = &puStack_28;
  puStack_48 = (undefined4 *)0x11ced36;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_03,0x5e),0xf);
  puStack_48 = (undefined4 *)0x11ced40;
  uVar2 = func_0x0042d238(puStack_28,0);
  *(undefined4 *)(param_2 + 0x18) = uVar2;
  puStack_48 = &uStack_2c;
  puStack_4c = (undefined4 *)0x11ced58;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_04,0x5e),0x12);
  puStack_4c = (undefined4 *)0x11ced63;
  func_0x0040b3c4(param_2 + 0x68,uStack_2c);
  puStack_4c = &uStack_30;
  piStack_50 = (int *)0x11ced78;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_05,0x5e),0x13);
  piStack_50 = (int *)0x11ced83;
  func_0x0040b3c4(param_2 + 0x6c,uStack_30);
  piStack_50 = &iStack_34;
  ppuStack_54 = (undefined4 **)0x11ced98;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_06,0x5e),2);
  iVar3 = 0;
  if (iStack_34 != 0) {
    iVar3 = *(int *)(iStack_34 + -4);
  }
  if (iVar3 < 1) {
    *(undefined2 *)(param_2 + 0x1c) = 0x55;
    uVar4 = extraout_var_07;
  }
  else {
    ppuStack_54 = &puStack_38;
    ppiStack_58 = (undefined4 **)0x11cedbb;
    func_0x0079acec(uStack_8,CONCAT22(extraout_var_07,0x5e),2);
    *(undefined2 *)(param_2 + 0x1c) = *(undefined2 *)puStack_38;
    uVar4 = extraout_var_08;
  }
  ppuStack_54 = &ppuStack_3c;
  ppiStack_58 = (undefined4 **)0x11cede2;
  func_0x0079acec(uStack_8,CONCAT22(uVar4,0x5e),5);
  ppiStack_58 = (undefined4 **)0x11cedec;
  uVar2 = func_0x0042d238(ppuStack_3c,0);
  *(undefined4 *)(param_2 + 0x20) = uVar2;
  ppiStack_58 = &piStack_40;
  pppuStack_5c = (undefined4 ***)0x11cee04;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_09,0x5e),6);
  pppuStack_5c = (undefined4 ***)0x11cee0f;
  func_0x0040b3c4(param_2 + 0x24,piStack_40);
  pppuStack_5c = &ppuStack_44;
  ppuStack_60 = (undefined4 **)0x11cee24;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_10,0x5e),7);
  ppuStack_60 = (undefined4 **)0x11cee2f;
  func_0x0040b3c4(param_2 + 0x2c,ppuStack_44);
  ppuStack_60 = &puStack_48;
  ppuStack_64 = (undefined4 **)0x11cee44;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_11,0x5e),0x10);
  uVar5 = 1;
  ppuStack_64 = (undefined4 **)0x11cee4e;
  uVar2 = func_0x0042d238(puStack_48);
  *(undefined4 *)(param_2 + 0x30) = uVar2;
  ppuStack_64 = &puStack_4c;
  ppiStack_68 = (undefined4 **)0x11cee66;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_12,0x5e),0x11);
  ppiStack_68 = (undefined4 **)0x11cee71;
  func_0x0040b3c4(param_2 + 0x34,puStack_4c);
  ppiStack_68 = &piStack_50;
  pppuStack_6c = (undefined4 ***)0x11cee86;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_13,0x5e),8);
  pppuStack_6c = (undefined4 ***)0x11cee91;
  func_0x0040b3c4(param_2 + 0x38,piStack_50);
  pppuStack_6c = &ppuStack_54;
  pppuStack_70 = (undefined4 ***)0x11ceea6;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_14,0x5e),9);
  pppuStack_70 = (undefined4 ***)0x11ceeb3;
  func_0x0040c324(ppuStack_54,&UNK_011cf10c);
  *(undefined1 *)(param_2 + 0x3c) = uVar5;
  pppuStack_70 = &ppiStack_58;
  pppuStack_74 = (undefined4 ***)0x11ceece;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_15,0x5e),10);
  pppuStack_74 = (undefined4 ***)0x11ceed6;
  func_0x009b18cc(ppiStack_58);
  *(double *)(param_2 + 0x40) = (double)in_ST1;
  pppuStack_74 = &pppuStack_5c;
  pppuStack_78 = (undefined4 ***)0x11ceeef;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_16,0x5e),0xc);
  pppuStack_78 = (undefined4 ***)0x11ceefc;
  func_0x0040c324(pppuStack_5c,&UNK_011cf10c);
  *(undefined1 *)(param_2 + 0x48) = uVar5;
  pppuStack_78 = &ppuStack_60;
  puStack_7c = (undefined4 *)0x11cef17;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_17,0x5e),0xd);
  puStack_7c = (undefined4 *)0x11cef21;
  uVar2 = func_0x0042d238(ppuStack_60,0);
  *(undefined4 *)(param_2 + 0x4c) = uVar2;
  puStack_7c = &uStack_8;
  uStack_80 = 0;
  uStack_c = 0x11;
  uStack_10 = param_1;
  ORNet_CallVistA(&UNK_011cf11c,&uStack_10,0,0);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_18,0x5e),1,&ppuStack_64);
  func_0x0040b3c4(param_2 + 0x50,ppuStack_64);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_19,0x5e),2,&ppiStack_68);
  func_0x0040b3c4(param_2 + 0x54,ppiStack_68);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_20,0x5e),4,&pppuStack_6c);
  func_0x0040b3c4(param_2 + 0x60,pppuStack_6c);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_21,0x5e),5,&pppuStack_70);
  func_0x0040b3c4(param_2 + 0x58,pppuStack_70);
  iVar3 = 0;
  if (*(int *)(param_2 + 0x24) != 0) {
    iVar3 = *(int *)(*(int *)(param_2 + 0x24) + -4);
  }
  if (0 < iVar3) {
    func_0x0079acec(uStack_8,CONCAT22(extraout_var_22,0x5e),3,&pppuStack_74);
    func_0x0040b3c4(param_2 + 0x5c,pppuStack_74);
    func_0x0079acec(uStack_8,CONCAT22(extraout_var_23,0x5e),6,&pppuStack_78);
    func_0x0040b3c4(param_2 + 100,pppuStack_78);
    uStack_c = 0x11;
    uStack_10 = param_1;
    ORNet_CallVistA(&UNK_011cf144,&uStack_10,0,0,0,&uStack_8);
    func_0x0079acec(uStack_8,CONCAT22(extraout_var_24,0x5e),3,&puStack_7c);
    func_0x0040b3c4(param_2 + 0x28,puStack_7c);
  }
  uVar2 = 0;
  uStack_c = 0x11;
  uStack_10 = param_1;
  cVar1 = ORNet_CallVistA(&UNK_011cf16c,&uStack_10,0,0,0,param_2 + 8);
  uVar5 = cVar1 == '\0';
  if ((bool)uVar5) {
    puVar6 = (undefined4 *)0x11cf0a6;
    func_0x0040afd4(param_2 + 8);
  }
  else {
    puVar6 = &uStack_80;
    func_0x0079acec(*(undefined4 *)(param_2 + 8),CONCAT22(extraout_var_25,0x5e),1);
    func_0x0040c324(uStack_80,&UNK_011cf1a0);
    if ((bool)uVar5) {
      func_0x0040afd4(param_2 + 8);
    }
  }
  *in_FS_OFFSET = (int)puVar6;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011cf0d2;
  func_0x0040b034(&uStack_80,0x1c,uVar2);
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x011cf0c9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

