/* Static Ghidra output. Delphi register ABI and types require review. */

undefined4
mCoverSheetDisplayPanel_CPRS_ProblemList_TfraCoverSheetDisplayPanel_CPRS_ProblemList_Create
          (undefined4 param_1,char param_2)

{
  char extraout_DL;
  char cVar1;
  undefined4 unaff_EBX;
  undefined4 *in_FS_OFFSET;
  
  cVar1 = '\0';
  if (param_2 != '\0') {
    param_1 = func_0x004096ac();
    cVar1 = extraout_DL;
  }
  mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_Create(param_1,0);
  func_0x00bd3894(param_1,0,&UNK_00bda4dc);
  func_0x00bd36a0(param_1);
  if (cVar1 != '\0') {
    func_0x00409704(param_1);
    *in_FS_OFFSET = unaff_EBX;
  }
  return param_1;
}

