/* Unverified decompiler output; inspect assembly and ABI. */

void rTIU_SignDocument(undefined1 *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  int *in_FS_OFFSET;
  undefined1 uVar1;
  undefined4 uVar2;
  code *UNRECOVERED_JUMPTABLE;
  int iStack_38;
  undefined *puStack_34;
  int iStack_30;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined1 uStack_14;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  iStack_30 = (int)register0x00000010 + -4;
  uStack_20 = 0;
  uStack_1c = 0;
  uStack_8 = 0;
  uVar1 = 1;
  puStack_34 = &UNK_00a0c7b8;
  iStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_38;
  uVar2 = 0;
  uStack_14 = 0;
  uStack_c = 0x11;
  uStack_18 = param_2;
  uStack_10 = param_3;
  ORNet_CallVistA(&UNK_00a0c7d4,&uStack_18,1,0,0,&uStack_8);
  func_0x009b2f6c(uStack_8,CONCAT22(extraout_var,0x5e),1,&uStack_1c);
  func_0x0040c324(uStack_1c,&UNK_00a0c800);
  *param_1 = uVar1;
  func_0x009b2f6c(uStack_8,CONCAT22(extraout_var_00,0x5e),2);
  func_0x0040b3c4(param_1 + 4,uStack_20);
  *in_FS_OFFSET = (int)&uStack_20;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00a0c7bf;
  func_0x0040b034(&uStack_20,2,uVar2);
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00a0c7b6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

