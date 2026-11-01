/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void uWriteAccess_WriteAccess
               (undefined4 param_1,undefined1 param_2,undefined1 param_3,undefined4 param_4)

{
  code *pcVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar2;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_14;
  undefined1 *puStack_10;
  
  puStack_10 = (undefined1 *)0x1011cf9;
  func_0x0040b0c8(param_4);
  puStack_14 = &UNK_01011d3a;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  uVar2 = param_4;
  puStack_10 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x010112e4(_DAT_0125a708,param_1,param_2,param_4,param_3);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar2;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_01011d41;
  func_0x0040afd4(&param_4,uVar2,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x01011d38. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

