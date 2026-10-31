/* Static Ghidra output. Delphi register ABI and types require review. */

void mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_lvDataMouseDown
               (int param_1,undefined4 param_2,undefined1 param_3,undefined4 param_4,
               undefined4 param_5)

{
  undefined4 uVar1;
  
  if (*(char *)(param_1 + 0x364) != '\0') {
    uVar1 = func_0x00682c14(*(undefined4 *)(param_1 + 0x34c),param_5,param_4);
    mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_DisplayItemDetail
              (param_1,param_2,uVar1,param_3);
  }
  return;
}

