/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_DisplayPage(int param_1)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined3 uVar5;
  int iStack_18;
  undefined1 uStack_d;
  int iStack_c;
  
  func_0x012034e8(param_1);
  func_0x00ffdcd8(*_DAT_0124f7c4,*(undefined4 *)(param_1 + 0x4ec));
  *(undefined4 *)(*(int *)(*_DAT_0124f7c4 + 0x4c8) + 0xc) = 4;
  func_0x00709128(*(undefined4 *)(*_DAT_0124f7c4 + 0x4c8),1);
  func_0x00709128(*(undefined4 *)(*_DAT_0124f7c4 + 0x5a0),1);
  cVar1 = func_0x012035ec(param_1);
  if (cVar1 != '\0') {
    if (((*(int *)(*_DAT_0124f9dc + 0x1c) == 2) || (*(int *)(*_DAT_0124f9dc + 0x1c) == 1)) ||
       (*(int *)(*_DAT_0124f9dc + 0x1c) == 3)) {
      uVar4 = 1;
    }
    else {
      uVar4 = 0;
    }
    func_0x00709244(*(undefined4 *)(param_1 + 0x574),uVar4);
    if ((*(int *)(*_DAT_0124f9dc + 0x1c) == 2) || (*(int *)(*_DAT_0124f9dc + 0x1c) == 1)) {
      uVar4 = 1;
    }
    else {
      uVar4 = 0;
    }
    func_0x00709244(*(undefined4 *)(param_1 + 0x4dc),uVar4);
    if ((*(int *)(*_DAT_0124f9dc + 0x1c) == 2) || (*(int *)(*_DAT_0124f9dc + 0x1c) == 1)) {
      uVar4 = 1;
    }
    else {
      uVar4 = 0;
    }
    func_0x00709244(*(undefined4 *)(param_1 + 0x57c),uVar4);
    if ((*(int *)(*_DAT_0124f9dc + 0x1c) == 2) || (*(int *)(*_DAT_0124f9dc + 0x1c) == 1)) {
      uVar4 = 1;
    }
    else {
      uVar4 = 0;
    }
    func_0x00709244(*(undefined4 *)(param_1 + 0x578),uVar4);
    if ((*(int *)(*_DAT_0124f9dc + 0x1c) == 2) || (*(int *)(*_DAT_0124f9dc + 0x1c) == 1)) {
      uVar4 = 1;
    }
    else {
      uVar4 = 0;
    }
    func_0x00709244(*(undefined4 *)(param_1 + 0x59c),uVar4);
    if ((*(int *)(*_DAT_0124f9dc + 0x1c) == 2) || (*(int *)(*_DAT_0124f9dc + 0x1c) == 1)) {
      uVar4 = 1;
    }
    else {
      uVar4 = 0;
    }
    func_0x00709244(*(undefined4 *)(param_1 + 0x5a0),uVar4);
    func_0x00709244(*(undefined4 *)(param_1 + 0x4e0),*(int *)(*_DAT_0124f9dc + 0x1c) == 2);
    if ((*(int *)(*_DAT_0124f9dc + 0x1c) == 2) || (*(int *)(*_DAT_0124f9dc + 0x1c) == 1)) {
      uVar4 = 1;
    }
    else {
      uVar4 = 0;
    }
    func_0x00709244(*(undefined4 *)(param_1 + 0x570),uVar4);
    func_0x00709244(*(undefined4 *)(param_1 + 0x4e4),*(int *)(*_DAT_0124f9dc + 0x1c) == 3);
    func_0x00709244(*(undefined4 *)(param_1 + 0x594),*(int *)(*_DAT_0124f9dc + 0x1c) == 3);
    func_0x00709244(*(undefined4 *)(param_1 + 0x5cc),0);
    func_0x00709244(*(undefined4 *)(param_1 + 0x5d0),0);
    uVar4 = *(undefined4 *)(param_1 + 0x4b4);
    iStack_18 = func_0x007091fc(uVar4);
    uVar5 = (undefined3)((uint)param_1 >> 8);
    if (-1 < iStack_18 + -1) {
      iStack_c = 0;
      do {
        uVar2 = func_0x0070920c(uVar4,iStack_c);
        func_0x00709128(uVar2,CONCAT31(uVar5,*(undefined1 *)(param_1 + 0x6f8)) ^ 1);
        iStack_c = iStack_c + 1;
        iStack_18 = iStack_18 + -1;
      } while (iStack_18 != 0);
    }
    func_0x00709128(*(undefined4 *)(param_1 + 0x568),*(undefined1 *)(param_1 + 0x6f9));
    uVar4 = *(undefined4 *)(*(int *)(param_1 + 0x54c) + 0x44);
    iStack_18 = func_0x007091fc(uVar4);
    if (-1 < iStack_18 + -1) {
      iStack_c = 0;
      do {
        iVar3 = func_0x0070920c(uVar4,iStack_c);
        if (0 < *(int *)(iVar3 + 0xc)) {
          uVar2 = func_0x0070920c(uVar4,iStack_c);
          func_0x00709128(uVar2,CONCAT31(uVar5,*(undefined1 *)(param_1 + 0x6f8)) ^ 1);
        }
        iStack_c = iStack_c + 1;
        iStack_18 = iStack_18 + -1;
      } while (iStack_18 != 0);
    }
    func_0x00709128(*(undefined4 *)(param_1 + 0x4dc),*(undefined1 *)(*_DAT_0124f9dc + 0x21));
    func_0x00709128(*(undefined4 *)(param_1 + 0x59c),*(undefined1 *)(*_DAT_0124f9dc + 0x21));
    func_0x00709128(*(undefined4 *)(param_1 + 0x57c),*(undefined1 *)(*_DAT_0124f9dc + 0x21));
    func_0x00709128(*(undefined4 *)(param_1 + 0x5a0),*(undefined1 *)(*_DAT_0124f9dc + 0x21));
    if ((*(char *)(*_DAT_0124f9dc + 0x22) == '\0') || (*(char *)(param_1 + 0x6f8) != '\0')) {
      uVar4 = 0;
    }
    else {
      uVar4 = 1;
    }
    func_0x00709128(*(undefined4 *)(param_1 + 0x614),uVar4);
    if (*(char *)(*_DAT_0124f9dc + 0x58) != '\0') {
      func_0x00709244(*(undefined4 *)(param_1 + 0x4c0),0);
      func_0x00709244(*(undefined4 *)(param_1 + 0x4c4),0);
    }
  }
  *(undefined1 *)(param_1 + 0x690) = 1;
  cVar1 = func_0x0120360c(param_1);
  if (cVar1 != '\0') {
    if (*(char *)(*_DAT_0124f9dc + 0x20) == '\0') {
      func_0x007b1014(*(undefined4 *)(param_1 + 0x544));
      func_0x011e0340();
    }
    else {
      (**(code **)(**(int **)(param_1 + 0x544) + 0x178))();
    }
    func_0x0117d870(param_1);
  }
  uStack_d = 0;
  if (*(int *)(param_1 + 0x48c) == 1) {
    func_0x0117c3e0(param_1,param_1);
  }
  else if (*(int *)(param_1 + 0x48c) == 2) {
    func_0x01185e1c(param_1);
    uStack_d = 1;
  }
  func_0x009a9728(_UResponsiveGUI__TResponsiveGUI,0,0);
  func_0x0117adbc(param_1,uStack_d);
  return;
}

