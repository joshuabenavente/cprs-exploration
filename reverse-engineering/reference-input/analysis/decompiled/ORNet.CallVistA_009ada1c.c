/* Static Ghidra output. Delphi register ABI and types require review. */

void ORNet_CallVistA(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined1 param_4,
                    undefined4 param_5,undefined4 param_6)

{
  undefined4 uVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar2;
  undefined4 uStack_1c;
  undefined *puStack_18;
  undefined4 uStack_14;
  
  uStack_14 = (undefined1 *)0x9ada30;
  func_0x0040b0c8(param_5);
  uVar1 = param_6;
  puStack_18 = &UNK_009ada70;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  uVar2 = param_5;
  uStack_14 = (undefined1 *)((int)register0x00000010 + -4);
  ORNet_CallVistA(param_1,param_2,param_3,param_5,param_4);
  *in_FS_OFFSET = uVar2;
  func_0x0040afd4(&param_5,uVar2,uVar1);
                    /* WARNING: Could not recover jumptable at 0x009ada6e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)&UNK_009ada77)(&UNK_009ada77);
  return;
}

