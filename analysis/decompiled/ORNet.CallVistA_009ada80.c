/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4
ORNet_CallVistA(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined1 param_4,
               int *param_5)

{
  int iVar1;
  code *pcVar2;
  undefined1 *puVar3;
  char cVar4;
  undefined4 uVar5;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_28;
  undefined *puStack_24;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_1c;
  
  puStack_1c = (undefined1 *)0x9ada98;
  cVar4 = func_0x009ad744();
  if (cVar4 == '\0') {
    puStack_1c = (undefined1 *)0x9adab5;
    func_0x009acd20();
    UNRECOVERED_JUMPTABLE = (code *)&UNK_009adb3c;
    puStack_24 = (undefined *)*in_FS_OFFSET;
    *in_FS_OFFSET = &puStack_24;
    uStack_28 = 0x9adacf;
    puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
    func_0x009ad030(param_1,param_2,param_3);
    if (param_5 != (int *)0x0) {
      uStack_28 = 0x9adada;
      (**(code **)(*param_5 + 0x48))();
    }
    uStack_28 = 0x9adae5;
    ORNet_CallBroker(param_5,param_4);
    puVar3 = puStack_1c;
    *in_FS_OFFSET = puStack_24;
    puStack_1c = (undefined1 *)0x9adb43;
    puStack_24 = &UNK_009adb32;
    uStack_28 = *in_FS_OFFSET;
    *in_FS_OFFSET = &uStack_28;
    iVar1 = **(int **)(_DAT_01258fcc + 0x60);
    UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
    (**(code **)(iVar1 + 0x48))(*(int **)(_DAT_01258fcc + 0x60),iVar1,puVar3);
    func_0x0099f0b8(*(undefined4 *)(_DAT_01258fcc + 0x5c));
    pcVar2 = UNRECOVERED_JUMPTABLE;
    *in_FS_OFFSET = uStack_28;
    UNRECOVERED_JUMPTABLE = (code *)&UNK_009adb39;
    puStack_24 = (undefined *)0x9adb2f;
    func_0x009acd2c(0,uStack_28,pcVar2);
                    /* WARNING: Could not recover jumptable at 0x009adb30. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    uVar5 = (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
    return uVar5;
  }
  if (param_5 != (int *)0x0) {
    puStack_1c = (undefined1 *)0x9adaa7;
    (**(code **)(*param_5 + 0x48))();
  }
  return 0;
}

