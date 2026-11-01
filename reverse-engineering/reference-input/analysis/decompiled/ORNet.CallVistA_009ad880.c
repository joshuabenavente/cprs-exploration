/* Static Ghidra output. Delphi register ABI and types require review. */

void ORNet_CallVistA(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                    undefined4 param_5,undefined1 param_6,double *param_7)

{
  char cVar1;
  undefined4 *in_FS_OFFSET;
  float10 in_ST0;
  undefined4 uVar2;
  undefined4 uStack_20;
  undefined *puStack_1c;
  undefined1 *puStack_18;
  undefined4 uStack_8;
  
  puStack_18 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  puStack_1c = &UNK_009ad8ec;
  uStack_20 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_20;
  uVar2 = 0;
  cVar1 = ORNet_CallVistA(param_1,param_2,param_3,0,param_6);
  if (cVar1 != '\0') {
    func_0x009b1b30(uStack_8);
    *param_7 = (double)in_ST0;
  }
  *in_FS_OFFSET = uVar2;
  func_0x0040afd4(&uStack_8,uVar2,&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x009ad8ea. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)&UNK_009ad8f3)(&UNK_009ad8f3);
  return;
}

