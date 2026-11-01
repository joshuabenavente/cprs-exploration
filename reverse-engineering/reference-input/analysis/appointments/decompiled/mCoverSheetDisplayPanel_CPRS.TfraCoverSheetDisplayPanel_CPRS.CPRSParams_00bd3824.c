/* Static Ghidra output. Delphi register ABI and types require review. */

void mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_CPRSParams
               (int *param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined *puStack_18;
  undefined1 *puStack_14;
  undefined4 uStack_8;
  
  puStack_14 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = (undefined4 *)0x0;
  puStack_18 = &UNK_00bd3877;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  uVar2 = func_0x00410738(param_2);
  (**(code **)(*param_1 + 0x1ec))(param_1,&uStack_8,*param_1,&UNK_00bd3884);
  puVar1 = uStack_8;
  (**(code **)*uStack_8)();
  *in_FS_OFFSET = puVar1;
  func_0x00410738(&uStack_8,puVar1,uVar2);
                    /* WARNING: Could not recover jumptable at 0x00bd3875. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)&UNK_00bd387e)(&UNK_00bd387e);
  return;
}

