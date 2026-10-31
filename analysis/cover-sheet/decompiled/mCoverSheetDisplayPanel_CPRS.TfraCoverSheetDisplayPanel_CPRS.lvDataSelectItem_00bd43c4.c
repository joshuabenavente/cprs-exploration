/* Static Ghidra output. Delphi register ABI and types require review. */

void mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_lvDataSelectItem
               (int param_1,undefined4 param_2,undefined4 param_3,char param_4)

{
  undefined4 uVar1;
  
  if (param_4 != '\0') {
    uVar1 = func_0x0067cb00(param_3);
    *(undefined4 *)(param_1 + 0x360) = uVar1;
  }
  return;
}

