/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_RetrieveVisibleOrders(int param_1,int param_2)

{
  undefined4 uVar1;
  code *pcVar2;
  undefined4 *in_FS_OFFSET;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_24;
  undefined1 *puStack_20;
  int iStack_1c;
  int iStack_18;
  undefined4 uStack_14;
  int iStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  puStack_20 = (undefined1 *)0x117e408;
  iStack_c = param_2;
  uStack_8 = param_1;
  uStack_14 = func_0x0040908c(_System_Classes__TList,1);
  puStack_24 = &UNK_0117e4a1;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  puStack_20 = (undefined1 *)((int)register0x00000010 + -4);
  if (iStack_c <= iStack_c + 100) {
    iStack_1c = ((iStack_c + 100) - iStack_c) + 1;
    iStack_10 = iStack_c;
    puStack_20 = (undefined1 *)((int)register0x00000010 + -4);
    do {
      if (*(int *)(_DAT_0125a9e0 + 8) <= iStack_10) break;
      iStack_18 = func_0x004d2ff0(_DAT_0125a9e0,iStack_10);
      if (*(char *)(iStack_18 + 0x69) == '\0') {
        func_0x004d2e10(uStack_14,iStack_18);
      }
      iStack_10 = iStack_10 + 1;
      iStack_1c = iStack_1c + -1;
    } while (iStack_1c != 0);
  }
  uVar1 = *(undefined4 *)(*(int *)(uStack_8 + 0x688) + 0x28);
  func_0x011ddc0c(uStack_14,*(undefined4 *)(*(int *)(uStack_8 + 0x688) + 0x30));
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar1;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0117e4a8;
  func_0x004090bc(uStack_14,uVar1,pcVar2);
                    /* WARNING: Could not recover jumptable at 0x0117e49f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

