/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fPtSel_TfrmPtSel_cboPatientNeedData
               (int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,int param_5)

{
  code *pcVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  code *unaff_ESI;
  undefined4 unaff_EDI;
  int *in_FS_OFFSET;
  bool bVar6;
  undefined1 uVar7;
  undefined4 **ppuVar8;
  int iStack_38;
  undefined *puStack_34;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 *puStack_2c;
  int iStack_28;
  undefined *puStack_24;
  undefined4 uStack_20;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_20 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = 5;
  do {
    uStack_c = 0;
    uStack_8 = uStack_8 + -1;
  } while (uStack_8 != 0);
  LOCK();
  UNLOCK();
  puStack_24 = &UNK_00e82bf2;
  iStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_28;
  puStack_2c = (undefined4 *)0xe829b8;
  func_0x0040b40c(&uStack_8,0);
  puStack_2c = (undefined4 *)0xe829c5;
  iVar2 = func_0x004093c8(param_2,_ORCtrls__TORComboBox);
  puStack_2c = (undefined4 *)0xe829d2;
  iVar3 = (**(code **)(**(int **)(iVar2 + 0x2c8) + 0x14))();
  puStack_2c = (undefined4 *)0xe829db;
  iVar4 = func_0x007b3c1c(iVar2);
  if (iVar4 < iVar3) {
    puStack_2c = (undefined4 *)((int)register0x00000010 + -0x18);
    UNRECOVERED_JUMPTABLE = (code *)0xe829ee;
    iVar3 = (**(code **)(**(int **)(iVar2 + 0x2c8) + 0x14))();
    UNRECOVERED_JUMPTABLE = (code *)0xe829ff;
    (**(code **)(**(int **)(iVar2 + 0x2c8) + 0xc))
              (*(int **)(iVar2 + 0x2c8),iVar3 + -1,(int)register0x00000010 + -0x1c);
    UNRECOVERED_JUMPTABLE = (code *)0xe82a10;
    func_0x0079acec(unaff_EDI,CONCAT22(extraout_var,0x5e),1);
    puStack_34 = &UNK_00e82c10;
    UNRECOVERED_JUMPTABLE = unaff_ESI;
    func_0x0040c214(&uStack_8,3);
    if (param_5 < 0) {
      iVar2 = 0;
      if (uStack_8 != 0) {
        iVar2 = *(int *)(uStack_8 + -4);
      }
      puStack_2c = &uStack_8;
      UNRECOVERED_JUMPTABLE = (code *)0xe82a4a;
      func_0x0040c35c(uStack_8,1,iVar2 + -1);
    }
  }
  iVar2 = uStack_8;
  puStack_2c = (undefined4 *)0xe82a60;
  iVar3 = func_0x0040c4b0(&UNK_00e82c20,uStack_8,1);
  if (0 < iVar3) {
    puStack_2c = (undefined4 *)0xe82a72;
    iVar2 = func_0x0040c4b0(&UNK_00e82c20,iVar2,1);
    puStack_2c = &uStack_8;
    UNRECOVERED_JUMPTABLE = (code *)0xe82a88;
    func_0x0040c35c(uStack_8,1,iVar2 + -1);
  }
  puStack_2c = (undefined4 *)0xe82a94;
  piVar5 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  bVar6 = true;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e82bc1;
  puStack_34 = (undefined *)*in_FS_OFFSET;
  *in_FS_OFFSET = (int)&puStack_34;
  puStack_2c = (undefined4 *)((int)register0x00000010 + -4);
  func_0x0040c324(_DAT_0125a268,&UNK_00e82c40);
  if (bVar6) {
    iStack_38 = param_5;
    rCore_setRPLPtList(piVar5,_DAT_0125a26c,uStack_8);
  }
  else {
    rCore_setSubSetOfPatients(piVar5,uStack_8,param_5);
    iStack_38 = 0xe82ae2;
    iVar2 = (**(code **)(*piVar5 + 0x14))();
    if (-1 < iVar2 + -1) {
      iVar3 = 0;
      uVar7 = true;
      do {
        (**(code **)(*piVar5 + 0xc))(piVar5,iVar3,&uStack_c);
        func_0x0079acec(uStack_c,CONCAT22(extraout_var_00,0x5e),2,&puStack_24);
        func_0x0042c1a8(puStack_24,&uStack_20);
        ppuVar8 = &puStack_2c;
        func_0x0079acec(uStack_c,CONCAT22(extraout_var_01,0x5e),6,ppuVar8,uStack_20);
        func_0x0042c1a8(puStack_2c,&iStack_28);
        func_0x0040c324(ppuVar8,iStack_28);
        if (!(bool)uVar7) {
          func_0x0079acec(uStack_c,CONCAT22(extraout_var_02,0x5e),2,&UNRECOVERED_JUMPTABLE);
          func_0x0040c134(&UNRECOVERED_JUMPTABLE,&UNK_00e82c20);
          func_0x0079af38(&uStack_c,CONCAT22(extraout_var_03,0x5e),2,UNRECOVERED_JUMPTABLE);
          (**(code **)(*piVar5 + 0x20))(piVar5,iVar3,uStack_c);
        }
        iVar3 = iVar3 + 1;
        iVar2 = iVar2 + -1;
        uVar7 = iVar2 == 0;
      } while (!(bool)uVar7);
    }
  }
  func_0x007b3684(*(undefined4 *)(param_1 + 0x480),piVar5);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = iStack_38;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e82bc8;
  puStack_34 = (undefined *)0xe82bbe;
  func_0x004090bc(piVar5,iStack_38,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00e82bbf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

