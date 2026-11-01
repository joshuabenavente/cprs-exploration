/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fLabs_TfrmLabs_ClearPtData(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  
  func_0x012034d0(param_1);
  if (*(int *)(param_1 + 0x5f4) != 0) {
    func_0x0040afd4(0x125a324);
    func_0x00eb4234(param_1);
  }
  func_0x006b860c(*(undefined4 *)(param_1 + 0x4e4),0);
  (**(code **)(**(int **)(*(int *)(param_1 + 0x4f0) + 0x330) + 0x48))();
  (**(code **)(*_DAT_0125a2a4 + 0x48))();
  (**(code **)(*_DAT_0125a2a8 + 0x48))();
  (**(code **)(*_DAT_0125a2ac + 0x48))();
  piVar2 = (int *)func_0x00669150(*(undefined4 *)(param_1 + 0x5d4));
  (**(code **)(*piVar2 + 0x48))();
  func_0x00ebd980(param_1);
  (**(code **)(*_DAT_0125a2a0 + 0x48))();
  func_0x0068263c(*(undefined4 *)(param_1 + 0x5bc),_DAT_0125a330);
  uVar1 = *(undefined4 *)(param_1 + 0x550);
  func_0x00769474(uVar1,1);
  func_0x00768fac(uVar1,1);
  func_0x0076d3a0(uVar1,0,0,0);
  return;
}

