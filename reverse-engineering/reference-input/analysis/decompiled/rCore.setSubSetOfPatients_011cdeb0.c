/* Static Ghidra output. Delphi register ABI and types require review. */

void rCore_setSubSetOfPatients(int *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uStack_14;
  undefined1 uStack_10;
  undefined4 uStack_c;
  undefined1 uStack_8;
  
  uStack_10 = 0x11;
  uStack_8 = 0;
  uStack_14 = param_2;
  uStack_c = param_3;
  ORNet_CallVistA(&UNK_011cdf04,&uStack_14,1,0,param_1);
  func_0x009b2cf8(param_1);
  (**(code **)(*param_1 + 0x14))();
  return;
}

