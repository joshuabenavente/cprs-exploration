/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_OnAddItems
               (int param_1,int *param_2)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_3c;
  undefined *puStack_38;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_30;
  undefined *puStack_2c;
  undefined1 *puStack_28;
  undefined4 uStack_18;
  undefined1 uStack_11;
  int *piStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  puStack_28 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_18 = 0;
  uStack_8 = 0;
  puStack_2c = &UNK_00bd3a36;
  uStack_30 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_30;
  UNRECOVERED_JUMPTABLE = (code *)0xbd3947;
  iStack_c = param_1;
  iVar2 = (**(code **)(*param_2 + 0x14))();
  if (iVar2 == 0) {
    UNRECOVERED_JUMPTABLE = (code *)0xbd3957;
    (**(code **)(*param_2 + 0x3c))(param_2,&UNK_00bd3a50);
  }
  piStack_10 = (int *)0x0;
  UNRECOVERED_JUMPTABLE = (code *)0xbd396a;
  piStack_10 = (int *)func_0x004d5460(_System_Classes__TStringsEnumerator,1,param_2);
  puStack_38 = &UNK_00bd3a0f;
  uStack_3c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_3c;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  while( true ) {
    piVar1 = piStack_10;
    iVar2 = (**(code **)(*(int *)piStack_10[2] + 0x14))();
    uStack_11 = piVar1[1] < iVar2 + -1;
    if (!(bool)uStack_11) break;
    piVar1 = piVar1 + 1;
    *piVar1 = *piVar1 + 1;
    func_0x004d54a4(piStack_10,&uStack_8);
    uVar3 = func_0x0067cde0(*(undefined4 *)(*(int *)(iStack_c + 0x34c) + 0x2f4));
    uVar4 = func_0x00bcf770(_oDelimitedString__TDelimitedString,1,uStack_8,0x5e);
    func_0x00bcf93c(uVar4,2,&uStack_18);
    func_0x0067c4d8(uVar3,uStack_18);
    func_0x0067c5e0(uVar3,uVar4);
  }
  *in_FS_OFFSET = uStack_3c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bd3a16;
  if (piStack_10 != (int *)0x0) {
    puStack_38 = (undefined *)0xbd3a0c;
    (**(code **)(*piStack_10 + -4))(piStack_10,1);
  }
                    /* WARNING: Could not recover jumptable at 0x00bd3a0d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

