/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_LoadOrdersAbbr
               (undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  code *pcVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined2 extraout_var_04;
  undefined2 extraout_var_05;
  uint *in_FS_OFFSET;
  undefined1 uVar5;
  float10 in_ST0;
  float10 fVar6;
  float10 in_ST1;
  float10 in_ST2;
  float10 in_ST3;
  float10 in_ST4;
  float10 in_ST5;
  float10 in_ST6;
  float10 fVar7;
  float10 fVar8;
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
  float10 fStack_88;
  float10 fStack_7c;
  undefined4 uStack_70;
  undefined1 uStack_6c;
  undefined *puStack_68;
  undefined4 uStack_64;
  undefined4 *puStack_60;
  undefined4 *puStack_5c;
  float10 *pfStack_58;
  undefined4 *puStack_54;
  float10 *pfStack_50;
  uint uStack_4c;
  undefined *puStack_48;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_40;
  int *piStack_3c;
  uint uStack_38;
  undefined *puStack_34;
  undefined1 *puStack_30;
  undefined4 uStack_2c;
  undefined *puStack_28;
  int *piStack_24;
  undefined4 uStack_20;
  undefined *puStack_1c;
  undefined1 *puStack_18;
  int iVar9;
  
  iVar4 = 0x18;
  do {
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  LOCK();
  UNLOCK();
  puStack_18 = (undefined1 *)0x11dcce5;
  func_0x0040b0c8(param_4);
  puStack_1c = &UNK_011dd186;
  uStack_20 = *in_FS_OFFSET;
  *in_FS_OFFSET = (uint)&uStack_20;
  uStack_20 = uStack_20 & 0xffffff;
  puStack_18 = (undefined1 *)((int)register0x00000010 + -4);
  if (_DAT_0125aacc == 0) {
    piStack_24 = (int *)0x11dcd05;
    puStack_18 = (undefined1 *)((int)register0x00000010 + -4);
    func_0x011dad28();
  }
  piStack_24 = (int *)0x11dcd13;
  func_0x0042cfdc(uRam0000000c,&piStack_3c);
  piStack_24 = piStack_3c;
  puStack_28 = &UNK_011dd1a0;
  uStack_2c = 0x11dcd29;
  func_0x0042cfdc(uRam00000058,&uStack_40);
  uStack_2c = uStack_40;
  puStack_30 = (undefined1 *)0x11dcd39;
  func_0x0040c214(&puStack_1c,3);
  puStack_30 = (undefined1 *)0x11dcd45;
  piStack_3c = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_34 = &UNK_011dd142;
  uStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = (uint)&uStack_38;
  uStack_40 = 0;
  uStack_70 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  uStack_6c = 0x11;
  puStack_68 = puStack_1c;
  uStack_64 = CONCAT31(uStack_64._1_3_,0x11);
  puStack_60 = puRam00000008;
  puStack_5c = (undefined4 *)((uint)puStack_5c & 0xffffff00);
  fStack_7c = (float10)dRam00000018;
  pfStack_58 = &fStack_7c;
  puStack_54 = (undefined4 *)CONCAT31(puStack_54._1_3_,3);
  fStack_88 = (float10)dRam00000020;
  pfStack_50 = &fStack_88;
  uStack_4c = CONCAT31(uStack_4c._1_3_,3);
  puStack_48 = (undefined *)param_4;
  UNRECOVERED_JUMPTABLE = (code *)0x11dcdce;
  fVar7 = in_ST6;
  puStack_30 = (undefined1 *)((int)register0x00000010 + -4);
  piStack_24 = piStack_3c;
  ORNet_CallVistA(&UNK_011dd1b0,&uStack_70,5);
  puStack_28 = (undefined *)0x0;
  uStack_2c = 0;
  puStack_48 = &UNK_011dd123;
  uStack_4c = *in_FS_OFFSET;
  *in_FS_OFFSET = (uint)&uStack_4c;
  pfStack_50 = (float10 *)0x11dcdf2;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  puStack_28 = (undefined *)func_0x0040908c(_System_Classes__TList,1);
  pfStack_50 = (float10 *)0x11dce01;
  uStack_2c = func_0x0040908c(_System_Classes__TList,1);
  pfStack_50 = (float10 *)0x11dce0c;
  iVar4 = (**(code **)(*piStack_24 + 0x14))();
  if (0 < iVar4) {
    uVar5 = 1;
    pfStack_50 = (float10 *)0x11dce1f;
    (**(code **)(*piStack_24 + 0xc))(piStack_24,0,&uStack_8c);
    pfStack_50 = (float10 *)0x11dce2f;
    func_0x0040c324(uStack_8c,&UNK_011dd1d4);
    if (!(bool)uVar5) {
      pfStack_50 = (float10 *)&uStack_90;
      puStack_54 = (undefined4 *)0x11dceac;
      (**(code **)(*piStack_24 + 0xc))(piStack_24,0,&uStack_94);
      puStack_54 = (undefined4 *)0x11dcec0;
      func_0x0079acec(uStack_94,CONCAT22(extraout_var,0x5e),2);
      puStack_54 = (undefined4 *)0x11dcecd;
      uRam00000030 = func_0x0042d238(uStack_90,0);
      puStack_54 = &uStack_98;
      pfStack_58 = (float10 *)0x11dceea;
      (**(code **)(*piStack_24 + 0xc))(piStack_24,0,&uStack_9c);
      pfStack_58 = (float10 *)0x11dcefe;
      func_0x0079acec(uStack_9c,CONCAT22(extraout_var_00,0x5e),3);
      pfStack_58 = (float10 *)0x11dcf09;
      func_0x009b18cc(uStack_98);
      dRam00000028 = (double)in_ST0;
      pfStack_58 = (float10 *)0x11dcf18;
      fVar8 = fVar7;
      iVar4 = (**(code **)(*piStack_24 + 0x14))();
      if (0 < iVar4 + -1) {
        iVar9 = 1;
        puStack_30 = (undefined1 *)(iVar4 + -1);
        do {
          pfStack_50 = (float10 *)0x11dcf3c;
          (**(code **)(*piStack_24 + 0xc))(piStack_24,iVar9,&uStack_a0);
          pfStack_50 = (float10 *)0x11dcf4c;
          iVar4 = func_0x0042c528(&UNK_011dd214,uStack_a0);
          if (iVar4 == 0) {
            uStack_20 = CONCAT13(1,(undefined3)uStack_20);
            fVar6 = in_ST1;
          }
          else {
            pfStack_50 = (float10 *)0x11dcf65;
            puStack_18 = (undefined1 *)func_0x0040908c(_rOrders__TOrder,1);
            pfStack_50 = (float10 *)&uStack_a4;
            puStack_54 = (undefined4 *)0x11dcf80;
            (**(code **)(*piStack_24 + 0xc))(piStack_24,iVar9,&uStack_a8);
            puStack_54 = (undefined4 *)0x11dcf94;
            func_0x0079acec(uStack_a8,CONCAT22(extraout_var_01,0x5e),1);
            puStack_54 = (undefined4 *)0x11dcfa5;
            func_0x0040b3c4(puStack_18 + 0xc,uStack_a4);
            puStack_54 = &uStack_ac;
            pfStack_58 = (float10 *)0x11dcfbd;
            (**(code **)(*piStack_24 + 0xc))(piStack_24,iVar9,&uStack_b0);
            pfStack_58 = (float10 *)0x11dcfd1;
            func_0x0079acec(uStack_b0,CONCAT22(extraout_var_02,0x5e),2);
            pfStack_58 = (float10 *)0x11dcfde;
            uVar3 = func_0x0042d238(uStack_ac,0);
            *(undefined4 *)(puStack_18 + 0x10) = uVar3;
            pfStack_58 = (float10 *)&uStack_b4;
            puStack_5c = (undefined4 *)0x11dcffc;
            (**(code **)(*piStack_24 + 0xc))(piStack_24,iVar9,&uStack_b8);
            puStack_5c = (undefined4 *)0x11dd010;
            func_0x0079acec(uStack_b8,CONCAT22(extraout_var_03,0x5e),3);
            puStack_5c = (undefined4 *)0x11dd01b;
            fVar6 = in_ST2;
            in_ST2 = in_ST3;
            in_ST3 = in_ST4;
            in_ST4 = in_ST5;
            in_ST5 = in_ST6;
            in_ST6 = fVar7;
            fVar7 = fVar8;
            func_0x009b18cc(uStack_b4);
            *(double *)(puStack_18 + 0x18) = (double)in_ST1;
            puStack_5c = &uStack_bc;
            puStack_60 = (undefined4 *)0x11dd03a;
            fVar8 = fVar7;
            (**(code **)(*piStack_24 + 0xc))(piStack_24,iVar9,&uStack_c0);
            puStack_60 = (undefined4 *)0x11dd04e;
            func_0x0079acec(uStack_c0,CONCAT22(extraout_var_04,0x5e),4);
            puStack_60 = (undefined4 *)0x11dd05f;
            func_0x0040b3c4(puStack_18 + 0x74,uStack_bc);
            puStack_60 = &uStack_c4;
            uStack_64 = 0x11dd077;
            (**(code **)(*piStack_24 + 0xc))(piStack_24,iVar9,&uStack_c8);
            uStack_64 = 0x11dd08b;
            func_0x0079acec(uStack_c8,CONCAT22(extraout_var_05,0x5e),5);
            uStack_64 = 0x11dd09c;
            func_0x0040b3c4(puStack_18 + 0x78,uStack_c4);
            uStack_64 = 0x11dd0a7;
            uVar3 = func_0x011db550(*(undefined4 *)(puStack_18 + 0x10));
            *(undefined4 *)(puStack_18 + 0x60) = uVar3;
            if (uStack_20._3_1_ == '\0') {
              uStack_64 = 0x11dd0cb;
              func_0x004d2e10(uStack_2c,puStack_18);
            }
            else {
              uStack_64 = 0x11dd0be;
              func_0x004d2e10(puStack_28,puStack_18);
            }
          }
          iVar9 = iVar9 + 1;
          puStack_30 = puStack_30 + -1;
          in_ST1 = fVar6;
        } while (puStack_30 != (undefined1 *)0x0);
      }
      goto LAB_011dd0d7;
    }
  }
  pfStack_50 = (float10 *)0x11dce3d;
  puStack_18 = (undefined1 *)func_0x0040908c(_rOrders__TOrder,1);
  pfStack_50 = (float10 *)0x11dce50;
  func_0x0040b3c4(puStack_18 + 0xc,&UNK_011dd1d4);
  *(undefined4 *)(puStack_18 + 0x10) = 0;
  pfStack_50 = (float10 *)0x11dce5d;
  func_0x011ca6ac();
  *(double *)(puStack_18 + 0x18) = (double)in_ST0;
  *(undefined4 *)(puStack_18 + 0x28) = 0x61;
  pfStack_50 = (float10 *)0x11dce7e;
  func_0x0040b3c4(puStack_18 + 0x5c,&UNK_011dd1e4);
  puStack_18[0x69] = 1;
  pfStack_50 = (float10 *)0x11dce90;
  func_0x004d2e10(puStack_28,puStack_18);
LAB_011dd0d7:
  pfStack_50 = (float10 *)0x11dd0e2;
  func_0x011dc258(puStack_28,param_1);
  pfStack_50 = (float10 *)0x11dd0ed;
  func_0x011dc258(uStack_2c,param_2);
  uVar3 = uStack_2c;
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_4c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011dd12a;
  puStack_34 = (undefined *)uStack_2c;
  uStack_2c = 0;
  puStack_48 = (undefined *)0x11dd10d;
  func_0x004090bc(uVar3,uStack_4c,pcVar1);
  puVar2 = puStack_28;
  uStack_38 = (uint)puStack_28;
  puStack_28 = (undefined *)0x0;
  puStack_48 = (undefined *)0x11dd120;
  func_0x004090bc(puVar2);
                    /* WARNING: Could not recover jumptable at 0x011dd121. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

