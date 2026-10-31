/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fCoverSheet_TfrmCoverSheet_OnDisplayPage(int *param_1,undefined4 param_2,int param_3)

{
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_28;
  undefined *puStack_24;
  code *UNRECOVERED_JUMPTABLE;
  int *piStack_14;
  int *piStack_10;
  int *piStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  piStack_c = (int *)0x0;
  piStack_10 = (int *)0x0;
  piStack_14 = (int *)0x0;
  puStack_24 = &UNK_00fd95a3;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  *_DAT_0124f0ac = 0;
  uStack_8 = param_2;
  func_0x0060297c(param_1);
  param_1[0x121] = param_1[0x121] + 1;
  param_1[0x122] = param_1[0x122] + 1;
  if ((param_3 == 0) && (param_1[0x122] == 1)) {
    param_1[0x123] = 1;
  }
  else {
    param_1[0x123] = param_3;
  }
  if (param_1[0x121] == 1) {
    func_0x00bf0108(&piStack_c);
    (**(code **)(*piStack_c + 0x48))(piStack_c,param_1);
    func_0x00bf0108(&piStack_10);
    (**(code **)(*piStack_10 + 0x40))(piStack_10,param_1,param_1[0x120]);
  }
  if (param_1[0x122] == 1) {
    func_0x00bf0108(&piStack_14);
    (**(code **)(*piStack_14 + 0x50))(piStack_14,param_1,*(undefined4 *)(*_DAT_0124f2e0 + 4));
  }
  if (param_1[0xbb] == 0) {
    (**(code **)(*param_1 + 0x1d8))(param_1,uStack_8);
  }
  else {
    func_0x00724290(param_1,param_1[0xbb]);
  }
  *in_FS_OFFSET = uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00fd95aa;
  puStack_24 = (undefined *)0xfd95a0;
  func_0x0040d1c4(&piStack_14,_DAT_00befedc,3);
                    /* WARNING: Could not recover jumptable at 0x00fd95a1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

