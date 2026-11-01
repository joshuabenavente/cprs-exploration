/* Static Ghidra output. Delphi register ABI and types require review. */

void mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_OnShowDetail
               (int *param_1,undefined4 param_2,int param_3,undefined1 param_4)

{
  code *pcVar1;
  int *piVar2;
  undefined4 *in_FS_OFFSET;
  undefined *puVar3;
  undefined4 uVar4;
  undefined4 uStack_24;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_1c;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_c = 0;
  uStack_10 = 0;
  puStack_1c = (undefined1 *)0xbd4922;
  uStack_8 = param_3;
  func_0x0040b0c8(param_3);
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bd499b;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  if (uStack_8 == 0) {
    puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
    (**(code **)(*param_1 + 0x198))(param_1,&uStack_c);
    puVar3 = &UNK_00bd49b8;
    uVar4 = uStack_c;
    piVar2 = (int *)func_0x00682964(param_1[0xd3]);
    (**(code **)(*piVar2 + 0x18))(piVar2,&uStack_10,*piVar2,puVar3,uVar4);
    func_0x0040c214(&uStack_8,3);
  }
  uVar4 = 1;
  func_0x01007fec(param_2,uStack_8,param_4);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar4;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bd49a2;
  uStack_24 = 0xbd4998;
  func_0x0040b034(&uStack_10,3,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00bd4999. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

