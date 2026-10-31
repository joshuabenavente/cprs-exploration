/* Static Ghidra output. Delphi register ABI and types require review. */

void fPtSel_ShowMatchingPatients(void)

{
  int iVar1;
  int iVar2;
  int in_stack_00000004;
  
  iVar1 = *(int *)(*(int *)(in_stack_00000004 + -4) + 0x480);
  func_0x00e82c44(*(undefined4 *)(in_stack_00000004 + -4));
  iVar2 = func_0x007b3c1c(iVar1);
  if (0 < iVar2) {
    iVar2 = func_0x007b3c1c(iVar1);
    if (iVar2 == 1) {
      func_0x007b3180(iVar1,0);
      func_0x00e82c54(*(undefined4 *)(in_stack_00000004 + -4));
    }
    (**(code **)(**(int **)(iVar1 + 0x2c8) + 0x3c))(*(int **)(iVar1 + 0x2c8),&UNK_00e82514);
    (**(code **)(**(int **)(iVar1 + 0x2c8) + 0x3c))(*(int **)(iVar1 + 0x2c8),&UNK_00e825bc);
  }
  func_0x007b36ec(iVar1,0);
  return;
}

