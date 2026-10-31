/* Static Ghidra output. Delphi register ABI and types require review. */

void rCore_GetPtIDInfo(undefined4 param_1,int param_2)

{
  short sVar1;
  char cVar2;
  int iVar3;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined2 uVar4;
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
  undefined2 extraout_var_18;
  undefined4 unaff_EBX;
  undefined4 unaff_ESI;
  int *in_FS_OFFSET;
  undefined1 uVar5;
  undefined4 **ppuStack_58;
  undefined4 **ppuStack_54;
  undefined4 **ppuStack_50;
  undefined4 **ppuStack_4c;
  int *piStack_48;
  undefined4 *puStack_44;
  undefined4 *puStack_40;
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
  iVar3 = 10;
  do {
    uStack_8 = 0;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  puStack_20 = &UNK_011ce739;
  iStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_24;
  puStack_28 = &uStack_8;
  uStack_2c = 0;
  uStack_30 = 0;
  uStack_c = 0x11;
  iStack_34 = 0x11ce426;
  uStack_10 = param_1;
  ORNet_CallVistA(&UNK_011ce754,&uStack_10,0);
  iStack_34 = (int)register0x00000010 + -0x18;
  puStack_38 = (undefined4 *)0x11ce43b;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var,0x5e),8);
  puStack_38 = (undefined4 *)0x11ce448;
  func_0x009b2a68(unaff_ESI,0,(int)register0x00000010 + -0x14);
  puStack_38 = (undefined4 *)0x11ce452;
  func_0x0040b3c4(param_2,unaff_EBX);
  puStack_38 = &uStack_1c;
  ppuStack_3c = (undefined **)0x11ce467;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_00,0x5e),1);
  ppuStack_3c = (undefined **)0x11ce472;
  func_0x0040b3c4(param_2 + 4,uStack_1c);
  ppuStack_3c = &puStack_20;
  puStack_40 = (undefined4 *)0x11ce487;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_01,0x5e),2);
  puStack_40 = (undefined4 *)0x11ce492;
  func_0x0040b3c4(param_2 + 8,puStack_20);
  puStack_40 = (undefined4 *)0x11ce49a;
  func_0x0040afd4(param_2 + 0xc);
  puStack_40 = (undefined4 *)0x11ce4a2;
  cVar2 = func_0x011ca608(*(undefined4 *)(param_2 + 4));
  if (cVar2 != '\0') {
    puStack_40 = (undefined4 *)0x11ce4b1;
    func_0x011ca4f0(*(undefined4 *)(param_2 + 4),&iStack_24);
    puStack_40 = (undefined4 *)0x11ce4bc;
    func_0x0040b3c4(param_2 + 4,iStack_24);
  }
  puStack_40 = (undefined4 *)0x11ce4c4;
  cVar2 = func_0x011ca654(*(undefined4 *)(param_2 + 8));
  uVar4 = extraout_var_02;
  if (cVar2 != '\0') {
    puStack_40 = (undefined4 *)0x11ce4d8;
    func_0x009b1794(&UNK_011ce77c,*(undefined4 *)(param_2 + 8),&puStack_28);
    puStack_40 = (undefined4 *)0x11ce4e3;
    func_0x0040b3c4(param_2 + 8,puStack_28);
    uVar4 = extraout_var_03;
  }
  puStack_40 = &uStack_2c;
  puStack_44 = (undefined4 *)0x11ce4f8;
  func_0x0079acec(uStack_8,CONCAT22(uVar4,0x5e),3);
  puStack_44 = (undefined4 *)0x11ce503;
  func_0x0040b3c4(param_2 + 0x10,uStack_2c);
  iVar3 = 0;
  if (*(int *)(param_2 + 0x10) != 0) {
    iVar3 = *(int *)(*(int *)(param_2 + 0x10) + -4);
  }
  if (iVar3 == 0) {
    puStack_44 = (undefined4 *)0x11ce51e;
    func_0x0040b3c4(param_2 + 0x10,&UNK_011ce7a0);
  }
  sVar1 = **(short **)(param_2 + 0x10);
  if (sVar1 == 0x46) {
LAB_011ce53e:
    uVar5 = 1;
    puStack_44 = (undefined4 *)0x11ce54b;
    func_0x0040b3c4(param_2 + 0x10,&UNK_011ce7b0);
    uVar4 = extraout_var_04;
  }
  else {
    uVar5 = sVar1 == 0x4d;
    if (!(bool)uVar5) {
      if (sVar1 == 0x66) goto LAB_011ce53e;
      uVar5 = sVar1 == 0x6d;
      if (!(bool)uVar5) {
        puStack_44 = (undefined4 *)0x11ce569;
        func_0x0040b3c4(param_2 + 0x10,&UNK_011ce7e4);
        uVar4 = extraout_var_06;
        goto LAB_011ce569;
      }
    }
    puStack_44 = (undefined4 *)0x11ce55a;
    func_0x0040b3c4(param_2 + 0x10,&UNK_011ce7cc);
    uVar4 = extraout_var_05;
  }
