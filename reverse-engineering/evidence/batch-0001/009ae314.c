/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void ORNet_CallBrokerInContext(int *param_1)

{
  code *pcVar1;
  int iVar2;
  undefined4 unaff_ESI;
  undefined4 *in_FS_OFFSET;
  undefined1 auStack_b4 [20];
  undefined1 auStack_a0 [32];
  undefined4 auStack_80 [11];
  char cStack_51;
  int *piStack_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined *puStack_44;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_3c;
  undefined *puStack_38;
  undefined1 *puStack_34;
  undefined4 uStack_30;
  undefined *puStack_2c;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_24;
  undefined *puStack_20;
  short sStack_1c;
  undefined1 uStack_1a;
  char cStack_19;
  
  iVar2 = 0x16;
  do {
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  puStack_20 = &UNK_009aebea;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  cStack_19 = (char)((uint)(auStack_80 + 0x1f) >> 0x18);
  _sStack_1c = CONCAT12(1,(short)auStack_80 + 0x7c);
  UNRECOVERED_JUMPTABLE_00 = (code *)0x9ae343;
  func_0x009acd20();
  puStack_2c = &UNK_009aeba6;
  uStack_30 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_30;
  if (param_1 == (int *)0x0) {
    piStack_50 = (int *)_DAT_01258fcc[0x18];
  }
  else {
    piStack_50 = param_1;
  }
  puStack_34 = (undefined1 *)0x9ae372;
  UNRECOVERED_JUMPTABLE_00 = (code *)(auStack_80 + 0x1f);
  (**(code **)(*piStack_50 + 0x48))();
  if (*_DAT_0124fb44 == '\0') {
    uStack_24 = 1;
    if (cStack_19 == '\0') {
      cStack_51 = '\0';
    }
    else {
      cStack_51 = (char)_DAT_01258fcc[0x13];
      if (cStack_51 != '\0') {
        puStack_34 = (undefined1 *)0x9ae422;
        (**(code **)(*_DAT_01258fcc + 0x44))(_DAT_01258fcc,0);
      }
    }
    puStack_38 = &UNK_009aeb8a;
    puStack_3c = (undefined *)*in_FS_OFFSET;
    *in_FS_OFFSET = &puStack_3c;
    UNRECOVERED_JUMPTABLE_00 = (code *)0x1;
    UNRECOVERED_JUMPTABLE = (code *)0x9ae454;
    puStack_34 = (undefined1 *)(auStack_80 + 0x1f);
    func_0x0040c18c(0x1258fd0,_DAT_01258fcc[0x1a],&UNK_009aec64);
    if (DAT_01258fe4 != '\0') {
      UNRECOVERED_JUMPTABLE = (code *)0x9ae46a;
      func_0x009b60ec(_DAT_01258fcc[0x1a]);
    }
    if (*(char *)((int)_DAT_01258fcc + 0x4e) != '\0') {
      UNRECOVERED_JUMPTABLE = (code *)0x9ae49a;
      func_0x009b00e8(_DAT_01258fdc);
      puStack_44 = &UNK_009ae4e2;
      uStack_48 = *in_FS_OFFSET;
      *in_FS_OFFSET = &uStack_48;
      UNRECOVERED_JUMPTABLE = (code *)(auStack_80 + 0x1f);
      while( true ) {
        uStack_4c = 0x9ae4c0;
        iVar2 = func_0x009b0020(_DAT_01258fdc);
        pcVar1 = UNRECOVERED_JUMPTABLE;
        if (iVar2 < _DAT_01258fe0) break;
        uStack_4c = 0x9ae4b6;
        func_0x009aff74(_DAT_01258fdc,0);
      }
      *in_FS_OFFSET = uStack_48;
      UNRECOVERED_JUMPTABLE = (code *)&UNK_009ae4e9;
      puStack_44 = (undefined *)0x9ae4df;
      func_0x009b00f4(_DAT_01258fdc,uStack_48,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x009ae4e0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
      return;
    }
    UNRECOVERED_JUMPTABLE = (code *)0x9ae481;
    (**(code **)(*_DAT_01258fcc + 0x48))(_DAT_01258fcc,1);
    UNRECOVERED_JUMPTABLE = (code *)0x9ae486;
    func_0x0040a734();
    UNRECOVERED_JUMPTABLE = (code *)0x9ae48b;
    func_0x0040a734();
  }
  else {
    puStack_34 = (undefined1 *)0x9ae391;
    iVar2 = func_0x009b0784(_DAT_01258fcc[0x1a],_DAT_01258fcc[0x17]);
    if (iVar2 == 0) {
      puStack_34 = &UNK_009aec08;
      puStack_38 = (undefined *)_DAT_01258fcc[0x1a];
      puStack_3c = &UNK_009aec28;
      UNRECOVERED_JUMPTABLE = (code *)0x9ae3bb;
      func_0x009b0450(_DAT_01258fcc[0x17],1,auStack_80);
      UNRECOVERED_JUMPTABLE = (code *)auStack_80[0];
      puStack_44 = (undefined *)0x9ae3cb;
      func_0x0040c214(auStack_80 + 0x1b,4);
      puStack_44 = (undefined *)0x9ae3da;
      func_0x00435fa0(ORUnitTesting__EUnitTestException.self_vmt_va,1,unaff_ESI);
      puStack_44 = (undefined *)0x9ae3df;
      func_0x0040a640();
    }
    puStack_34 = (undefined1 *)0x9ae3ea;
    (**(code **)(*piStack_50 + 8))(piStack_50,*(undefined4 *)(iVar2 + 0x10));
    *(int *)(iVar2 + 8) = *(int *)(iVar2 + 8) + 1;
    puStack_34 = (undefined1 *)0x9ae3f2;
    func_0x0040a734();
  }
  pcVar1 = UNRECOVERED_JUMPTABLE_00;
  *in_FS_OFFSET = uStack_30;
  UNRECOVERED_JUMPTABLE_00 = (code *)&UNK_009aebf1;
  puStack_2c = (undefined *)0x9aebca;
  func_0x0040b034(auStack_b4,3,pcVar1);
  puStack_2c = (undefined *)0x9aebda;
  func_0x0040b034(auStack_a0,9);
  puStack_2c = (undefined *)0x9aebe7;
  func_0x0040b034(auStack_80 + 0x1b,4);
                    /* WARNING: Could not recover jumptable at 0x009aebe8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

