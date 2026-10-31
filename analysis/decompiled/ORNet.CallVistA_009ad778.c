/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void ORNet_CallVistA(undefined4 param_1,undefined4 param_2,undefined4 param_3,byte param_4)

{
  code *pcVar1;
  undefined4 uVar2;
  uint uVar3;
  uint *in_FS_OFFSET;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_20;
  undefined1 *puStack_1c;
  
  puStack_1c = (undefined1 *)0x9ad793;
  uVar2 = func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_20 = &UNK_009ad7d8;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = (uint)&UNRECOVERED_JUMPTABLE;
  uVar3 = (uint)param_4;
  puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  ORNet_CallVistA(param_1,param_2,param_3,uVar3,uVar2);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar3;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_009ad7df;
  func_0x004090bc(uVar2,0,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x009ad7d6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

