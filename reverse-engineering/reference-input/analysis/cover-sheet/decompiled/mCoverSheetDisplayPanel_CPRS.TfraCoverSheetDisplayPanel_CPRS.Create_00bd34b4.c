/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_Create(int param_1,char param_2)

{
  int *piVar1;
  undefined4 uVar2;
  char extraout_DL;
  char cVar3;
  undefined4 unaff_ESI;
  undefined4 *in_FS_OFFSET;
  
  cVar3 = '\0';
  if (param_2 != '\0') {
    param_1 = func_0x004096ac();
    cVar3 = extraout_DL;
  }
  func_0x00bd2a9c(param_1,0);
  *(undefined1 *)(param_1 + 0x350) = 0;
  piVar1 = *(int **)(param_1 + 0x34c);
  func_0x0067fe24(piVar1,0);
  (**(code **)(*piVar1 + 0x1d4))(piVar1,3);
  func_0x00680278(piVar1,1);
  func_0x0067fd4c(piVar1,1);
  uVar2 = func_0x0067b720(piVar1[0xc3]);
  func_0x0067b5c0(uVar2,1);
  uVar2 = func_0x004d81f4(_System_Classes__TStringList,1);
  *(undefined4 *)(param_1 + 0x35c) = uVar2;
  *(undefined4 *)(param_1 + 0x360) = 0xffffffff;
  *(undefined1 *)(param_1 + 0x364) = 1;
  func_0x006b861c(*(undefined4 *)(param_1 + 0x348),_mCoverSheetDisplayPanel_CPRS_UPDATING_WAIT_TIME)
  ;
  func_0x006b860c(*(undefined4 *)(param_1 + 0x348),0);
  if (cVar3 != '\0') {
    func_0x00409704(param_1);
    *in_FS_OFFSET = unaff_ESI;
  }
  return param_1;
}

