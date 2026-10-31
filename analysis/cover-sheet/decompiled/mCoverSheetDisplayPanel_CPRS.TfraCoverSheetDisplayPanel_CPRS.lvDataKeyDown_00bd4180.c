/* Static Ghidra output. Delphi register ABI and types require review. */

void mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_lvDataKeyDown
               (int param_1,undefined4 param_2,short *param_3)

{
  undefined4 uVar1;
  
  if ((*param_3 == 0xd) || (*param_3 == 0x20)) {
    uVar1 = func_0x00682964(*(undefined4 *)(param_1 + 0x34c),param_2,param_3,0);
    mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_DisplayItemDetail
              (param_1,param_2,uVar1);
  }
  return;
}

