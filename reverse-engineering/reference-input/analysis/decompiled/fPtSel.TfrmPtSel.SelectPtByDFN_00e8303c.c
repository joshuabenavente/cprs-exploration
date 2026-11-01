/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fPtSel_TfrmPtSel_SelectPtByDFN(int param_1,undefined4 param_2)

{
  int *piVar1;
  undefined1 *puVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  undefined4 uVar6;
  int extraout_EDX;
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
  undefined1 uVar7;
  float10 in_ST0;
  undefined4 uStack_58;
  undefined4 **ppuStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 **ppuStack_3c;
  undefined1 auStack_38 [8];
  undefined4 ****ppppuStack_30;
  undefined4 *puStack_2c;
  undefined4 uStack_28;
  undefined *puStack_24;
  undefined4 UNRECOVERED_JUMPTABLE;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  uStack_10 = 10;
  do {
    uStack_10 = uStack_10 + -1;
  } while (uStack_10 != 0);
  UNRECOVERED_JUMPTABLE = (code *)0xe8305c;
  uStack_8 = param_2;
  func_0x0040b0c8(param_2);
  puStack_24 = &UNK_00e834e6;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)(auStack_38 + 0x34);
  if (*(char *)(*_DAT_0124f7c4 + 0x6e0) == '\0') {
    puStack_2c = (undefined4 *)0xe8307f;
    UNRECOVERED_JUMPTABLE = (code *)(auStack_38 + 0x34);
    iVar5 = func_0x00e7b400();
    if (*(char *)(iVar5 + 0x14) != '\0') {
      puStack_2c = (undefined4 *)0xe8308a;
      func_0x00e7b400();
      puStack_2c = (undefined4 *)0xe8308f;
      cVar3 = func_0x00e7bf48();
      if (cVar3 != '\0') {
        puStack_2c = (undefined4 *)0xe830ab;
        cVar3 = func_0x01005830(*(undefined4 *)(*_DAT_0124f7c4 + 0x6dc),&iStack_c,uStack_8);
        if ((cVar3 == '\0') && (iStack_c == 2)) {
          *(undefined1 *)(param_1 + 0x52c) = 1;
          goto LAB_00e834c1;
        }
      }
    }
  }
  puStack_2c = (undefined4 *)0xe830d0;
  uCore_TPatient_SetDFN(*_DAT_0124f2e0,uStack_8);
  puStack_2c = (undefined4 *)0xe830dc;
  func_0x011d4e80(*_DAT_0124e2a0);
  puStack_2c = (undefined4 *)0xe830e8;
  func_0x011d5ac8(*_DAT_0124f8dc);
  if (*(int *)(*(int *)(param_1 + 0x510) + 0x344) == 0x10) {
    puStack_2c = (undefined4 *)0xe83106;
    iVar5 = func_0x007b3b20(*(undefined4 *)(*(int *)(param_1 + 0x510) + 0x2f0));
    if (extraout_EDX != 0) {
      if (0 < extraout_EDX) goto LAB_00e8311c;
      goto LAB_00e831cf;
    }
    if (iVar5 == 0) goto LAB_00e831cf;
LAB_00e8311c:
    puStack_2c = &uStack_10;
    ppppuStack_30 = (undefined4 ****)0xe8312b;
    uVar6 = func_0x007b3b44(*(undefined4 *)(param_1 + 0x480));
    piVar1 = *(int **)(*(int *)(param_1 + 0x480) + 0x2c8);
    ppppuStack_30 = (undefined4 ****)0xe83141;
    (**(code **)(*piVar1 + 0xc))(piVar1,uVar6,auStack_38 + 0x24);
    ppppuStack_30 = (undefined4 ****)0xe83152;
    func_0x0079acec(unaff_EBX,CONCAT22(extraout_var,0x5e),4);
    ppppuStack_30 = (undefined4 ****)0xe8315a;
    cVar3 = func_0x009b17dc(uStack_10);
    if (cVar3 == '\0') goto LAB_00e831cf;
    puStack_2c = (undefined4 *)0xe8316f;
    uVar6 = func_0x007b3b20(*(undefined4 *)(*(int *)(param_1 + 0x510) + 0x2f0));
    puStack_2c = (undefined4 *)0xe8317d;
    func_0x011d5240(*_DAT_0124e2a0,uVar6);
    iVar5 = *(int *)(param_1 + 0x480);
    puStack_2c = (undefined4 *)(auStack_38 + 0x20);
    ppppuStack_30 = (undefined4 ****)0xe8318e;
    uVar6 = func_0x007b3b44(iVar5);
    piVar1 = *(int **)(iVar5 + 0x2c8);
    ppppuStack_30 = (undefined4 ****)0xe8319e;
    (**(code **)(*piVar1 + 0xc))(piVar1,uVar6,auStack_38 + 0x1c);
    ppppuStack_30 = (undefined4 ****)0xe831af;
    func_0x0079acec(unaff_EDI,CONCAT22(extraout_var_00,0x5e),4);
    ppppuStack_30 = (undefined4 ****)0xe831b7;
    func_0x009b18cc(unaff_ESI);
    unique0x0000aa00 = (double)in_ST0;
    auStack_38._0_4_ = 0xe831ca;
    func_0x011d51c8(*_DAT_0124e2a0);
  }
  else {
LAB_00e831cf:
    if (*(int *)(*(int *)(param_1 + 0x510) + 0x344) == 0xb) {
      puStack_2c = (undefined4 *)0xe831e7;
      sVar4 = func_0x011cc430();
      if (sVar4 == 0x43) {
        puStack_2c = &UNRECOVERED_JUMPTABLE;
        iVar5 = *(int *)(param_1 + 0x480);
        ppppuStack_30 = (undefined4 ****)0xe83202;
        uVar6 = func_0x007b3b44(iVar5);
        piVar1 = *(int **)(iVar5 + 0x2c8);
        ppppuStack_30 = (undefined4 ****)0xe83212;
        (**(code **)(*piVar1 + 0xc))(piVar1,uVar6,&puStack_24);
        ppppuStack_30 = (undefined4 ****)0xe83223;
        func_0x0079acec(puStack_24,CONCAT22(extraout_var_01,0x5e),4);
        ppppuStack_30 = (undefined4 ****)0xe8322b;
        cVar3 = func_0x009b17dc(UNRECOVERED_JUMPTABLE);
        if (cVar3 != '\0') {
          iVar5 = *(int *)(param_1 + 0x480);
          puStack_2c = &uStack_28;
          ppppuStack_30 = (undefined4 ****)0xe83244;
          uVar6 = func_0x007b3b44(iVar5);
          ppppuStack_30 = (undefined4 ****)0xe83254;
          (**(code **)(**(int **)(iVar5 + 0x2c8) + 0xc))(*(int **)(iVar5 + 0x2c8),uVar6,&puStack_2c)
          ;
          ppppuStack_30 = (undefined4 ****)0xe83265;
          func_0x0079acec(puStack_2c,CONCAT22(extraout_var_02,0x5e),10);
          ppppuStack_30 = (undefined4 ****)0xe8326f;
          uVar6 = func_0x0042d238(uStack_28,0);
          ppppuStack_30 = (undefined4 ****)0xe8327d;
          func_0x011d5240(*_DAT_0124e2a0,uVar6);
          ppppuStack_30 = &ppppuStack_30;
          auStack_38._4_4_ = 0xe83288;
          uVar6 = func_0x007b3b44(iVar5);
          auStack_38._4_4_ = 0xe83298;
          (**(code **)(**(int **)(iVar5 + 0x2c8) + 0xc))
                    (*(int **)(iVar5 + 0x2c8),uVar6,auStack_38 + 4);
          uVar6 = auStack_38._4_4_;
          auStack_38._4_4_ = 0xe832a9;
          func_0x0079acec(uVar6,CONCAT22(extraout_var_03,0x5e),4);
          auStack_38._4_4_ = 0xe832b1;
          func_0x009b18cc(ppppuStack_30);
          auStack_38 = (undefined1  [8])(double)in_ST0;
          ppuStack_3c = (undefined4 **)0xe832c4;
          func_0x011d51c8(*_DAT_0124e2a0);
          goto LAB_00e8347f;
        }
      }
    }
    uVar7 = *(int *)(*(int *)(param_1 + 0x510) + 0x344) == 0xb;
    if ((bool)uVar7) {
      puStack_2c = (undefined4 *)0xe832eb;
      func_0x0040c324(_DAT_0125a260,&UNK_00e83500);
      if ((bool)uVar7) {
        puStack_2c = (undefined4 *)auStack_38;
        ppppuStack_30 = (undefined4 ****)&ppuStack_3c;
        iVar5 = *(int *)(param_1 + 0x480);
        auStack_38._4_4_ = 0xe83306;
        uVar6 = func_0x007b3b44(iVar5);
        piVar1 = *(int **)(iVar5 + 0x2c8);
        auStack_38._4_4_ = 0xe83316;
        (**(code **)(*piVar1 + 0xc))(piVar1,uVar6,&uStack_40);
        auStack_38._4_4_ = 0xe83327;
        func_0x0079acec(uStack_40,CONCAT22(extraout_var_04,0x5e),3);
        auStack_38._4_4_ = 0xe83339;
        func_0x0040c35c(ppuStack_3c,1,2);
        auStack_38._4_4_ = 0xe83346;
        func_0x0040c324(auStack_38._0_4_,&UNK_00e83524);
        if ((bool)uVar7) {
          puStack_2c = &uStack_44;
          ppppuStack_30 = (undefined4 ****)0xe8335b;
          uVar6 = func_0x007b3b44(*(undefined4 *)(param_1 + 0x480));
          piVar1 = *(int **)(*(int *)(param_1 + 0x480) + 0x2c8);
          ppppuStack_30 = (undefined4 ****)0xe83371;
          (**(code **)(*piVar1 + 0xc))(piVar1,uVar6,&uStack_48);
          ppppuStack_30 = (undefined4 ****)0xe83382;
          func_0x0079acec(uStack_48,CONCAT22(extraout_var_05,0x5e),8);
          ppppuStack_30 = (undefined4 ****)0xe8338a;
          cVar3 = func_0x009b17dc(uStack_44);
          if (cVar3 != '\0') {
            iVar5 = *(int *)(param_1 + 0x480);
            puStack_2c = &uStack_4c;
            ppppuStack_30 = (undefined4 ****)0xe833a3;
            uVar6 = func_0x007b3b44(iVar5);
            ppppuStack_30 = (undefined4 ****)0xe833b3;
            (**(code **)(**(int **)(iVar5 + 0x2c8) + 0xc))
                      (*(int **)(iVar5 + 0x2c8),uVar6,&uStack_50);
            ppppuStack_30 = (undefined4 ****)0xe833c4;
            func_0x0079acec(uStack_50,CONCAT22(extraout_var_06,0x5e),7);
            ppppuStack_30 = (undefined4 ****)0xe833ce;
            uVar6 = func_0x0042d238(uStack_4c,0);
            ppppuStack_30 = (undefined4 ****)0xe833dc;
            func_0x011d5240(*_DAT_0124e2a0,uVar6);
            ppppuStack_30 = (undefined4 ****)&ppuStack_54;
            auStack_38._4_4_ = 0xe833e7;
            uVar6 = func_0x007b3b44(iVar5);
            auStack_38._4_4_ = 0xe833f7;
            (**(code **)(**(int **)(iVar5 + 0x2c8) + 0xc))
                      (*(int **)(iVar5 + 0x2c8),uVar6,&uStack_58);
            auStack_38._4_4_ = 0xe83408;
            func_0x0079acec(uStack_58,CONCAT22(extraout_var_07,0x5e),8);
            auStack_38._4_4_ = 0xe83410;
            func_0x009b18cc(ppuStack_54);
            auStack_38 = (undefined1  [8])(double)in_ST0;
            ppuStack_3c = (undefined4 **)0xe83423;
            func_0x011d51c8(*_DAT_0124e2a0);
            goto LAB_00e8347f;
          }
        }
      }
    }
    if (*(char *)(*_DAT_0124f2e0 + 0x35) != '\0') {
      puStack_2c = (undefined4 *)0xe83440;
      func_0x011d521c(*_DAT_0124e2a0,1);
      puStack_2c = (undefined4 *)0xe83456;
      func_0x011d5240(*_DAT_0124e2a0,*(undefined4 *)(*_DAT_0124f2e0 + 0x3c));
      puStack_2c = *(undefined4 **)(*_DAT_0124f2e0 + 0x54);
      ppppuStack_30 = *(undefined4 *****)(*_DAT_0124f2e0 + 0x50);
      auStack_38._4_4_ = 0xe8346f;
      func_0x011d51c8(*_DAT_0124e2a0);
      auStack_38._4_4_ = 0xe8347f;
      func_0x011d52e0(*_DAT_0124e2a0,CONCAT22(extraout_var_08,0x48));
    }
  }
LAB_00e8347f:
  if (*(char *)(*_DAT_0124f9dc + 0x19) != '\0') {
    puStack_2c = *(undefined4 **)(*_DAT_0124f9dc + 0xc);
    ppppuStack_30 = *(undefined4 *****)(*_DAT_0124f9dc + 8);
    auStack_38._4_4_ = 0xe834a5;
    func_0x011d527c(*_DAT_0124e2a0);
  }
  *(undefined1 *)(param_1 + 0x52c) = 0;
  *(undefined1 *)(param_1 + 0x52d) = 1;
  *(undefined1 *)(param_1 + 0x52e) = 1;
  puStack_2c = (undefined4 *)0xe834c1;
  func_0x00727128(param_1);
LAB_00e834c1:
  puVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e834ed;
  puStack_24 = (undefined *)0xe834db;
  func_0x0040b034(&uStack_58,0x13,puVar2);
  puStack_24 = (undefined *)0xe834e3;
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00e834e4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

