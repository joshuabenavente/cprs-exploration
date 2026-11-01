/* Unverified decompiler output; inspect assembly and ABI. */

void fSignItem_TfrmSignItem_cmdOKClick(int param_1)

{
  code *pcVar1;
  char cVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_20;
  undefined *puStack_1c;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  uStack_c = 0;
  uStack_10 = 0;
  puStack_1c = &UNK_00cf2afa;
  uStack_20 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_20;
  func_0x006026ac(*(undefined4 *)(param_1 + 0x480),&uStack_8);
  cVar2 = func_0x011cb4d8(uStack_8);
  if (cVar2 == '\0') {
    func_0x009b44a8(&UNK_00cf2b58,&UNK_00cf2b14,0);
    (**(code **)(**(int **)(param_1 + 0x480) + 0x164))();
    func_0x00629660(*(undefined4 *)(param_1 + 0x480));
  }
  else {
    func_0x006026ac(*(undefined4 *)(param_1 + 0x480),&uStack_10);
    XWBHash_Encrypt(uStack_10,&uStack_c);
    func_0x0040b3c4(param_1 + 0x494,uStack_c);
    func_0x00727128(param_1);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_20;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00cf2b01;
  puStack_1c = (undefined *)0xcf2ae7;
  func_0x0040afd4(&uStack_10,uStack_20,pcVar1);
  puStack_1c = (undefined *)0xcf2aef;
  func_0x0040afd4(&uStack_c);
  puStack_1c = (undefined *)0xcf2af7;
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00cf2af8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

