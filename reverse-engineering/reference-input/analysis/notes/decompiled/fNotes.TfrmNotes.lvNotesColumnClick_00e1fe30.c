/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fNotes_TfrmNotes_lvNotesColumnClick(int param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int iStack_10;
  
  iVar1 = func_0x004d4aac(param_3);
  if (iVar1 == 0) {
    iStack_10 = 5;
  }
  else {
    iStack_10 = func_0x004d4aac(param_3);
  }
  if (iStack_10 == _DAT_0125a160) {
    DAT_0125a164 = DAT_0125a164 ^ 1;
  }
  else {
    DAT_0125a164 = 1;
  }
  iVar1 = *(int *)(*(int *)(*(int *)(*(int *)(param_1 + 0x4d8) + 0x30c) + 8) + 8);
  if (-1 < iVar1 + -1) {
    iVar3 = 0;
    do {
      uVar2 = func_0x0067b704(*(undefined4 *)(*(int *)(param_1 + 0x4d8) + 0x30c),iVar3);
      func_0x0067b5f4(uVar2,0xffffffff);
      iVar3 = iVar3 + 1;
      iVar1 = iVar1 + -1;
    } while (iVar1 != 0);
  }
  if (DAT_0125a164 == 0) {
    uVar2 = func_0x004d4aac(param_3);
    uVar2 = func_0x0067b704(*(undefined4 *)(*(int *)(param_1 + 0x4d8) + 0x30c),uVar2);
    func_0x0067b5f4(uVar2,0xd);
  }
  else {
    uVar2 = func_0x004d4aac(param_3);
    uVar2 = func_0x0067b704(*(undefined4 *)(*(int *)(param_1 + 0x4d8) + 0x30c),uVar2);
    func_0x0067b5f4(uVar2,0xc);
  }
  _DAT_0125a160 = iStack_10;
  switch(iStack_10) {
  default:
    func_0x0040b3c4(param_1 + 0x808,&UNK_00e1ffe0);
    break;
  case 1:
    func_0x0040b3c4(param_1 + 0x808,&UNK_00e1fff0);
    break;
  case 2:
    func_0x0040b3c4(param_1 + 0x808,&UNK_00e20000);
    break;
  case 3:
    func_0x0040b3c4(param_1 + 0x808,&UNK_00e20010);
    break;
  case 4:
    func_0x0040b3c4(param_1 + 0x808,&UNK_00e20020);
    break;
  case 5:
    func_0x0040b3c4(param_1 + 0x808,&UNK_00e1ffe0);
  }
  *(byte *)(param_1 + 0x80c) = DAT_0125a164;
  func_0x004093c8(param_2,_Vcl_ComCtrls__TCustomListView);
  func_0x00682410();
  return;
}

