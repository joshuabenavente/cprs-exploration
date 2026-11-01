/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fNotes_TfrmNotes_SetViewContext(int param_1,undefined4 *param_2)

{
  code *pcVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_78;
  undefined *puStack_74;
  code *UNRECOVERED_JUMPTABLE;
  char cStack_5d;
  undefined4 auStack_5c [22];
  
  puVar3 = auStack_5c;
  for (iVar2 = 0x16; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = *param_2;
    param_2 = param_2 + 1;
    puVar3 = puVar3 + 1;
  }
  UNRECOVERED_JUMPTABLE = (code *)0xe1dfc1;
  func_0x0040d3f0(auStack_5c,_DAT_00a14078);
  puStack_74 = &UNK_00e1e138;
  uStack_78 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_78;
  UNRECOVERED_JUMPTABLE = (code *)(auStack_5c + 0x16);
  if (*(int *)(param_1 + 0x7bc) != -1) {
    UNRECOVERED_JUMPTABLE = (code *)(auStack_5c + 0x16);
    func_0x00e1946c(param_1,&cStack_5d);
    if (cStack_5d == '\0') goto LAB_00e1e11a;
  }
  func_0x0040d52c(param_1 + 2000,auStack_5c,_DAT_00a14078);
  func_0x00e1e48c(param_1,0xffffffff);
  (**(code **)(**(int **)(param_1 + 0x4cc) + 0x9c))(*(int **)(param_1 + 0x4cc),1);
  fNotes_TfrmNotes_ReadToFront(param_1);
  if (*(int *)(param_1 + 0x7f0) == 0) {
    _DAT_0125a104 = 0;
    func_0x00e16624(param_1,param_1);
  }
  else {
    func_0x0040b3c4(0x125a10c,*(undefined4 *)(param_1 + 0x7d4));
    func_0x0040b3c4(0x125a110,*(undefined4 *)(param_1 + 0x7d8));
    uRam0125a118 = *(undefined4 *)(param_1 + 0x7e0);
    uRam0125a11c = *(undefined4 *)(param_1 + 0x7e4);
    uRam0125a120 = *(undefined4 *)(param_1 + 0x7e8);
    uRam0125a124 = *(undefined4 *)(param_1 + 0x7ec);
    func_0x0040b3c4(0x125a128,*(undefined4 *)(param_1 + 0x7f0));
    uRam0125a130 = *(undefined4 *)(param_1 + 0x7f8);
    uRam0125a134 = *(undefined4 *)(param_1 + 0x7fc);
    uRam0125a138 = *(undefined4 *)(param_1 + 0x800);
    uRam0125a13c = *(undefined1 *)(param_1 + 0x804);
    func_0x0040b3c4(0x125a148,*(undefined4 *)(param_1 + 0x810));
    func_0x0040b3c4(0x125a140,*(undefined4 *)(param_1 + 0x808));
    uRam0125a144 = *(undefined1 *)(param_1 + 0x80c);
    uRam0125a14c = *(undefined1 *)(param_1 + 0x814);
    func_0x0040b3c4(0x125a154,*(undefined4 *)(param_1 + 0x81c));
    func_0x0040b3c4(0x125a150,*(undefined4 *)(param_1 + 0x818));
    uRam0125a158 = *(undefined1 *)(param_1 + 0x820);
    uRam0125a108 = 1;
    func_0x00e16624(param_1,param_1);
  }
LAB_00e1e11a:
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_78;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e1e13f;
  puStack_74 = (undefined *)0xe1e135;
  func_0x0040cd88(auStack_5c,_DAT_00a14078,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00e1e136. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

