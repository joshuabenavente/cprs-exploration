/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 rCover_DetailAllergy(undefined4 param_1)

{
  undefined4 uVar1;
  undefined4 uStack_1c;
  undefined1 uStack_18;
  undefined4 uStack_14;
  undefined1 uStack_10;
  undefined4 uStack_c;
  undefined1 uStack_8;
  
  uVar1 = func_0x004d81f4(_System_Classes__TStringList,1);
  uStack_1c = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  uStack_18 = 0x11;
  uStack_10 = 0;
  uStack_c = 0;
  uStack_8 = 0x11;
  uStack_14 = param_1;
  ORNet_CallVistA(&UNK_00bf03d8,&uStack_1c,2,0,uVar1);
  return uVar1;
}

