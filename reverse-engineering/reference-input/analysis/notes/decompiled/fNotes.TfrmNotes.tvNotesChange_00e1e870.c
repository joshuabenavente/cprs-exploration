/* Static Ghidra output. Delphi register ABI and types require review. */

void fNotes_TfrmNotes_tvNotesChange(int param_1,undefined4 param_2,int param_3)

{
  int *piVar1;
  bool bVar2;
  code *pcVar3;
  char cVar4;
  int iVar5;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  puStack_18 = &UNK_00e1e9d4;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  pcVar3 = (code *)((int)register0x00000010 + -4);
  if (param_1 != 0) {
    func_0x00e216c0(param_1,0,0);
    if (param_3 != 0) {
      cVar4 = func_0x00a13b8c(*(undefined4 *)(param_3 + 8));
      if (cVar4 == '\0') {
        func_0x00e23d48(param_1);
      }
    }
    iVar5 = func_0x0067213c(*(undefined4 *)(param_1 + 0x4cc));
    if (iVar5 != 0) {
      iVar5 = func_0x0067213c(*(undefined4 *)(param_1 + 0x4cc));
      cVar4 = func_0x00a13b8c(*(undefined4 *)(iVar5 + 8));
      if (cVar4 == '\0') {
        fNotes_TfrmNotes_DoSelect(param_1);
        func_0x0060ca58(*(undefined4 *)(param_1 + 0x4cc));
        func_0x0041c028();
        pcVar3 = UNRECOVERED_JUMPTABLE;
        goto LAB_00e1e9bc;
      }
    }
    func_0x00e238f8(param_1,0);
    func_0x009fffc4(*(undefined4 *)(param_1 + 0x4c8),0);
    iVar5 = func_0x0067213c(*(undefined4 *)(param_1 + 0x4cc));
    if (iVar5 == 0) {
      bVar2 = false;
    }
    else {
      iVar5 = func_0x0067213c(*(undefined4 *)(param_1 + 0x4cc));
      iVar5 = func_0x0040c4b0(&UNK_00e1e9ec,*(undefined4 *)(iVar5 + 8),1);
      bVar2 = 0 < iVar5;
    }
    if (bVar2) {
      if (*(char *)(param_1 + 0x814) == '\0') {
        func_0x0040b40c(&uStack_8,&UNK_00e1ea70);
      }
      else {
        func_0x0040b40c(&uStack_8,&UNK_00e1ea58);
      }
      func_0x0040c214(&uStack_8,5);
    }
    else {
      func_0x0040b40c(&uStack_8,&UNK_00e1ebd8);
    }
    piVar1 = *(int **)(*(int *)(param_1 + 0x74c) + 0x330);
    (**(code **)(*piVar1 + 0x30))(piVar1,uStack_8);
    pcVar3 = UNRECOVERED_JUMPTABLE;
  }
LAB_00e1e9bc:
  UNRECOVERED_JUMPTABLE = pcVar3;
  pcVar3 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e1e9db;
  puStack_18 = (undefined *)0xe1e9d1;
  func_0x0040afd4(&uStack_8,uStack_1c,pcVar3);
                    /* WARNING: Could not recover jumptable at 0x00e1e9d2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

