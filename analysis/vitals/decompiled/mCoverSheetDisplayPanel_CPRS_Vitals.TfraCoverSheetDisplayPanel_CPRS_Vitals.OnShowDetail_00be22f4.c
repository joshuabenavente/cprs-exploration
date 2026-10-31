/* Static Ghidra output. Delphi register ABI and types require review. */

void mCoverSheetDisplayPanel_CPRS_Vitals_TfraCoverSheetDisplayPanel_CPRS_Vitals_OnShowDetail
               (int *param_1)

{
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_14;
  undefined *puStack_10;
  undefined4 uStack_c;
  
  uStack_c = (undefined1 *)((int)register0x00000010 + -4);
  puStack_10 = &UNK_00be2328;
  uStack_14 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_14;
  (**(code **)(*param_1 + 0x238))(param_1,param_1[0xd3]);
  *in_FS_OFFSET = uStack_14;
  return;
}

