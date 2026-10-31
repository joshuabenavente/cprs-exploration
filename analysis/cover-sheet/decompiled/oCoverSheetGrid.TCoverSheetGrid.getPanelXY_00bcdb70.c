/* Static Ghidra output. Delphi register ABI and types require review. */

void oCoverSheetGrid_TCoverSheetGrid_getPanelXY(int param_1,int param_2,undefined4 *param_3)

{
  int iVar1;
  
  func_0x00bcda94(param_1,param_2);
  iVar1 = *(int *)(param_1 + 0x10);
  *param_3 = *(undefined4 *)(iVar1 + param_2 * 8);
  param_3[1] = *(undefined4 *)(iVar1 + 4 + param_2 * 8);
  return;
}

