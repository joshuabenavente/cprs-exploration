/* Static Ghidra output. Delphi register ABI and types require review. */

void fOrders_TfrmOrders_GetStartStopText(undefined4 param_1,int param_2,int param_3,int *param_4)

{
  code *pcVar1;
  char cVar2;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_3c;
  undefined *puStack_38;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  int iStack_24;
  int iStack_20;
  int iStack_1c;
  int iStack_18;
  int iStack_14;
  int iStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  uStack_2c = 0;
  uStack_28 = 0;
  iStack_14 = 0;
  UNRECOVERED_JUMPTABLE = (code *)0x117e86f;
  iStack_10 = param_3;
  iStack_c = param_2;
  uStack_8 = param_1;
  func_0x0040b0c8(param_2);
  UNRECOVERED_JUMPTABLE = (code *)0x117e877;
  func_0x0040b0c8(iStack_10);
  puStack_38 = &UNK_0117e9c8;
  uStack_3c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_3c;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x009b1794(&UNK_0117e9e4,iStack_c,param_4);
  cVar2 = func_0x009b17dc(iStack_c);
  if (cVar2 != '\0') {
    iStack_18 = iStack_c;
    if (iStack_c != 0) {
      iStack_18 = *(int *)(iStack_c + -4);
    }
    if (iStack_18 == 7) {
      func_0x0079acec(*param_4,CONCAT22(extraout_var,0x20),1,&uStack_28);
      func_0x0040b3c4(param_4,uStack_28);
    }
  }
  iStack_1c = *param_4;
  if (iStack_1c != 0) {
    iStack_1c = *(int *)(iStack_1c + -4);
  }
  if (0 < iStack_1c) {
    func_0x0040c18c(param_4,&UNK_0117ea10,*param_4);
  }
  func_0x009b1794(&UNK_0117e9e4,iStack_10,&iStack_14);
  cVar2 = func_0x009b17dc(iStack_10);
  if (cVar2 != '\0') {
    iStack_20 = iStack_10;
    if (iStack_10 != 0) {
      iStack_20 = *(int *)(iStack_10 + -4);
    }
    if (iStack_20 == 7) {
      func_0x0079acec(iStack_14,CONCAT22(extraout_var_00,0x20),1,&uStack_2c);
      func_0x0040b40c(&iStack_14,uStack_2c);
    }
  }
  iStack_24 = iStack_14;
  if (iStack_14 != 0) {
    iStack_24 = *(int *)(iStack_14 + -4);
  }
  if (0 < iStack_24) {
    func_0x0040c214(param_4,4);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_3c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0117e9cf;
  puStack_38 = (undefined *)0x117e9b8;
  func_0x0040b034(&uStack_2c,2,pcVar1);
  puStack_38 = (undefined *)0x117e9c5;
  func_0x0040b034(&iStack_14,3);
                    /* WARNING: Could not recover jumptable at 0x0117e9c6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

