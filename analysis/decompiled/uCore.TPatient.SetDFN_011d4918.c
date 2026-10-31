/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void uCore_TPatient_SetDFN(int param_1,int param_2)

{
  code *pcVar1;
  undefined4 *in_FS_OFFSET;
  bool bVar2;
  undefined4 uStack_90;
  undefined *puStack_8c;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined2 uStack_68;
  undefined4 uStack_64;
  int iStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined1 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined1 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  int iStack_14;
  int iStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)0x11d4932;
  iStack_c = param_2;
  uStack_8 = param_1;
  func_0x0040c99c(&uStack_84,_DAT_011ca1a4);
  bVar2 = true;
  puStack_8c = &UNK_011d4b31;
  uStack_90 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_90;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x0040c324(iStack_c,*(undefined4 *)(uStack_8 + 4));
  if (!bVar2) {
    func_0x011d4438(uStack_8);
    if (iStack_c != 0) {
      rCore_SelectPatient(iStack_c,&uStack_84);
      func_0x0040b3c4(uStack_8 + 4,iStack_c);
      func_0x0040b3c4(uStack_8 + 0x10,uStack_84);
      func_0x0040b3c4(uStack_8 + 8,uStack_80);
      func_0x0040b3c4(uStack_8 + 0xc,uStack_7c);
      func_0x0040b3c4(uStack_8 + 0x14,uStack_78);
      *(undefined4 *)(uStack_8 + 0x18) = uStack_74;
      *(undefined4 *)(uStack_8 + 0x1c) = uStack_70;
      *(undefined4 *)(uStack_8 + 0x20) = uStack_6c;
      func_0x0040b3c4(uStack_8 + 0x28,uStack_1c);
      func_0x0040b3c4(uStack_8 + 0x2c,uStack_18);
      *(undefined2 *)(uStack_8 + 0x24) = uStack_68;
      func_0x0040b3c4(uStack_8 + 0x30,uStack_4c);
      *(undefined1 *)(uStack_8 + 0x34) = uStack_48;
      iStack_10 = iStack_60;
      iStack_14 = iStack_60;
      if (iStack_60 != 0) {
        iStack_14 = *(int *)(iStack_60 + -4);
      }
      *(bool *)(uStack_8 + 0x35) = 0 < iStack_14;
      if (*(char *)(uStack_8 + 0x35) == '\0') {
        func_0x0040b3c4(uStack_8 + 0x38,&UNK_011d4b70);
      }
      else {
        func_0x0040b3c4(uStack_8 + 0x38,&UNK_011d4b48);
      }
      func_0x0040b3c4(uStack_8 + 0x40,uStack_5c);
      *(undefined4 *)(uStack_8 + 0x3c) = uStack_64;
      *(undefined4 *)(uStack_8 + 0x44) = uStack_54;
      func_0x0040b3c4(uStack_8 + 0x48,uStack_50);
      *(undefined4 *)(uStack_8 + 0x50) = uStack_44;
      *(undefined4 *)(uStack_8 + 0x54) = uStack_40;
      *(undefined1 *)(uStack_8 + 0x58) = uStack_3c;
      *(undefined4 *)(uStack_8 + 0x5c) = uStack_38;
      func_0x0040b3c4(uStack_8 + 0x60,uStack_34);
      func_0x0040b3c4(uStack_8 + 100,uStack_30);
      func_0x0040b3c4(uStack_8 + 0x68,uStack_28);
      func_0x0040b3c4(uStack_8 + 0x6c,uStack_24);
      func_0x0040b3c4(uStack_8 + 0x70,uStack_20);
      func_0x0040b3c4(uStack_8 + 0x74,uStack_2c);
      func_0x011d48f8(uStack_8);
      func_0x011d48d8(uStack_8);
    }
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_90;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011d4b38;
  puStack_8c = (undefined *)0x11d4b2e;
  func_0x0040cd88(&uStack_84,_DAT_011ca1a4,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011d4b2f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

