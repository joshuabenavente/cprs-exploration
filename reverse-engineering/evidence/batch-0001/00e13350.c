/* Unverified decompiler output; inspect assembly and ABI. */

void fNotes_TfrmNotes_acSaveNoSigExecute(int param_1)

{
  int iVar1;
  code *pcVar2;
  int *piVar3;
  undefined4 uVar4;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  int *in_FS_OFFSET;
  undefined4 *puStack_28;
  int iStack_24;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_1c;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  uStack_c = 0;
  uStack_10 = 0;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e1343d;
  iStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_24;
  if (*(int *)(param_1 + 0x7bc) < 0) {
    puStack_28 = (undefined4 *)0xe1341d;
    func_0x009b44a8(&UNK_00e1348c,&UNK_00e13458,0x30);
  }
  else {
    puStack_28 = &uStack_8;
    puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
    piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
    (**(code **)(*piVar3 + 0xc))(piVar3,*(undefined4 *)(param_1 + 0x7bc),&uStack_10);
    func_0x0079acec(uStack_10,CONCAT22(extraout_var_00,0x5e),1);
    func_0x0040b3c4(param_1 + 0x924,uStack_8);
    func_0x00e1946c(param_1,(int)&uStack_c + 3);
    if (((uStack_c._3_1_ != '\0') && (*(int *)(param_1 + 0x7bc) < 0)) &&
       (*(char *)(param_1 + 0x92a) == '\0')) {
      fNotes_TfrmNotes_LoadNotes(param_1,0);
      iVar1 = *(int *)(param_1 + 0x4cc);
      uVar4 = func_0x0066fb68(*(undefined4 *)(iVar1 + 0x330));
      uVar4 = func_0x007b5f00(iVar1,uStack_8,CONCAT22(extraout_var,0x5e),uVar4);
      func_0x00672184(iVar1,uVar4);
    }
  }
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = (int)puStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e13444;
  iStack_24 = 0xe13432;
  func_0x0040afd4(&uStack_10,puStack_28,pcVar2);
  iStack_24 = 0xe1343a;
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00e1343b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

