/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_RetrieveOrderFields(int param_1,undefined4 param_2,undefined4 param_3,double param_4)

{
  code *pcVar1;
  char cVar2;
  int iVar3;
  undefined4 *in_FS_OFFSET;
  float10 fStack_74;
  undefined4 uStack_68;
  undefined1 uStack_64;
  float10 *pfStack_60;
  undefined1 uStack_5c;
  int *piStack_58;
  undefined1 uStack_54;
  undefined4 uStack_44;
  undefined4 uStack_40;
  int *piStack_3c;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_34;
  undefined1 *puStack_30;
  int *piStack_2c;
  int *piStack_28;
  undefined1 *puStack_24;
  undefined4 uStack_20;
  undefined *puStack_1c;
  undefined1 *puStack_18;
  int iStack_10;
  undefined1 auStack_c [8];
  
  puStack_18 = auStack_c + 8;
  iVar3 = 0x13;
  do {
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  puStack_1c = &UNK_011de0bc;
  uStack_20 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_20;
  puStack_24 = (undefined1 *)0x11ddc3d;
  func_0x004d81f4(_System_Classes__TStringList,1);
  piStack_28 = (int *)&UNK_011de088;
  piStack_2c = (int *)*in_FS_OFFSET;
  *in_FS_OFFSET = &piStack_2c;
  puStack_30 = (undefined1 *)0x11ddc5a;
  puStack_24 = auStack_c + 8;
  piStack_2c = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_34 = &UNK_011ddd00;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  puStack_30 = auStack_c + 8;
  if (-1 < (int)(*(undefined1 **)(param_1 + 8) + -1)) {
    iStack_10 = 0;
    puStack_30 = *(undefined1 **)(param_1 + 8);
    do {
      piStack_3c = (int *)0x11ddc8c;
      iVar3 = func_0x004d2ff0(param_1,iStack_10);
      piStack_3c = (int *)0x11ddc97;
      (**(code **)(*piStack_2c + 0x3c))(piStack_2c,*(undefined4 *)(iVar3 + 0xc));
      iStack_10 = iStack_10 + 1;
      puStack_30 = puStack_30 + -1;
    } while (puStack_30 != (undefined1 *)0x0);
  }
  piStack_3c = piStack_28;
  uStack_40 = 0;
  uStack_64 = 0;
  fStack_74 = (float10)param_4;
  pfStack_60 = &fStack_74;
  uStack_5c = 3;
  piStack_58 = piStack_2c;
  uStack_54 = 7;
  uStack_44 = 0x11ddcdc;
  uStack_68 = param_2;
  cVar2 = ORNet_CallVistA(&UNK_011de0d8,&uStack_68,2);
  if (cVar2 == '\0') {
    uStack_44 = 0x11ddce8;
    (**(code **)(*piStack_28 + 0x48))();
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_40;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011ddd07;
  piStack_3c = (int *)0x11ddcfd;
  func_0x004090bc(piStack_2c,uStack_40,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011ddcfe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

