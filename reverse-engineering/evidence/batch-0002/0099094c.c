/* Unverified decompiler output; inspect assembly and ABI. */

void Wsockc_TXWBWinsock_NetworkConnect
               (int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
               undefined4 param_5)

{
  code *pcVar1;
  int iVar2;
  int *in_FS_OFFSET;
  undefined1 *puVar3;
  int iStack_30;
  undefined *puStack_2c;
  undefined1 *puStack_28;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_20;
  undefined1 *puStack_1c;
  undefined1 auStack_c [4];
  undefined4 uStack_8;
  
  puStack_1c = (undefined1 *)0x990964;
  uStack_8 = param_3;
  System__UStrAddRef(param_3);
  puStack_20 = &LAB_009909ec;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = (int)&UNRECOVERED_JUMPTABLE;
  *(undefined1 *)(param_1 + 9) = 0;
  *(undefined1 *)(param_1 + 0x2c) = 0;
  *(undefined4 *)(param_1 + 0x10) = param_4;
  puStack_2c = &DAT_009909ae;
  iStack_30 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_30;
  puVar3 = auStack_c;
  puStack_28 = auStack_c + 8;
  puStack_1c = auStack_c + 8;
  iVar2 = Wsockc_TXWBWinsock_NetStart(param_1,param_2,uStack_8,puVar3,param_5);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = (int)puVar3;
  if (iVar2 == 0) {
    *(undefined1 *)(param_1 + 0x2c) = 1;
  }
  *in_FS_OFFSET = (int)puStack_2c;
  UNRECOVERED_JUMPTABLE = (code *)&LAB_009909f3;
  puStack_28 = (undefined1 *)0x9909e9;
  System__UStrClr(&uStack_8,puStack_2c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x009909ea. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

