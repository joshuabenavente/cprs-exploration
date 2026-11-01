/* Static Ghidra output. Delphi register ABI and types require review. */

void mCoverSheetDisplayPanel_CPRS_ProblemList_TfraCoverSheetDisplayPanel_CPRS_ProblemList_OnGetDetail
               (undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  char cVar1;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  
  cVar1 = func_0x00bd0338(param_2,0xd,&UNK_00bda5a4,1);
  if (cVar1 == '\0') {
    cVar1 = func_0x00bd0338(param_2,0xd,&UNK_00bda7f4,1);
    if (cVar1 != '\0') {
      func_0x009b44a8(&UNK_00bda840,&UNK_00bda804,CONCAT22(extraout_var_00,0x30));
    }
  }
  else {
    cVar1 = func_0x00bd0338(param_2,0x10,&UNK_00bda5b4,1);
    if (cVar1 == '\0') {
      func_0x009b44a8(&UNK_00bda71c,&UNK_00bda6e0,CONCAT22(extraout_var,0x30));
    }
    else {
      func_0x009b44a8(&UNK_00bda604,&UNK_00bda5c8,CONCAT22(extraout_var,0x30));
    }
  }
  mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_OnGetDetail(param_1,param_2,param_3);
  return;
}

