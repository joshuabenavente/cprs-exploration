/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rCover_ListAllergies(undefined4 param_1)

{
  undefined4 uStack_c;
  undefined1 uStack_8;
  
  uStack_c = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  uStack_8 = 0x11;
  ORNet_CallVistA(&UNK_00bf062c,&uStack_c,0,0,param_1);
  func_0x009b2cf8(param_1);
  return;
}

