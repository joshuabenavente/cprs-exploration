/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void uWriteAccess_WriteAccess(undefined4 param_1,undefined1 param_2,undefined4 param_3)

{
  code *pcVar1;
  undefined4 uVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_14;
  undefined4 uStack_8;
  
  puStack_14 = (undefined1 *)0x1011c97;
  uStack_8 = param_3;
  func_0x0040b0c8(param_3);
  uVar2 = uStack_8;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_01011cd3;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  puStack_14 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x01011280(_DAT_0125a708,param_1,param_2);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar2;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_01011cda;
  uStack_1c = 0x1011cd0;
  func_0x0040afd4(&uStack_8,uVar2,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x01011cd1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

