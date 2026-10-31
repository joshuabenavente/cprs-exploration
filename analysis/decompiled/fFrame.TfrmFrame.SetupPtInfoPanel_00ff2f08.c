/* Static Ghidra output. Delphi register ABI and types require review. */

void fFrame_TfrmFrame_SetupPtInfoPanel(int param_1)

{
  char cVar1;
  undefined1 uVar2;
  undefined4 uVar3;
  int iVar4;
  
  uVar3 = func_0x00668488(*(undefined4 *)(param_1 + 0x488));
  iVar4 = func_0x00ff1dbc(param_1,uVar3);
  cVar1 = (**(code **)(**(int **)(param_1 + 0x6bc) + 0x178))();
  if (cVar1 != '\x03') {
    uVar2 = (**(code **)(**(int **)(param_1 + 0x6bc) + 0x178))();
    *(undefined1 *)(param_1 + 0x760) = uVar2;
  }
  if (iVar4 == -1) {
    (**(code **)(**(int **)(param_1 + 0x6bc) + 0x188))(*(int **)(param_1 + 0x6bc),3);
  }
  else {
    (**(code **)(**(int **)(param_1 + 0x6bc) + 0x1a0))(*(int **)(param_1 + 0x6bc),iVar4);
    cVar1 = (**(code **)(**(int **)(param_1 + 0x6bc) + 0x178))();
    if (cVar1 != '\x03') {
      cVar1 = (**(code **)(**(int **)(param_1 + 0x6bc) + 0x178))();
      if (cVar1 == *(char *)(param_1 + 0x760)) {
        (**(code **)(**(int **)(param_1 + 0x6bc) + 0x1ac))();
      }
      else {
        (**(code **)(**(int **)(param_1 + 0x6bc) + 0x188))
                  (*(int **)(param_1 + 0x6bc),*(undefined1 *)(param_1 + 0x760));
      }
    }
  }
  return;
}

