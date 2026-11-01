/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rMeds_ExtractActiveMeds(undefined4 param_1,int *param_2)

{
  code *pcVar1;
  int iVar2;
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
  undefined2 extraout_var_09;
  undefined2 extraout_var_10;
  undefined2 extraout_var_11;
  undefined2 extraout_var_12;
  undefined4 *in_FS_OFFSET;
  bool bVar4;
  undefined1 uVar5;
  byte bVar6;
  undefined4 *puStack_7c;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined4 *puStack_68;
  undefined4 uStack_64;
  undefined4 *puStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 *puStack_34;
  undefined4 **ppuStack_30;
  undefined4 *puStack_2c;
  undefined4 *puStack_28;
  undefined4 *puStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  iVar3 = 0xf;
  do {
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  puStack_18 = &UNK_00addcf0;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  uStack_20 = (undefined4 **)0xadd97d;
  func_0x0040b40c(&puStack_18,&UNK_00addd08);
  bVar4 = *(char *)(*_DAT_0124f2e0 + 0x35) == '\0';
  if (bVar4) {
    uStack_20 = (undefined4 **)0xadd9cb;
    func_0x0040b40c(&UNRECOVERED_JUMPTABLE,&UNK_00addd50);
  }
  else {
    uStack_20 = (undefined4 **)0xadd99e;
    func_0x0040c324(*(undefined4 *)(*_DAT_0124f2e0 + 0x40),&UNK_00addd1c);
    if (bVar4) {
      uStack_20 = (undefined4 **)0xadd9ad;
      func_0x0040b40c(&UNRECOVERED_JUMPTABLE,&UNK_00addd2c);
    }
    else {
      uStack_20 = (undefined4 **)0xadd9bc;
      func_0x0040b40c(&UNRECOVERED_JUMPTABLE,&UNK_00addd40);
    }
  }
  uStack_20 = (undefined4 **)0xadd9d3;
  iVar3 = (**(code **)(*param_2 + 0x14))();
  iVar3 = iVar3 + -1;
  if (-1 < iVar3) {
    do {
      uStack_20 = &puStack_34;
      puStack_24 = &uStack_38;
      puStack_28 = (undefined4 *)0xadd9fa;
      (**(code **)(*param_2 + 0xc))(param_2,iVar3,&uStack_3c);
      puStack_28 = (undefined4 *)0xadda0b;
      func_0x009b2f6c(uStack_3c,CONCAT22(extraout_var,0x5e),1);
      puStack_28 = (undefined4 *)0xadda1c;
      func_0x009b2f6c(uStack_38,CONCAT22(extraout_var_00,0x3b),2);
      puStack_24 = puStack_34;
      puStack_28 = (undefined4 *)0xadda32;
      iVar2 = func_0x0040c4b0(puStack_34,UNRECOVERED_JUMPTABLE,1);
      uVar5 = iVar2 == 0;
      if ((bool)uVar5) {
        puStack_28 = &uStack_40;
        puStack_2c = (undefined4 *)0xadda4d;
        (**(code **)(*param_2 + 0xc))(param_2,iVar3,&uStack_44);
        puStack_2c = (undefined4 *)0xadda5e;
        func_0x009b2f6c(uStack_44,CONCAT22(extraout_var_01,0x5e),5);
        puStack_2c = (undefined4 *)0xadda6b;
        func_0x0040c324(uStack_40,&UNK_00addd60);
        if (!(bool)uVar5) {
          uStack_20 = (undefined4 **)CONCAT13(1,(undefined3)uStack_20);
        }
      }
      puStack_28 = &uStack_48;
      puStack_2c = (undefined4 *)0xadda83;
      (**(code **)(*param_2 + 0xc))(param_2,iVar3,&uStack_4c);
      puStack_2c = (undefined4 *)0xadda94;
      func_0x009b2f6c(uStack_4c,CONCAT22(extraout_var_02,0x5e),1);
      puStack_2c = (undefined4 *)0xaddaaa;
      ppuStack_30 = (undefined4 **)func_0x0040c4b0(puStack_18,uStack_48,1);
      uVar5 = ppuStack_30 == (undefined4 **)0x0;
      if (0 < (int)ppuStack_30) {
        uStack_20 = (undefined4 **)((uint)uStack_20 & 0xffffff);
        puStack_2c = (undefined4 *)0xaddac5;
        (**(code **)(*param_2 + 0xc))(param_2,iVar3,&uStack_1c);
        puStack_2c = &uStack_54;
        ppuStack_30 = (undefined4 **)0xaddada;
        func_0x009b2f6c(uStack_1c,CONCAT22(extraout_var_03,0x5e),2);
        ppuStack_30 = (undefined4 **)0xaddaea;
        func_0x0040c18c(&uStack_50,&UNK_00addd70,uStack_54);
        ppuStack_30 = (undefined4 **)uStack_50;
        puStack_34 = (undefined4 *)0xaddaff;
        func_0x009b3114(&uStack_1c,CONCAT22(extraout_var_04,0x5e),2);
        puStack_34 = (undefined4 *)0xaddb0d;
        (**(code **)(*param_2 + 0x20))(param_2,iVar3,uStack_1c);
      }
      puStack_2c = &uStack_58;
      ppuStack_30 = (undefined4 **)0xaddb1f;
      (**(code **)(*param_2 + 0xc))(param_2,iVar3,&uStack_5c);
      ppuStack_30 = (undefined4 **)0xaddb30;
      func_0x009b2f6c(uStack_5c,CONCAT22(extraout_var_05,0x5e),5);
      ppuStack_30 = (undefined4 **)0xaddb3d;
      func_0x0040c324(uStack_58,&UNK_00addd60);
      if ((bool)uVar5) {
        uStack_20 = (undefined4 **)((uint)uStack_20 & 0xffffff);
        ppuStack_30 = (undefined4 **)0xaddb51;
        (**(code **)(*param_2 + 0xc))(param_2,iVar3,&uStack_1c);
        ppuStack_30 = (undefined4 **)&uStack_64;
        puStack_34 = (undefined4 *)0xaddb66;
        func_0x009b2f6c(uStack_1c,CONCAT22(extraout_var_06,0x5e),2);
        puStack_34 = (undefined4 *)0xaddb76;
        func_0x0040c18c(&puStack_60,&UNK_00addd90,uStack_64);
        puStack_34 = puStack_60;
        uStack_38 = 0xaddb8b;
        func_0x009b3114(&uStack_1c,CONCAT22(extraout_var_07,0x5e),2);
        uStack_38 = 0xaddb99;
        (**(code **)(*param_2 + 0x20))(param_2,iVar3,uStack_1c);
      }
      ppuStack_30 = &puStack_68;
      puStack_34 = (undefined4 *)0xaddbab;
      (**(code **)(*param_2 + 0xc))(param_2,iVar3,&uStack_6c);
      puStack_34 = (undefined4 *)0xaddbbc;
      func_0x009b2f6c(uStack_6c,CONCAT22(extraout_var_08,0x5e),4);
      puStack_34 = (undefined4 *)0xaddbc4;
      iVar2 = func_0x00addeb4(puStack_68);
      if (iVar2 == 2) {
        uStack_20 = (undefined4 **)CONCAT13(1,(undefined3)uStack_20);
      }
      bVar6 = uStack_20._3_1_ == '\0';
      if ((bool)bVar6) {
        puStack_34 = (undefined4 *)0xaddbf0;
        func_0x0040c324(UNRECOVERED_JUMPTABLE,&UNK_00addd2c);
        if ((bool)bVar6) {
          uStack_20 = (undefined4 **)0xaddc04;
          (**(code **)(*param_2 + 0xc))(param_2,iVar3,&uStack_1c);
          uStack_20 = (undefined4 **)&uStack_74;
          puStack_24 = &uStack_78;
          puStack_28 = (undefined4 *)0xaddc1d;
          func_0x009b2f6c(uStack_1c,CONCAT22(extraout_var_09,0x5e),1);
          puStack_28 = (undefined4 *)0xaddc2e;
          func_0x009b2f6c(uStack_78,CONCAT22(extraout_var_10,0x3b),2);
          puStack_28 = (undefined4 *)0xaddc3b;
          func_0x0040c324(uStack_74,&UNK_00addd50);
          puStack_28 = *(undefined4 **)(&rMeds_MED_TYPE + (bVar6 & 0x7f) * 4);
          puStack_2c = (undefined4 *)&UNK_00adddb4;
          ppuStack_30 = &puStack_7c;
          puStack_34 = (undefined4 *)0xaddc62;
          func_0x009b2f6c(uStack_1c,CONCAT22(extraout_var_11,0x5e),2);
          puStack_34 = puStack_7c;
          uStack_38 = 0xaddc72;
          func_0x0040c214(&uStack_70,3);
          uStack_38 = uStack_70;
          uStack_3c = 0xaddc87;
          func_0x009b3114(&uStack_1c,CONCAT22(extraout_var_12,0x5e),2);
          uStack_3c = 0xaddc95;
          (**(code **)(*param_2 + 0x20))(param_2,iVar3,uStack_1c);
        }
      }
      else {
        puStack_34 = (undefined4 *)0xaddbde;
        (**(code **)(*param_2 + 0x4c))(param_2,iVar3);
      }
      iVar3 = iVar3 + -1;
    } while (iVar3 != -1);
  }
  uStack_20 = (undefined4 **)0xaddcaa;
  iVar3 = (**(code **)(*param_2 + 0x14))();
  if (iVar3 == 0) {
    uStack_20 = (undefined4 **)0xaddcbb;
    (**(code **)(*param_2 + 0x3c))(param_2,&UNK_00adddc8);
  }
  uStack_20 = (undefined4 **)0xaddcc6;
  func_0x009b3eb4(param_2,param_1);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00addcf7;
  puStack_18 = (undefined *)0xaddce0;
  func_0x0040b034(&puStack_7c,0x13,pcVar1);
  puStack_18 = (undefined *)0xaddced;
  func_0x0040b034(&uStack_1c,3);
                    /* WARNING: Could not recover jumptable at 0x00addcee. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

