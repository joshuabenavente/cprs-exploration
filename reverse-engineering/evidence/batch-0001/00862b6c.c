/* Unverified decompiler output; inspect assembly and ABI. */

void XWBHash_Decrypt(ushort *param_1,undefined4 param_2)

{
  ushort uVar1;
  code *pcVar2;
  int iVar3;
  int *in_FS_OFFSET;
  undefined4 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_24;
  undefined1 *puStack_20;
  undefined4 uStack_14;
  int iStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_14 = 0;
  puStack_20 = (undefined1 *)0x862b87;
  uStack_c = param_2;
  uStack_8 = param_1;
  func_0x0040b0c8(param_1);
  puStack_24 = &UNK_00862c14;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = (int)&UNRECOVERED_JUMPTABLE;
  iStack_10 = *uStack_8 - 0x20;
  iVar3 = 0;
  if (uStack_8 != (ushort *)0x0) {
    iVar3 = *(int *)(uStack_8 + -2);
  }
  uVar1 = uStack_8[iVar3 + -1];
  iVar3 = 0;
  if (uStack_8 != (ushort *)0x0) {
    iVar3 = *(int *)(uStack_8 + -2);
  }
  puVar4 = &uStack_14;
  puStack_20 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x0040c35c(uStack_8,2,iVar3 + -2,puVar4,uStack_c);
  func_0x008617bc(uStack_14,*(undefined4 *)(&XWBHash_CipherPad + (uVar1 - 0x20) * 4),
                  *(undefined4 *)(&XWBHash_CipherPad + iStack_10 * 4));
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = (int)puVar4;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00862c1b;
  func_0x0040afd4(&uStack_14,puVar4,pcVar2);
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00862c12. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

