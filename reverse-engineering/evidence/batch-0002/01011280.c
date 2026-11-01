/* Unverified decompiler output; inspect assembly and ABI. */

void uWriteAccess_TWriteAccess_WriteAccess
               (undefined4 param_1,undefined4 param_2,undefined1 param_3,undefined4 param_4)

{
  code *pcVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar2;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_18;
  undefined1 *puStack_14;
  
  puStack_14 = (undefined1 *)0x1011295;
  System__UStrAddRef(param_4);
  puStack_18 = &LAB_010112d1;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  uVar2 = param_4;
  puStack_14 = (undefined1 *)((int)register0x00000010 + -4);
  uWriteAccess_TWriteAccess_WriteAccess(param_1,param_2,0,param_4,param_3);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar2;
  UNRECOVERED_JUMPTABLE = (code *)&LAB_010112d8;
  System__UStrClr(&param_4,uVar2,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x010112cf. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

