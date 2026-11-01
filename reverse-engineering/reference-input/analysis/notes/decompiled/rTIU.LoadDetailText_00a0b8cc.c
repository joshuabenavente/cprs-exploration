/* Static Ghidra output. Delphi register ABI and types require review. */

void rTIU_LoadDetailText(undefined4 param_1,undefined4 param_2)

{
  undefined4 uStack_c;
  undefined1 uStack_8;
  
  uStack_8 = 0;
  uStack_c = param_2;
  ORNet_CallVistA(&UNK_00a0b900,&uStack_c,0,0,param_1);
  return;
}

