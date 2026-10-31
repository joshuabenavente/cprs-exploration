/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fNotes_TfrmNotes_DisplayPage(int param_1)

{
  int iVar1;
  code *pcVar2;
  char cVar3;
  undefined4 uVar4;
  undefined4 *in_FS_OFFSET;
  undefined1 auStack_60 [52];
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined *puStack_24;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_1c;
  undefined *puStack_18;
  undefined1 *puStack_14;
  int iStack_10;
  undefined4 uStack_8;
  
  puStack_14 = auStack_60 + 0x5c;
  iStack_10 = 0xb;
  do {
    iStack_10 = iStack_10 + -1;
  } while (iStack_10 != 0);
  puStack_18 = &UNK_00e148da;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)0xe146f5;
  uStack_8 = param_1;
  func_0x00608594(param_1);
  puStack_24 = &UNK_00e148b5;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  uStack_2c = 0xe1470b;
  UNRECOVERED_JUMPTABLE = (code *)(auStack_60 + 0x5c);
  func_0x012034e8(uStack_8);
  *_DAT_0124f0ac = _DAT_0125a100;
  uStack_2c = 0xe1472d;
  func_0x00ffdcd8(*_DAT_0124f7c4,*(undefined4 *)(uStack_8 + 0x4e8));
  iVar1 = *(int *)(*_DAT_0124f7c4 + 0x4c8);
  *(undefined4 *)(iVar1 + 0xc) = 6;
  uStack_2c = 0xe14748;
  func_0x00709128(iVar1,1);
  uStack_2c = 0xe1475c;
  func_0x00709128(*(undefined4 *)(*_DAT_0124f7c4 + 0x5a0),1);
  uStack_2c = 0xe14770;
  func_0x00709128(*(undefined4 *)(*_DAT_0124f7c4 + 0x5e8),1);
  uStack_2c = 0xe14778;
  cVar3 = func_0x012035ec(uStack_8);
  if (cVar3 != '\0') {
    uStack_2c = 0xe14788;
    func_0x00e20548(uStack_8);
    uStack_2c = 0xe14790;
    func_0x00a0ddb0(auStack_60);
    uStack_2c = 0xe147a6;
    func_0x0040d52c(uStack_8 + 0x828,auStack_60,_DAT_00a14078);
    uStack_2c = 0xe147c2;
    func_0x0040d52c(uStack_8 + 2000,uStack_8 + 0x828,_DAT_00a14078);
    uStack_2c = 0xe147c7;
    uVar4 = func_0x00aeac0c();
    uStack_2c = 0xe147d7;
    func_0x00709244(*(undefined4 *)(uStack_8 + 0x65c),uVar4);
    uStack_2c = 0xe147f2;
    func_0x00709244(*(undefined4 *)(uStack_8 + 0x658),
                    *(undefined1 *)(*(int *)(uStack_8 + 0x65c) + 0x4a));
    uStack_2c = 0xe1480d;
    func_0x00709244(*(undefined4 *)(uStack_8 + 0x648),
                    *(undefined1 *)(*(int *)(uStack_8 + 0x65c) + 0x4a));
    uStack_2c = 0xe14829;
    func_0x006b861c(*(undefined4 *)(uStack_8 + 0x5dc),*(int *)(*_DAT_0124f9dc + 0x40) * 1000);
    uStack_2c = 0xe1483c;
    func_0x009b5ff4(*(undefined4 *)(uStack_8 + 0x4c4),8);
  }
  uStack_2c = 0xe14844;
  cVar3 = func_0x0120360c(uStack_8);
  if ((cVar3 != '\0') && (*(int *)(uStack_8 + 0x48c) != 2)) {
    uStack_2c = 0xe14865;
    fNotes_TfrmNotes_SetViewContext(uStack_8,uStack_8 + 0x828);
  }
  if (*(int *)(uStack_8 + 0x48c) == 1) {
    uStack_2c = 0xe1487e;
    cVar3 = func_0x0120360c(uStack_8);
    if (cVar3 == '\0') {
      uStack_2c = 0xe14893;
      fNotes_TfrmNotes_SetViewContext(uStack_8,uStack_8 + 0x828);
    }
  }
  else if (*(int *)(uStack_8 + 0x48c) == 2) {
    uStack_2c = 0xe1489d;
    func_0x00e1d328(uStack_8);
  }
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e148bc;
  puStack_24 = (undefined *)0xe148b2;
  func_0x006085cc(uStack_8,uStack_28,pcVar2);
                    /* WARNING: Could not recover jumptable at 0x00e148b3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

