/* Static Ghidra output. Delphi register ABI and types require review. */

void fLabs_TfrmLabs_Memo1Enter(int param_1)

{
  code *pcVar1;
  undefined4 uVar2;
  char cVar3;
  int *piVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_18;
  undefined *puStack_14;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  puStack_14 = &UNK_00ebdae8;
  uStack_18 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_18;
  cVar3 = func_0x009d619c();
  if (cVar3 != '\0') {
    func_0x006026ac(*(undefined4 *)(param_1 + 0x4ec),&uStack_8);
    uVar2 = uStack_8;
    piVar4 = (int *)func_0x009d6144();
    (**(code **)(*piVar4 + 0x10))(piVar4,uVar2);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_18;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00ebdaef;
  puStack_14 = (undefined *)0xebdae5;
  func_0x0040afd4(&uStack_8,uStack_18,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00ebdae6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

