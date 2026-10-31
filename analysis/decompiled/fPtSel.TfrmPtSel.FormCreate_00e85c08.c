/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fPtSel_TfrmPtSel_FormCreate(int param_1)

{
  int iVar1;
  char cVar2;
  undefined1 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  
  func_0x011c674c(param_1);
  func_0x011c5e14(param_1,*(undefined4 *)(param_1 + 0x4f0));
  *(undefined1 *)(param_1 + 0x530) = 0;
  *(undefined1 *)(param_1 + 0x52e) = 0;
  func_0x00e859f4(param_1);
  *(undefined1 *)(param_1 + 0x544) = 1;
  iVar1 = *(int *)(param_1 + 0x510);
  *(int *)(iVar1 + 0x34c) = param_1;
  *(undefined **)(iVar1 + 0x348) = &fPtSel_TfrmPtSel_SetCaptionTop;
  *(int *)(iVar1 + 0x354) = param_1;
  *(undefined **)(iVar1 + 0x350) = &fPtSel_TfrmPtSel_SetPtListTop;
  cVar2 = func_0x009d619c();
  if (cVar2 != '\0') {
    func_0x00e6f41c(*(undefined4 *)(param_1 + 0x518));
    func_0x00e86d58(param_1);
  }
  uVar5 = 1;
  uVar4 = func_0x00e76260();
  func_0x00d2e260(uVar4,*(undefined4 *)(param_1 + 0x500),5,uVar5);
  uVar4 = func_0x0060ca58(param_1);
  iVar1 = *_DAT_0124e884;
  *(undefined4 *)(iVar1 + 0x4d4) = uVar4;
  uVar4 = func_0x004d81f4(_System_Classes__TStringList,CONCAT31((int3)((uint)iVar1 >> 8),1));
  *(undefined4 *)(param_1 + 0x534) = uVar4;
  uVar4 = func_0x004d81f4(_System_Classes__TStringList,1);
  *(undefined4 *)(param_1 + 0x53c) = uVar4;
  uVar4 = func_0x005cd258(*(undefined4 *)(*(int *)(param_1 + 0x4bc) + 0x7c));
  *(undefined4 *)(param_1 + 0x540) = uVar4;
  uVar3 = func_0x00a02688(*(undefined4 *)(*(int *)(param_1 + 0x510) + 0x2f0));
  *(undefined1 *)(*(int *)(param_1 + 0x510) + 0x359) = uVar3;
  return;
}

