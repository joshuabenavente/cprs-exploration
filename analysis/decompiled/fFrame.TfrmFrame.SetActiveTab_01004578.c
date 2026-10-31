/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fFrame_TfrmFrame_SetActiveTab(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  
  uVar1 = func_0x00ff1d54(_DAT_0125a6a0,param_2);
  (**(code **)(**(int **)(param_1 + 0x488) + 0x17c))(*(int **)(param_1 + 0x488),uVar1);
  fFrame_TfrmFrame_tabPageChange(param_1,*(undefined4 *)(param_1 + 0x488));
  return;
}

