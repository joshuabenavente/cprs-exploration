/* Static Ghidra output. Delphi register ABI and types require review. */

void rLabs_Interim(int *param_1,undefined4 param_2,int param_3,double param_4,double param_5)

{
  code *pcVar1;
  int iVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 in_stack_ffffffac;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_48;
  undefined1 *puStack_44;
  float10 fStack_38;
  float10 fStack_2c;
  undefined4 uStack_20;
  undefined1 uStack_1c;
  float10 *pfStack_18;
  undefined1 uStack_14;
  float10 *pfStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  puStack_44 = (undefined1 *)0xc867df;
  uStack_8 = param_3;
  func_0x0040b0c8(param_3);
  puStack_48 = &UNK_00c86869;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  iVar2 = 0;
  if (uStack_8 != 0) {
    iVar2 = *(int *)(uStack_8 + -4);
  }
  if (iVar2 < 1) {
    puStack_44 = (undefined1 *)((int)register0x00000010 + -4);
    (**(code **)(*param_1 + 0x3c))(param_1,&UNK_00c86884);
    (**(code **)(*param_1 + 0x3c))(param_1,&UNK_00c868fc);
  }
  else {
    in_stack_ffffffac = 0;
    uStack_1c = 0x11;
    fStack_2c = (float10)param_5;
    pfStack_18 = &fStack_2c;
    uStack_14 = 3;
    fStack_38 = (float10)param_4;
    pfStack_10 = &fStack_38;
    uStack_c = 3;
    puStack_44 = (undefined1 *)((int)register0x00000010 + -4);
    uStack_20 = param_2;
    ORNet_CallVistA(uStack_8,&uStack_20,2,0,param_1);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = in_stack_ffffffac;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00c86870;
  func_0x0040afd4(&uStack_8,in_stack_ffffffac,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00c86867. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

