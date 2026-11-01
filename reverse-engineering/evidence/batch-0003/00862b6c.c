/* Unverified decompiler output; inspect assembly and ABI. */

void XWBHash_Decrypt(ushort *param_1,undefined4 param_2)

{
  ushort uVar1;
  code *pcVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_28;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_20;
  undefined4 uStack_14;
  int iStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_14 = 0;
  puStack_20 = (undefined1 *)0x862b87;
  uStack_c = param_2;
  uStack_8 = param_1;
  System__UStrAddRef(param_1);
  uVar3 = uStack_c;
  UNRECOVERED_JUMPTABLE = (code *)0x862c14;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  iStack_10 = *uStack_8 - 0x20;
  iVar4 = 0;
  if (uStack_8 != (ushort *)0x0) {
    iVar4 = *(int *)(uStack_8 + -2);
  }
  uVar1 = uStack_8[iVar4 + -1];
  iVar4 = 0;
  if (uStack_8 != (ushort *)0x0) {
    iVar4 = *(int *)(uStack_8 + -2);
  }
  puStack_20 = (undefined1 *)((int)register0x00000010 + -4);
  System__UStrCopy(uStack_8,2,iVar4 + -2,&uStack_14);
  MFunStr_Translate(uStack_14,*(undefined4 *)(&XWBHash_CipherPad + (uVar1 - 0x20) * 4),
                    *(undefined4 *)(&XWBHash_CipherPad + iStack_10 * 4));
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar3;
  UNRECOVERED_JUMPTABLE = (code *)0x862c1b;
  uStack_28 = 0x862c09;
  System__UStrClr(&uStack_14,uVar3,pcVar2);
  uStack_28 = 0x862c11;
  System__UStrClr(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00862c12. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

