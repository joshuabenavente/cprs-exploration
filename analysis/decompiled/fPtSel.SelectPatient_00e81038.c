/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fPtSel_SelectPatient(undefined4 param_1,undefined4 param_2,undefined1 *param_3)

{
  code *pcVar1;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  int *in_FS_OFFSET;
  undefined1 uVar2;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined *puStack_34;
  int iStack_30;
  int iStack_2c;
  undefined *puStack_28;
  int iStack_24;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  iStack_24 = (int)register0x00000010 + -4;
  uStack_8 = (int *)0x0;
  uStack_c = 0;
  uStack_10 = 0;
  uStack_14 = 0;
  puStack_28 = &UNK_00e81200;
  iStack_2c = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_2c;
  iStack_30 = 0xe8106e;
  uStack_8 = (int *)func_0x011c5f98(_fPtSel__TfrmPtSel,1,*_DAT_0124f460);
  DAT_0125a270 = '\0';
  uVar2 = 1;
  puStack_34 = &UNK_00e811dc;
  UNRECOVERED_JUMPTABLE_00 = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = (int)&UNRECOVERED_JUMPTABLE_00;
  iStack_30 = (int)register0x00000010 + -4;
  func_0x00e81220(uStack_8,param_1,param_2);
  func_0x011cc360(&uStack_c);
  func_0x0040b3c4(&DAT_0125a260,uStack_c);
  func_0x0079acec(_DAT_0125a260,CONCAT22(extraout_var,0x5e),2,&uStack_10);
  func_0x0040b3c4(0x125a264,uStack_10);
  func_0x0079acec(_DAT_0125a260,CONCAT22(extraout_var_00,0x5e),1);
  func_0x0040b3c4(&DAT_0125a260,uStack_14);
  func_0x0040c324(_DAT_0125a268,&UNK_00e8121c);
  if ((bool)uVar2) {
    func_0x0040afd4(&DAT_0125a260);
  }
  func_0x00e8b134(uStack_8[0x144],_DAT_0125a260);
  uVar2 = DAT_0125a270 == '\0';
  if (!(bool)uVar2) {
    func_0x00727778(uStack_8);
    uStack_8 = (int *)0x0;
    func_0x0040a734();
    pcVar1 = UNRECOVERED_JUMPTABLE_00;
    *in_FS_OFFSET = (int)&uStack_14;
    UNRECOVERED_JUMPTABLE_00 = (code *)&UNK_00e81207;
    func_0x0040b034(&uStack_14,3,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00e811fe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
    return;
  }
  func_0x011d69a4(*_DAT_0124f490);
  uStack_8[0x148] = -1;
  func_0x00e85d30(uStack_8);
  func_0x00e82c44(uStack_8);
  func_0x0040c324(_DAT_0125a268,&UNK_00e8121c);
  if ((bool)uVar2) {
    func_0x00e85ac4(uStack_8);
  }
  *(undefined1 *)(uStack_8 + 0x14b) = 0;
  (**(code **)(*(int *)uStack_8[0x138] + 0x17c))((int *)uStack_8[0x138],0);
  func_0x011c5e1c(uStack_8,0);
  (**(code **)(*uStack_8 + 0x1b4))();
  pcVar1 = UNRECOVERED_JUMPTABLE_00;
  *param_3 = (char)uStack_8[0x14b];
  *in_FS_OFFSET = (int)&uStack_14;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xe811e3;
  if (uStack_8 != (int *)0x0) {
    func_0x00727778(uStack_8,&uStack_14,pcVar1);
  }
                    /* WARNING: Could not recover jumptable at 0x00e811da. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

