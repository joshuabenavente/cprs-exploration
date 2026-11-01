/* Unverified decompiler output; inspect assembly and ABI. */

void XWBHash_Encrypt(undefined4 param_1,undefined4 param_2)

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 *puVar4;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_2c;
  undefined *puStack_28;
  undefined1 *puStack_24;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_c = 0;
  uStack_10 = 0;
  uStack_14 = 0;
  puStack_24 = (undefined1 *)0x862acd;
  uStack_8 = param_1;
  func_0x0040b0c8(param_1);
  puStack_28 = &UNK_00862b5e;
  uStack_2c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_2c;
  puStack_24 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x00407e34();
  iVar2 = func_0x00407e84(0x14);
  do {
    iVar3 = func_0x00407e84(0x14);
  } while (iVar3 == iVar2);
  func_0x0040bf44(&uStack_c,iVar2 + 0x20);
  puVar4 = &uStack_10;
  func_0x008617bc(uStack_8,*(undefined4 *)(&XWBHash_CipherPad + iVar2 * 4),
                  *(undefined4 *)(&XWBHash_CipherPad + iVar3 * 4),puVar4,uStack_c);
  func_0x0040bf44(&uStack_14,iVar3 + 0x20);
  uVar1 = uStack_14;
  func_0x0040c214(param_2,3);
  *in_FS_OFFSET = uVar1;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00862b65;
  func_0x0040b034(&uStack_14,4,puVar4);
                    /* WARNING: Could not recover jumptable at 0x00862b5c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

