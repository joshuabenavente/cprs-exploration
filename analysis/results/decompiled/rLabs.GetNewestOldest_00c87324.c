/* Static Ghidra output. Delphi register ABI and types require review. */

void rLabs_GetNewestOldest(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  int *in_FS_OFFSET;
  undefined4 uVar1;
  code *UNRECOVERED_JUMPTABLE;
  int iStack_30;
  undefined *puStack_2c;
  int iStack_28;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  iStack_28 = (int)register0x00000010 + -4;
  uStack_8 = 0;
  uStack_14 = 0;
  uStack_18 = 0;
  puStack_2c = &UNK_00c873c9;
  iStack_30 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_30;
  uVar1 = 0;
  uStack_c = 0x11;
  uStack_10 = param_1;
  ORNet_CallVistA(&UNK_00c873e4,&uStack_10,0,0,0,&uStack_8);
  func_0x009b2f6c(uStack_8,CONCAT22(extraout_var,0x5e),1,&uStack_14);
  func_0x0040b3c4(param_2,uStack_14);
  func_0x009b2f6c(uStack_8,CONCAT22(extraout_var_00,0x5e),2);
  func_0x0040b3c4(param_3,uStack_18);
  *in_FS_OFFSET = (int)&uStack_18;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00c873d0;
  func_0x0040b034(&uStack_18,2,uVar1);
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00c873c7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

