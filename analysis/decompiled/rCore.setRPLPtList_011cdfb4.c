/* Static Ghidra output. Delphi register ABI and types require review. */

void rCore_setRPLPtList(int *param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  code *pcVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar2;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_30;
  undefined1 *puStack_2c;
  undefined4 uStack_20;
  undefined1 uStack_1c;
  undefined4 uStack_18;
  undefined1 uStack_14;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  puStack_2c = (undefined1 *)0x11cdfcb;
  uStack_8 = param_2;
  func_0x0040b0c8(param_2);
  puStack_30 = &UNK_011ce031;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  uVar2 = 0;
  uStack_20 = uStack_8;
  uStack_1c = 0x11;
  uStack_14 = 0x11;
  uStack_10 = param_4;
  uStack_c = 0;
  puStack_2c = (undefined1 *)((int)register0x00000010 + -4);
  uStack_18 = param_3;
  ORNet_CallVistA(&UNK_011ce050,&uStack_20,2,0,param_1);
  func_0x009b2cf8(param_1);
  (**(code **)(*param_1 + 0x14))();
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar2;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011ce038;
  func_0x0040afd4(&uStack_8,uVar2,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011ce02f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

