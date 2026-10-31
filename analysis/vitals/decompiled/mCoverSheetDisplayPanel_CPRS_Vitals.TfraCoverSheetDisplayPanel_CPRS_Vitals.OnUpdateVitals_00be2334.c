/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_Vitals_TfraCoverSheetDisplayPanel_CPRS_Vitals_OnUpdateVitals
               (int param_1)

{
  char cVar1;
  int iVar2;
  int *piVar3;
  int *in_FS_OFFSET;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined *puStack_30;
  int iStack_2c;
  int iStack_28;
  undefined *puStack_24;
  code *UNRECOVERED_JUMPTABLE;
  int *piStack_18;
  int *piStack_14;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  uStack_10 = 0;
  piStack_14 = (int *)0x0;
  piStack_18 = (int *)0x0;
  puStack_24 = &UNK_00be2465;
  iStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_28;
  iStack_2c = 0xbe235b;
  iStack_c = param_1;
  cVar1 = func_0x01011c80(0x11,1,0);
  if (cVar1 == '\0') {
    *in_FS_OFFSET = iStack_28;
    UNRECOVERED_JUMPTABLE = (code *)&UNK_00be246c;
    puStack_24 = (undefined *)0xbe245a;
    func_0x0040d1c4(&piStack_18,_DAT_00befedc,2);
    puStack_24 = (undefined *)0xbe2462;
    func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00be2463. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
    return;
  }
  iStack_2c = 0xbe2376;
  (**(code **)(**(int **)(iStack_c + 0x34c) + 0x9c))(*(int **)(iStack_c + 0x34c),0);
  puStack_30 = &UNK_00be2433;
  UNRECOVERED_JUMPTABLE_00 = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = (int)&UNRECOVERED_JUMPTABLE_00;
  iStack_2c = (int)register0x00000010 + -4;
  iVar2 = func_0x00682964(*(undefined4 *)(iStack_c + 0x34c));
  if (iVar2 == 0) {
    func_0x0040afd4(&uStack_8);
  }
  else {
    piVar3 = (int *)func_0x00682964(*(undefined4 *)(iStack_c + 0x34c));
    (**(code **)(*piVar3 + 0x18))(piVar3,&uStack_8);
  }
  iVar2 = (int)&uStack_10 + 3;
  func_0x00ae6cb0(*_DAT_0124eb40,*_DAT_0124f2e0,*_DAT_0124e2a0,iVar2,uStack_8);
  if (uStack_10._3_1_ != '\0') {
    func_0x00bf0108(&piStack_14);
    (**(code **)(*piStack_14 + 0x4c))(piStack_14,iStack_c,0x46);
    func_0x00bf0108(&piStack_18);
    (**(code **)(*piStack_18 + 0x4c))(piStack_18,iStack_c,0x32);
  }
  *in_FS_OFFSET = iVar2;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xbe243a;
  (**(code **)(**(int **)(iStack_c + 0x34c) + 0x9c))(*(int **)(iStack_c + 0x34c),1);
                    /* WARNING: Could not recover jumptable at 0x00be2431. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

