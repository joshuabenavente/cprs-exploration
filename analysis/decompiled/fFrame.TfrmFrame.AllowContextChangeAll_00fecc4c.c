/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

char fFrame_TfrmFrame_AllowContextChangeAll(int param_1,undefined4 *param_2)

{
  short sVar1;
  char cVar2;
  uint uVar3;
  undefined4 uVar4;
  undefined3 uVar5;
  undefined4 *in_FS_OFFSET;
  bool bVar6;
  undefined4 uStack_1c;
  undefined *puStack_18;
  undefined1 *puStack_14;
  undefined1 uStack_e;
  char cStack_d;
  undefined4 *puStack_c;
  undefined4 uStack_8;
  
  puStack_14 = (undefined1 *)((int)register0x00000010 + -4);
  if (DAT_0125a6ec != '\0') {
    return '\0';
  }
  if ((((*(char *)(param_1 + 0x708) != '\0') || (*(char *)(param_1 + 0x6e3) != '\0')) ||
      (*(int *)(*_DAT_0124f2e0 + 4) == 0)) || (*(char *)(*(int *)(param_1 + 0x5d8) + 0x69) != '\0'))
  {
    return '\x01';
  }
  *(undefined1 *)(param_1 + 0x6db) = 1;
  puStack_18 = &UNK_00fecedc;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  cStack_d = '\x01';
  puStack_c = param_2;
  uStack_8 = param_1;
  cVar2 = func_0x00df72b8();
  if (((cVar2 != '\0') || (cVar2 = func_0x00aeaae4(), cVar2 != '\0')) ||
     (cVar2 = func_0x00fee064(uStack_8), cVar2 != '\0')) {
    func_0x0040b3c4(puStack_c,&UNK_00fecef8);
    cStack_d = '\0';
  }
  if (cStack_d != '\0') {
    cStack_d = func_0x01001e20(uStack_8,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = (**(code **)(*(int *)*_DAT_0124f59c + 0x1cc))((int *)*_DAT_0124f59c,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = (**(code **)(*(int *)*_DAT_0124ef68 + 0x1cc))((int *)*_DAT_0124ef68,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = (**(code **)(*(int *)*_DAT_0124e090 + 0x1cc))((int *)*_DAT_0124e090,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = (**(code **)(*(int *)*_DAT_0124e574 + 0x1cc))((int *)*_DAT_0124e574,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = (**(code **)(*(int *)*_DAT_0124f308 + 0x1cc))((int *)*_DAT_0124f308,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = (**(code **)(*(int *)*_DAT_0124ec3c + 0x1cc))((int *)*_DAT_0124ec3c,puStack_c);
  }
  if ((cStack_d != '\0') && (*_DAT_0124ed38 != 0)) {
    cStack_d = (**(code **)(*(int *)*_DAT_0124ed38 + 0x1cc))((int *)*_DAT_0124ed38,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = (**(code **)(*(int *)*_DAT_0124f35c + 0x1cc))((int *)*_DAT_0124f35c,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = (**(code **)(*(int *)*_DAT_0124e5b4 + 0x1cc))((int *)*_DAT_0124e5b4,puStack_c);
  }
  if (cStack_d != '\0') {
    cStack_d = func_0x00c7e104(*_DAT_0124f278,puStack_c);
  }
  if (((*(char *)(*_DAT_0124f9dc + 0x56) == '\0') && (cStack_d != '\0')) &&
     (cVar2 = func_0x011d641c(*_DAT_0124f8dc), cVar2 != '\0')) {
    uVar3 = func_0x01004894(uStack_8);
    sVar1 = *(short *)(_DAT_0124fbe0 + (uVar3 & 0x7f) * 2);
    if (sVar1 == 0x30) {
      uVar4 = func_0x00febee8(uStack_8);
      bVar6 = (char)uVar4 == '\0';
      if ((!bVar6) || (uVar4 = func_0x0040c324(*puStack_c,&UNK_00fecf70), bVar6)) {
        uVar5 = (undefined3)((uint)uVar4 >> 8);
        uStack_e = 1;
      }
      else {
        uStack_e = 0;
        uVar5 = 0;
      }
      cStack_d = func_0x00fb7f60(CONCAT31(uVar5,uStack_e),0);
    }
    else if (sVar1 == 0x31) {
      cVar2 = func_0x011d641c(*_DAT_0124f8dc);
      if (cVar2 == '\0') {
        cStack_d = '\x01';
      }
      else {
        func_0x0040b3c4(puStack_c,&UNK_00fecf28);
        cStack_d = '\0';
      }
    }
  }
  *in_FS_OFFSET = uStack_1c;
  *(undefined1 *)(uStack_8 + 0x6db) = 0;
  return cStack_d;
}

