/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_Appts_TfraCoverSheetDisplayPanel_CPRS_Appts_OnGetDetail
               (undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  code *pcVar1;
  undefined4 uVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar3;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_3c;
  undefined1 *puStack_38;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined1 uStack_24;
  undefined4 uStack_20;
  undefined1 uStack_1c;
  undefined4 uStack_18;
  undefined1 uStack_14;
  int *piStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_38 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_c = 0;
  uStack_2c = 0;
  piStack_10 = (int *)0x0;
  puStack_3c = &UNK_00bd7d68;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  uVar3 = 0;
  uStack_8 = param_3;
  mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_CPRSParams
            (param_1,&piStack_10,param_3,0,param_3);
  (**(code **)(*piStack_10 + 0x38))(piStack_10,&uStack_c);
  uVar2 = uStack_c;
  uStack_28 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  uStack_24 = 0x11;
  uStack_20 = 0;
  uStack_1c = 0x11;
  func_0x00bcf93c(param_2,1,&uStack_2c);
  uStack_18 = uStack_2c;
  uStack_14 = 0x11;
  ORNet_CallVistA(uVar2,&uStack_28,2);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar3;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bd7d6f;
  func_0x0040afd4(&uStack_2c,uVar3,pcVar1);
  func_0x00410738(&piStack_10);
  func_0x0040afd4(&uStack_c);
                    /* WARNING: Could not recover jumptable at 0x00bd7d66. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

