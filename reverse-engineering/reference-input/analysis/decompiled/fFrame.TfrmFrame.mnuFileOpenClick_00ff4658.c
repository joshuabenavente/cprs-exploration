/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fFrame_TfrmFrame_mnuFileOpenClick(int param_1,int param_2)

{
  code *pcVar1;
  char cVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uStack_44;
  undefined4 uStack_40;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined1 *puStack_30;
  int iStack_2c;
  int iStack_24;
  int iStack_20;
  undefined1 uStack_17;
  undefined4 uStack_14;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  puStack_30 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_10 = 0;
  uStack_14 = 0;
  uStack_34 = 0xff5533;
  uStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_38;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xff468d;
  iStack_c = param_2;
  uStack_8 = param_1;
  (**(code **)(**(int **)(param_1 + 0x498) + 0x9c))(*(int **)(param_1 + 0x498),0);
  if ((*(int *)(uStack_8 + 0x4bc) == iStack_c) || (*(char *)(uStack_8 + 0x6e2) != '\0')) {
    fFrame_PTSwitchRefresh = 1;
  }
  else {
    fFrame_PTSwitchRefresh = 0;
  }
  uStack_17 = 0;
  if (*(char *)(uStack_8 + 0x6e2) == '\0') {
    *(undefined4 *)(*(int *)(uStack_8 + 0x4b4) + 0xc) = 0;
  }
  else {
    *(undefined4 *)(*(int *)(uStack_8 + 0x4b4) + 0xc) = 1;
  }
  UNRECOVERED_JUMPTABLE_00 = (code *)0xff46f7;
  func_0x006026fc(*(undefined4 *)(uStack_8 + 0x6ac),0);
  UNRECOVERED_JUMPTABLE_00 = (code *)0xff4708;
  (**(code **)(**(int **)(uStack_8 + 0x6ac) + 0xdc))();
  UNRECOVERED_JUMPTABLE_00 = (code *)0xff4710;
  func_0x00ff56a0(uStack_8);
  UNRECOVERED_JUMPTABLE_00 = (code *)0xff471c;
  iStack_20 = func_0x011d56a0(_uCore__TChanges,1);
  uStack_40 = 0xff4e27;
  uStack_44 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_44;
  iVar3 = *(int *)(*(int *)(*_DAT_0124f8dc + 8) + 8);
  UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
  if (-1 < iVar3 + -1) {
    iStack_24 = 0;
    UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
    iStack_2c = iVar3;
    do {
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      uVar8 = *(undefined4 *)(iVar3 + 0x2c);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      uVar7 = *(undefined4 *)(iVar3 + 0x28);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      uVar4 = (uint)*(byte *)(iVar3 + 0x30);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      uVar5 = (uint)*(byte *)(iVar3 + 0x31);
      uVar6 = 0;
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 8),iStack_24);
      func_0x011d57b8(iStack_20,10,*(undefined4 *)(iVar3 + 8),uVar6,uVar5,uVar4,uVar7,uVar8);
      iStack_24 = iStack_24 + 1;
      iStack_2c = iStack_2c + -1;
    } while (iStack_2c != 0);
  }
  iVar3 = *(int *)(*(int *)(*_DAT_0124f8dc + 0xc) + 8);
  if (-1 < iVar3 + -1) {
    iStack_24 = 0;
    iStack_2c = iVar3;
    do {
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      uVar8 = *(undefined4 *)(iVar3 + 0x2c);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      uVar7 = *(undefined4 *)(iVar3 + 0x28);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      uVar4 = (uint)*(byte *)(iVar3 + 0x30);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      uVar5 = (uint)*(byte *)(iVar3 + 0x31);
      uVar6 = 0;
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0xc),iStack_24);
      func_0x011d57b8(iStack_20,0x14,*(undefined4 *)(iVar3 + 8),uVar6,uVar5,uVar4,uVar7,uVar8);
      iStack_24 = iStack_24 + 1;
      iStack_2c = iStack_2c + -1;
    } while (iStack_2c != 0);
  }
  iVar3 = *(int *)(*(int *)(*_DAT_0124f8dc + 0x14) + 8);
  if (-1 < iVar3 + -1) {
    iStack_24 = 0;
    iStack_2c = iVar3;
    do {
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      uVar8 = *(undefined4 *)(iVar3 + 0x2c);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      uVar7 = *(undefined4 *)(iVar3 + 0x28);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      uVar4 = (uint)*(byte *)(iVar3 + 0x30);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      uVar5 = (uint)*(byte *)(iVar3 + 0x31);
      uVar6 = 0;
      iVar3 = func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f8dc + 0x14),iStack_24);
      func_0x011d57b8(iStack_20,0x1e,*(undefined4 *)(iVar3 + 8),uVar6,uVar5,uVar4,uVar7,uVar8);
      iStack_24 = iStack_24 + 1;
      iStack_2c = iStack_2c + -1;
    } while (iStack_2c != 0);
  }
  cVar2 = fFrame_TfrmFrame_AllowContextChangeAll(uStack_8,&uStack_14);
  pcVar1 = UNRECOVERED_JUMPTABLE_00;
  if (cVar2 != '\0') {
    *in_FS_OFFSET = uStack_44;
    UNRECOVERED_JUMPTABLE_00 = (code *)0xff4e2e;
    uStack_40 = 0xff4e1c;
    func_0x011d5ac8(iStack_20,uStack_44,pcVar1);
    uStack_40 = 0xff4e24;
    func_0x004090bc(iStack_20);
                    /* WARNING: Could not recover jumptable at 0x00ff4e25. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
    return;
  }
  (**(code **)(**(int **)(uStack_8 + 0x498) + 0x9c))(*(int **)(uStack_8 + 0x498),1);
  func_0x011d5ac8(*_DAT_0124f8dc);
  iVar3 = *(int *)(*(int *)(iStack_20 + 8) + 8);
  if (-1 < iVar3 + -1) {
    iStack_24 = 0;
    iStack_2c = iVar3;
    do {
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      uVar8 = *(undefined4 *)(iVar3 + 0x2c);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      uVar7 = *(undefined4 *)(iVar3 + 0x28);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      uVar4 = (uint)*(byte *)(iVar3 + 0x30);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      uVar5 = (uint)*(byte *)(iVar3 + 0x31);
      uVar6 = 0;
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 8),iStack_24);
      func_0x011d57b8(*_DAT_0124f8dc,10,*(undefined4 *)(iVar3 + 8),uVar6,uVar5,uVar4,uVar7,uVar8);
      iStack_24 = iStack_24 + 1;
      iStack_2c = iStack_2c + -1;
    } while (iStack_2c != 0);
  }
  iVar3 = *(int *)(*(int *)(iStack_20 + 0xc) + 8);
  if (-1 < iVar3 + -1) {
    iStack_24 = 0;
    iStack_2c = iVar3;
    do {
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      uVar8 = *(undefined4 *)(iVar3 + 0x2c);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      uVar7 = *(undefined4 *)(iVar3 + 0x28);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      uVar4 = (uint)*(byte *)(iVar3 + 0x30);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      uVar5 = (uint)*(byte *)(iVar3 + 0x31);
      uVar6 = 0;
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0xc),iStack_24);
      func_0x011d57b8(*_DAT_0124f8dc,0x14,*(undefined4 *)(iVar3 + 8),uVar6,uVar5,uVar4,uVar7,uVar8);
      iStack_24 = iStack_24 + 1;
      iStack_2c = iStack_2c + -1;
    } while (iStack_2c != 0);
  }
  iVar3 = *(int *)(*(int *)(iStack_20 + 0x14) + 8);
  if (-1 < iVar3 + -1) {
    iStack_24 = 0;
    iStack_2c = iVar3;
    do {
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      uVar8 = *(undefined4 *)(iVar3 + 0x2c);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      uVar7 = *(undefined4 *)(iVar3 + 0x28);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      uVar4 = (uint)*(byte *)(iVar3 + 0x30);
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      uVar5 = (uint)*(byte *)(iVar3 + 0x31);
      uVar6 = 0;
      iVar3 = func_0x004d2ff0(*(undefined4 *)(iStack_20 + 0x14),iStack_24);
      func_0x011d57b8(*_DAT_0124f8dc,0x1e,*(undefined4 *)(iVar3 + 8),uVar6,uVar5,uVar4,uVar7,uVar8);
      iStack_24 = iStack_24 + 1;
      iStack_2c = iStack_2c + -1;
    } while (iStack_2c != 0);
  }
  func_0x00ff0a60(uStack_8);
  func_0x0040a734();
  pcVar1 = UNRECOVERED_JUMPTABLE_00;
  *in_FS_OFFSET = uStack_44;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xff553a;
  uStack_40 = 0xff5530;
  func_0x0040b034(&uStack_14,2,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00ff5531. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

