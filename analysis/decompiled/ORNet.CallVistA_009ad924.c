/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void ORNet_CallVistA(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                    byte param_5,int *param_6)

{
  code *pcVar1;
  int *piVar2;
  uint uVar3;
  int iVar4;
  uint *in_FS_OFFSET;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_34;
  int iStack_30;
  uint uStack_2c;
  undefined *puStack_28;
  int iStack_24;
  undefined4 uStack_14;
  int *piStack_10;
  undefined1 uStack_9;
  undefined4 uStack_8;
  
  uStack_14 = 0;
  iStack_24 = 0x9ad944;
  uStack_8 = param_3;
  func_0x0040b0c8(param_4);
  puStack_28 = &UNK_009ada06;
  uStack_2c = *in_FS_OFFSET;
  *in_FS_OFFSET = (uint)&uStack_2c;
  iStack_30 = 0x9ad95e;
  iStack_24 = (int)register0x00000010 + -4;
  piStack_10 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_34 = &UNK_009ad9df;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = (uint)&UNRECOVERED_JUMPTABLE;
  uVar3 = (uint)param_5;
  iStack_30 = (int)register0x00000010 + -4;
  uStack_9 = ORNet_CallVistA(param_1,param_2,uStack_8,uVar3,piStack_10);
  iVar4 = (**(code **)(*piStack_10 + 0x14))();
  if (iVar4 < 1) {
    func_0x0040afd4(param_6);
  }
  else {
    (**(code **)(*piStack_10 + 0xc))(piStack_10,0,&uStack_14);
    func_0x0040b3c4(param_6,uStack_14);
  }
  if (*param_6 == 0) {
    func_0x0040b3c4(param_6,param_4);
  }
  piVar2 = piStack_10;
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar3;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_009ad9e6;
  piStack_10 = (int *)0x0;
  func_0x004090bc(piVar2,0,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x009ad9dd. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

