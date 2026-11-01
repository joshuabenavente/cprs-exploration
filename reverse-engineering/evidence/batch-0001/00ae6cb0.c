/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void uVitals_ViewPatientVitals
               (int param_1,undefined4 param_2,undefined4 param_3,undefined1 *param_4,
               undefined4 param_5)

{
  undefined1 *puVar1;
  undefined1 uVar2;
  undefined4 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined2 extraout_var;
  undefined4 unaff_ESI;
  char unaff_DI;
  undefined4 *in_FS_OFFSET;
  float10 in_ST0;
  float10 in_ST1;
  float10 in_ST2;
  int iVar4;
  undefined *puVar5;
  undefined *puVar6;
  undefined4 uStack_84;
  undefined *puStack_80;
  undefined1 *puStack_7c;
  undefined *puStack_78;
  int iStack_74;
  undefined *puStack_70;
  undefined4 uStack_6c;
  undefined *puStack_68;
  undefined4 uStack_64;
  undefined *puStack_60;
  undefined8 uStack_5c;
  undefined8 uStack_54;
  undefined8 uStack_4c;
  undefined8 uStack_44;
  undefined8 uStack_3c;
  undefined *puStack_34;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_2c;
  undefined *puStack_28;
  undefined1 *puStack_24;
  int iStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  iStack_14 = 0xf;
  do {
    uStack_c = 0;
    iStack_14 = iStack_14 + -1;
  } while (iStack_14 != 0);
  LOCK();
  UNLOCK();
  puStack_34 = (undefined *)0x0;
  puStack_24 = (undefined1 *)0xae6cda;
  UNRECOVERED_JUMPTABLE_00 = (code *)param_2;
  uStack_8 = iStack_14;
  func_0x0040b0c8(param_5);
  puStack_24 = (undefined1 *)0xae6ce8;
  func_0x0040c99c(&uStack_2c,_DAT_0118dbd4);
  puStack_28 = &UNK_00ae704c;
  uStack_2c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_2c;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xae6d03;
  puStack_24 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x0040b4b4(&uStack_8,&UNK_00ae7068);
  *param_4 = 0;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xae6d0e;
  func_0x00ae6bd4(&uStack_2c);
  puStack_34 = &UNK_00ae6fe5;
  uVar3 = *in_FS_OFFSET;
  uStack_3c = (double)CONCAT44(uVar3,(undefined4)uStack_3c);
  *in_FS_OFFSET = (int)&uStack_3c + 4;
  if (unaff_DI == '\0') {
    uStack_3c = (double)CONCAT44(uVar3,(int)register0x00000010 + -4);
    uStack_44 = (double)CONCAT44(&UNK_00ae6f41,*in_FS_OFFSET);
    *in_FS_OFFSET = &uStack_44;
    uStack_4c = (double)CONCAT44(0xae6d4d,(undefined4)uStack_4c);
    UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
    uVar3 = func_0x0040b920(uStack_8);
    uStack_4c = (double)CONCAT44(uVar3,_uVitals_VitalsDLLHandle);
    uStack_54 = (double)CONCAT44(0xae6d59,(undefined4)uStack_54);
    UNRECOVERED_JUMPTABLE = (code *)func_0x0041b080();
    if (UNRECOVERED_JUMPTABLE != (code *)0x0) {
      if (*(char *)(*_DAT_0124f2e0 + 0x35) == '\0') {
        uStack_54 = (double)CONCAT44(0xae6d9f,(undefined4)uStack_54);
        func_0x00431328();
        uStack_54 = (double)in_ST0;
        uStack_5c._4_4_ = (undefined *)0xae6db0;
        func_0x00431378(0xfffffffa);
        uStack_44 = (double)in_ST1;
        puStack_60 = (undefined *)0xae6dcd;
        uStack_5c = uStack_44;
        func_0x00432550(&UNK_00ae7090,_DAT_0124f788,&uStack_c);
      }
      else {
        uStack_54 = (double)CONCAT44(0xae6d75,(undefined4)uStack_54);
        in_ST2 = in_ST1;
        func_0x00431328();
        uStack_54 = (double)(in_ST0 - (float10)_DAT_00ae7080);
        uStack_5c._4_4_ = (undefined *)0xae6d98;
        uStack_3c = uStack_54;
        func_0x00432550(&UNK_00ae7090,_DAT_0124f788,&uStack_c);
      }
      uStack_5c._4_4_ = &UNK_00ae70b0;
      uStack_5c._0_4_ = 0xae6ddc;
      func_0x009a1744(param_1,(int)&uStack_54 + 4);
      uStack_5c._0_4_ = uStack_54._4_4_;
      puStack_60 = &UNK_00ae70e4;
      uStack_64 = *(undefined4 *)(param_1 + 0x70);
      puStack_68 = &UNK_00ae70e4;
      uStack_6c = 0xae6df7;
      func_0x0042cfdc(*(undefined4 *)(param_1 + 0x58),&uStack_54);
      uStack_6c = (undefined4)uStack_54;
      puStack_70 = &UNK_00ae70e4;
      iStack_74 = (int)&uStack_5c + 4;
      puStack_78 = (undefined *)0xae6e1a;
      func_0x0079acec(*(undefined4 *)(*(int *)(param_1 + 0x88) + 0x10),CONCAT22(extraout_var,0x5e),3
                     );
      puStack_78 = uStack_5c._4_4_;
      puStack_7c = (undefined1 *)0xae6e2a;
      func_0x0040c214(&uStack_10,8);
      iStack_14 = 0;
      puStack_80 = &UNK_00ae6f12;
      uStack_84 = *in_FS_OFFSET;
      *in_FS_OFFSET = &uStack_84;
      puStack_7c = (undefined1 *)((int)register0x00000010 + -4);
      func_0x0042cfdc(*(undefined4 *)(puStack_34 + 0x10),&iStack_14);
      func_0x00431328();
      uStack_4c = (double)in_ST2;
      func_0x011d4f18(puStack_34,&puStack_60);
      puVar6 = &UNK_00ae70e4;
      puVar5 = puStack_60;
      func_0x0040c214(&uStack_5c,3);
      iStack_74 = *(int *)(UNRECOVERED_JUMPTABLE_00 + 0x14);
      puStack_70 = (undefined *)CONCAT31(puStack_70._1_3_,0x11);
      uStack_6c = *(undefined4 *)(UNRECOVERED_JUMPTABLE_00 + 0x20);
      puStack_68 = (undefined *)((uint)puStack_68 & 0xffffff00);
      func_0x0042ef18(&UNK_00ae70f4,&iStack_74,1,&uStack_64,(undefined4)uStack_5c,param_5,puVar6,
                      puVar5);
      func_0x00432550(&UNK_00ae7090,_DAT_0124f788,&puStack_78,(undefined4)uStack_4c,uStack_4c._4_4_,
                      &UNK_00ae7114,*(undefined4 *)(UNRECOVERED_JUMPTABLE_00 + 0x10),uStack_64);
      iVar4 = iStack_14;
      uVar3 = uStack_c;
      puVar5 = puStack_78;
      func_0x0040c028(&puStack_7c,uStack_10);
      puVar1 = puStack_7c;
      uVar2 = (*UNRECOVERED_JUMPTABLE)();
      *param_4 = uVar2;
      *in_FS_OFFSET = puVar1;
      UNRECOVERED_JUMPTABLE = (code *)0xae6f34;
      func_0x0040afd4(&iStack_14,puVar1,iVar4,0xae6f34,uVar3,puVar5);
                    /* WARNING: Could not recover jumptable at 0x00ae6f10. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
      return;
    }
    uStack_54 = 2.12199579047121e-314;
    uStack_5c._4_4_ = (undefined *)0xffffffff;
    uStack_5c._0_4_ = 0;
    puStack_60 = (undefined *)0xae6f34;
    func_0x006aa580(&UNK_00ae7130,1,_DAT_00ae7120);
    *in_FS_OFFSET = (undefined4)uStack_44;
  }
  else if (unaff_DI == '\x01') {
    uStack_3c = (double)CONCAT44(uVar3,(uint)_DAT_00ae7120);
    uStack_44 = 2.12199579047121e-314;
    uStack_4c = -NAN;
    uStack_54 = (double)CONCAT44(0xae6fa9,(undefined4)uStack_54);
    UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
    func_0x006aa788(&UNK_00ae71dc,unaff_ESI,1);
  }
  else {
    UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
    if (unaff_DI == '\x02') {
      uStack_3c = (double)CONCAT44(uVar3,(uint)_DAT_00ae7120);
      uStack_44 = 2.12199579047121e-314;
      uStack_4c = -NAN;
      uStack_54 = (double)CONCAT44(0xae6fd0,(undefined4)uStack_54);
      UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
      func_0x006aa788(&UNK_00ae7218,unaff_ESI,1);
    }
  }
  UNRECOVERED_JUMPTABLE = UNRECOVERED_JUMPTABLE_00;
  *in_FS_OFFSET = uStack_3c._4_4_;
  UNRECOVERED_JUMPTABLE_00 = (code *)&UNK_00ae6fec;
  puStack_34 = (undefined *)0xae6fe2;
  func_0x00ae6c90(0,uStack_3c._4_4_,UNRECOVERED_JUMPTABLE);
                    /* WARNING: Could not recover jumptable at 0x00ae6fe3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

