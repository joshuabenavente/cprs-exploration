/* Static Ghidra output. Delphi register ABI and types require review. */

void fOrders_TfrmOrders_GetPlainText
               (int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  code *pcVar1;
  int iVar2;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar3;
  undefined4 uStack_2c;
  undefined *puStack_28;
  code *UNRECOVERED_JUMPTABLE;
  int iStack_1c;
  uint uStack_18;
  uint uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  iStack_1c = 0;
  puStack_28 = &UNK_0117e5c7;
  uStack_2c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_2c;
  uStack_10 = param_3;
  uStack_c = param_2;
  uStack_8 = param_1;
  func_0x0040afd4(param_4);
  uVar3 = 1;
  iVar2 = func_0x0066bfe0(*(undefined4 *)(*(int *)(uStack_8 + 0x534) + 0x2c8));
  func_0x0040c324(*(undefined4 *)(iVar2 + 0xc),&UNK_0117e5e4);
  uStack_18 = (uint)!(bool)uVar3;
  if (uStack_18 < 0xb) {
    uStack_14 = uStack_18;
    do {
      func_0x0117ea50(uStack_8,uStack_c,uStack_10,&iStack_1c,uStack_14);
      if (iStack_1c != 0) {
        func_0x0066bfe0(*(undefined4 *)(*(int *)(uStack_8 + 0x534) + 0x2c8),uStack_14);
        func_0x0040c214(param_4,5);
      }
      uStack_14 = uStack_14 + 1;
    } while (uStack_14 != 0xb);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_2c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0117e5ce;
  puStack_28 = (undefined *)0x117e5c4;
  func_0x0040afd4(&iStack_1c,uStack_2c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x0117e5c5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

