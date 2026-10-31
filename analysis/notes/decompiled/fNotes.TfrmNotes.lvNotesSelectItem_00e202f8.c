/* Static Ghidra output. Delphi register ABI and types require review. */

void fNotes_TfrmNotes_lvNotesSelectItem(int param_1,undefined4 param_2,int param_3,char param_4)

{
  int *piVar1;
  code *pcVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 extraout_EDX;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar5;
  undefined4 uStack_28;
  undefined *puStack_24;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  uStack_c = 0;
  uStack_10 = 0;
  puStack_24 = &UNK_00e20435;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  pcVar2 = (code *)((int)register0x00000010 + -4);
  if ((DAT_0125a165 != '\0') || (pcVar2 = (code *)((int)register0x00000010 + -4), param_4 == '\0'))
  goto LAB_00e20418;
  func_0x00e216c0(param_1,0,0);
  DAT_0125a165 = 1;
  if (param_3 == 0) {
LAB_00e2036e:
    piVar1 = *(int **)(*(int *)(param_1 + 0x74c) + 0x330);
    (**(code **)(*piVar1 + 0x30))(piVar1,&UNK_00e20474);
    func_0x009fffc4(*(undefined4 *)(param_1 + 0x4c8),0);
    (**(code **)(**(int **)(param_1 + 0x778) + 400))();
  }
  else {
    iVar3 = (**(code **)(**(int **)(param_3 + 8) + 0x14))();
    if (iVar3 < 6) goto LAB_00e2036e;
    (**(code **)(**(int **)(param_3 + 8) + 0xc))(*(int **)(param_3 + 8),0,&uStack_8);
    iVar3 = func_0x00437d28(&UNK_00e20454,uStack_8);
    if (0 < iVar3) goto LAB_00e2036e;
    func_0x009b60ec(&UNK_00e204fc);
    (**(code **)(**(int **)(param_3 + 8) + 0xc))(*(int **)(param_3 + 8),5,&uStack_c);
    func_0x007ae0d4(*(undefined4 *)(param_1 + 0x4dc),uStack_c);
    uVar4 = func_0x007adbdc(*(undefined4 *)(param_1 + 0x4dc));
    uVar5 = extraout_EDX;
    func_0x0042cff8(&uStack_10);
    func_0x00e216c0(param_1,uStack_10,*(undefined4 *)(param_1 + 0x4d8),uVar4,uVar5);
    fNotes_TfrmNotes_lstNotesClick(param_1,param_1);
    func_0x0060ca58(*(undefined4 *)(param_1 + 0x74c));
    func_0x0041c028();
  }
  DAT_0125a165 = '\0';
  pcVar2 = UNRECOVERED_JUMPTABLE;
LAB_00e20418:
  UNRECOVERED_JUMPTABLE = pcVar2;
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e2043c;
  puStack_24 = (undefined *)0xe20432;
  func_0x0040b034(&uStack_10,3,pcVar2);
                    /* WARNING: Could not recover jumptable at 0x00e20433. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

