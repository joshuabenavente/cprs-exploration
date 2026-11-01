/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fPtSel_TfrmPtSel_cboPatientChange(int param_1)

{
  int iVar1;
  code *pcVar2;
  char cVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  bool bVar5;
  undefined4 uStack_38;
  undefined *puStack_34;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  iStack_c = 0;
  uStack_10 = 0;
  uStack_14 = 0;
  uStack_18 = 0;
  uStack_1c = 0;
  uStack_20 = 0;
  uStack_24 = 0;
  puStack_34 = &UNK_00e82783;
  uStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_38;
  pcVar2 = (code *)((int)register0x00000010 + -4);
  uStack_8 = param_1;
  if (*(char *)(param_1 + 0x531) == '\0') {
    iVar1 = *(int *)(param_1 + 0x480);
    func_0x007b3d10(*(undefined4 *)(param_1 + 0x480),&iStack_c);
    iVar4 = 0;
    if (iStack_c != 0) {
      iVar4 = *(int *)(iStack_c + -4);
    }
    if (0 < iVar4) {
      do {
        if (*(ushort *)(iStack_c + -2 + iVar4 * 2) < 9) {
          bVar5 = true;
        }
        else {
          bVar5 = (ushort)(*(short *)(iStack_c + -2 + iVar4 * 2) - 10U) < 0x16;
        }
        if (bVar5) {
          func_0x0040c3a4(&iStack_c,iVar4,1);
        }
        iVar4 = iVar4 + -1;
      } while (iVar4 != 0);
    }
    *(undefined1 *)(uStack_8 + 0x531) = 1;
    func_0x007b41b0(*(undefined4 *)(uStack_8 + 0x480),iStack_c);
    func_0x009a9728(_UResponsiveGUI__TResponsiveGUI,0,0);
    *(undefined1 *)(uStack_8 + 0x531) = 0;
    func_0x007b3d10(iVar1,&uStack_10);
    cVar3 = func_0x00e8908c(**(undefined4 **)(uStack_8 + 0x510),uStack_10);
    bVar5 = cVar3 == '\0';
    if (bVar5) {
      func_0x007b3d10(iVar1,&uStack_1c);
      cVar3 = func_0x00e89164(**(undefined4 **)(uStack_8 + 0x510),uStack_1c);
      bVar5 = cVar3 == '\0';
      pcVar2 = UNRECOVERED_JUMPTABLE;
      if (!bVar5) {
        func_0x0040c324(_DAT_0125a268,&UNK_00e8279c);
        if (bVar5) {
          func_0x007b3d10(iVar1,&uStack_20);
          rCore_ListPtByRPLFullSSN(*(undefined4 *)(iVar1 + 0x2c8),uStack_20);
        }
        else {
          func_0x007b3d10(iVar1,&uStack_24);
          rCore_ListPtByFullSSN(*(undefined4 *)(iVar1 + 0x2c8),uStack_24);
        }
        fPtSel_ShowMatchingPatients();
        pcVar2 = UNRECOVERED_JUMPTABLE;
      }
    }
    else {
      func_0x0040c324(_DAT_0125a268,&UNK_00e8279c);
      if (bVar5) {
        func_0x007b3d10(iVar1,&uStack_14);
        rCore_ListPtByRPLLast5(*(undefined4 *)(iVar1 + 0x2c8),uStack_14);
      }
      else {
        func_0x007b3d10(iVar1,&uStack_18);
        rCore_ListPtByLast5(*(undefined4 *)(iVar1 + 0x2c8),uStack_18);
      }
      fPtSel_ShowMatchingPatients();
      pcVar2 = UNRECOVERED_JUMPTABLE;
    }
  }
  UNRECOVERED_JUMPTABLE = pcVar2;
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_38;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e8278a;
  puStack_34 = (undefined *)0xe82780;
  func_0x0040b034(&uStack_24,7,pcVar2);
                    /* WARNING: Could not recover jumptable at 0x00e82781. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

