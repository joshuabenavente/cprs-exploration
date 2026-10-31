/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fFrame_TfrmFrame_tabPageChange(int param_1,undefined4 param_2)

{
  code *pcVar1;
  char cVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_24;
  undefined *puStack_20;
  code *UNRECOVERED_JUMPTABLE;
  
  UNRECOVERED_JUMPTABLE = (code *)0xff1b03;
  cVar2 = func_0x00fd72a8(*(undefined4 *)(param_1 + 0x6bc));
  if (cVar2 == '\0') {
    UNRECOVERED_JUMPTABLE = (code *)0xff1b15;
    func_0x00608594(*(undefined4 *)(param_1 + 0x5d4));
    puStack_20 = &UNK_00ff1b65;
    uStack_24 = *in_FS_OFFSET;
    *in_FS_OFFSET = &uStack_24;
    uVar3 = *(undefined4 *)(param_1 + 0x58);
    UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
    func_0x00fd7f24(*(undefined4 *)(param_1 + 0x6bc),1);
    func_0x006019b0(param_1,uVar3);
    pcVar1 = UNRECOVERED_JUMPTABLE;
    *in_FS_OFFSET = uStack_24;
    UNRECOVERED_JUMPTABLE = (code *)0xff1b6c;
    puStack_20 = (undefined *)0xff1b62;
    func_0x006085cc(*(undefined4 *)(param_1 + 0x5d4),uStack_24,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00ff1b63. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
    return;
  }
  UNRECOVERED_JUMPTABLE = (code *)0xff1b7a;
  func_0x004093c8(param_2,_Vcl_ComCtrls__TTabControl);
  UNRECOVERED_JUMPTABLE = (code *)0xff1b7f;
  uVar3 = func_0x00668488();
  UNRECOVERED_JUMPTABLE = (code *)0xff1b89;
  iVar4 = func_0x00ff1dbc(param_1,uVar3);
  if (iVar4 != -1) {
    UNRECOVERED_JUMPTABLE = (code *)0xff1ba4;
    cVar2 = func_0x00409490(*(undefined4 *)(param_1 + 0x488));
    if ((cVar2 != '\0') && (*(int *)(param_1 + 0x6f0) != 0)) {
      UNRECOVERED_JUMPTABLE = (code *)0xff1bc6;
      cVar2 = func_0x00409490(*(undefined4 *)(param_1 + 0x488));
      if (cVar2 == '\0') {
        UNRECOVERED_JUMPTABLE = (code *)0xff1bdb;
        (**(code **)(**(int **)(param_1 + 0x488) + 0x164))();
      }
    }
  }
  if (*(char *)(*_DAT_0124f9dc + 0x56) == '\0') {
    switch(iVar4) {
    case 1:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1c53;
      func_0x00ff16fc(param_1,*_DAT_0124eebc);
      break;
    case 2:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1c68;
      func_0x00ff16fc(param_1,*_DAT_0124f59c);
      break;
    case 3:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1c7d;
      func_0x00ff16fc(param_1,*_DAT_0124ef68);
      break;
    case 4:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1c8f;
      func_0x00ff16fc(param_1,*_DAT_0124e090);
      break;
    case 6:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1ca1;
      func_0x00ff16fc(param_1,*_DAT_0124e574);
      break;
    case 7:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1cb3;
      func_0x00ff16fc(param_1,*_DAT_0124f308);
      break;
    case 8:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1cc5;
      func_0x00ff16fc(param_1,*_DAT_0124ec3c);
      break;
    case 9:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1ce9;
      func_0x00ff16fc(param_1,*_DAT_0124f35c);
      break;
    case 10:
      UNRECOVERED_JUMPTABLE = (code *)0xff1cfb;
      func_0x00ff16fc(param_1,*_DAT_0124e5b4);
      break;
    case 0xb:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1cd7;
      func_0x00ff16fc(param_1,*_DAT_0124ed38);
      break;
    case -1:
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00ff1c3e;
      func_0x00ff16fc(param_1,0);
    }
    if (iVar4 != -1) {
      _DAT_0125a6c0 = iVar4;
    }
  }
  else {
    UNRECOVERED_JUMPTABLE = (code *)0xff1d1b;
    func_0x00ff16fc(param_1,*_DAT_0124e5b4);
    _DAT_0125a6c0 = 10;
  }
  UNRECOVERED_JUMPTABLE = (code *)0xff1d2d;
  fFrame_TfrmFrame_SetupPtInfoPanel(param_1);
  UNRECOVERED_JUMPTABLE = (code *)0xff1d32;
  cVar2 = func_0x009d61a8();
  if ((cVar2 != '\0') && (*(char *)(param_1 + 0x743) != '\0')) {
    UNRECOVERED_JUMPTABLE = (code *)0xff1d47;
    func_0x00d110e0();
  }
  _DAT_0125a6c8 = iVar4;
  return;
}