LAB_011ce569:
  puStack_44 = &uStack_30;
  piStack_48 = (int *)0x11ce57e;
  func_0x0079acec(uStack_8,CONCAT22(uVar4,0x5e),4);
  piStack_48 = (int *)0x11ce58b;
  func_0x0040c324(uStack_30,&UNK_011ce800);
  if ((bool)uVar5) {
    piStack_48 = (int *)0x11ce59a;
    func_0x0040b3c4(param_2 + 0x18,&UNK_011ce810);
    uVar4 = extraout_var_07;
  }
  else {
    piStack_48 = (int *)0x11ce5a4;
    func_0x0040afd4(param_2 + 0x18);
    uVar4 = extraout_var_08;
  }
  piStack_48 = &iStack_34;
  ppuStack_4c = (undefined4 **)0x11ce5b9;
  func_0x0079acec(uStack_8,CONCAT22(uVar4,0x5e),5);
  iVar3 = 0;
  if (iStack_34 != 0) {
    iVar3 = *(int *)(iStack_34 + -4);
  }
  if (iVar3 < 1) {
    ppuStack_4c = (undefined4 **)0x11ce5f6;
    func_0x0040afd4(param_2 + 0x14);
    uVar4 = extraout_var_11;
  }
  else {
    ppuStack_4c = &puStack_38;
    ppuStack_50 = (undefined4 **)0x11ce5dc;
    func_0x0079acec(uStack_8,CONCAT22(extraout_var_09,0x5e),5);
    ppuStack_50 = (undefined4 **)0x11ce5ec;
    func_0x0040c18c(param_2 + 0x14,puStack_38,&UNK_011ce82c);
    uVar4 = extraout_var_10;
  }
  ppuStack_50 = &ppuStack_3c;
  ppuStack_54 = (undefined4 **)0x11ce60b;
  func_0x0079acec(uStack_8,CONCAT22(uVar4,0x5e),6);
  ppuStack_54 = (undefined4 **)0x11ce616;
  func_0x0040b3c4(param_2 + 0x1c,ppuStack_3c);
  ppuStack_54 = &puStack_40;
  ppuStack_58 = (undefined4 **)0x11ce62b;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_12,0x5e),7);
  ppuStack_58 = (undefined4 **)0x11ce636;
  func_0x0040b3c4(param_2 + 0x20,puStack_40);
  ppuStack_58 = &puStack_44;
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_13,0x5e),9);
  func_0x0040b3c4(param_2 + 0x24,puStack_44);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_14,0x5e),10,&piStack_48);
  func_0x0040b3c4(param_2 + 0x28,piStack_48);
  uStack_c = 0x11;
  uStack_10 = param_1;
  ORNet_CallVistA(&UNK_011ce860,&uStack_10,0,0,0,&uStack_8);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_15,0x5e),1,&ppuStack_4c);
  func_0x0040b3c4(param_2 + 0x30,ppuStack_4c);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_16,0x5e),2);
  func_0x0040b3c4(param_2 + 0x2c,ppuStack_50);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_17,0x5e),3,&ppuStack_54);
  func_0x0040b3c4(param_2 + 0x34,ppuStack_54);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var_18,0x5e),4);
  func_0x0040b3c4(param_2 + 0x38,ppuStack_58);
  *in_FS_OFFSET = (int)&ppuStack_58;
  func_0x0040b034(&ppuStack_58,0x12,&ppuStack_50);
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x011ce737. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)&UNK_011ce740)(&UNK_011ce740);
  return;
}

