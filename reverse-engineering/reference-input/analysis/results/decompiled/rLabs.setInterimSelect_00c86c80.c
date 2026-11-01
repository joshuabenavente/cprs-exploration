/* Static Ghidra output. Delphi register ABI and types require review. */

void rLabs_setInterimSelect
               (int *param_1,undefined4 param_2,undefined4 param_3,double param_4,double param_5)

{
  float10 fStack_3c;
  float10 fStack_30;
  undefined4 uStack_24;
  undefined1 uStack_20;
  float10 *pfStack_1c;
  undefined1 uStack_18;
  float10 *pfStack_14;
  undefined1 uStack_10;
  undefined4 uStack_c;
  undefined1 uStack_8;
  
  uStack_20 = 0x11;
  fStack_30 = (float10)param_5;
  pfStack_1c = &fStack_30;
  uStack_18 = 3;
  fStack_3c = (float10)param_4;
  pfStack_14 = &fStack_3c;
  uStack_10 = 3;
  uStack_8 = 7;
  uStack_24 = param_2;
  uStack_c = param_3;
  ORNet_CallVistA(&UNK_00c86cf0,&uStack_24,3,0,param_1);
  (**(code **)(*param_1 + 0x14))();
  return;
}

