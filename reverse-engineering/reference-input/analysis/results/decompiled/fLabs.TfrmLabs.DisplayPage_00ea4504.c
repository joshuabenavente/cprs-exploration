/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fLabs_TfrmLabs_DisplayPage(int param_1)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  bool bVar5;
  undefined *puVar6;
  undefined *puVar7;
  undefined4 uVar8;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puVar9;
  undefined *puVar10;
  undefined4 uVar11;
  undefined *puVar12;
  undefined *puVar13;
  undefined *puVar14;
  undefined4 uStack_24;
  undefined *puStack_20;
  undefined1 *puStack_1c;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  uStack_c = 0;
  puStack_20 = &UNK_00ea4985;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  func_0x012034e8(param_1);
  iVar3 = *(int *)(*_DAT_0124f7c4 + 0x4c8);
  *(undefined4 *)(iVar3 + 0xc) = 9;
  func_0x00709128(iVar3,1);
  func_0x00709128(*(undefined4 *)(*_DAT_0124f7c4 + 0x5a0),1);
  (**(code **)(**(int **)(param_1 + 0x4f0) + 0x18c))(*(int **)(param_1 + 0x4f0),0);
  puVar14 = &UNK_00ea49a0;
  uVar2 = *(undefined4 *)(*_DAT_0124f2e0 + 0x10);
  puVar13 = &UNK_00ea4abc;
  puVar12 = &UNK_00ea4adc;
  uVar11 = *(undefined4 *)(*_DAT_0124f2e0 + 0x14);
  puVar10 = &UNK_00ea4abc;
  puVar9 = &UNK_00ea4b08;
  func_0x0042cfdc(*(undefined4 *)(*_DAT_0124f2e0 + 0x20),&uStack_c);
  puVar7 = &UNK_00ea4abc;
  puVar6 = &UNK_00ea4b3c;
  uVar8 = uStack_c;
  func_0x0040c214(&uStack_8,10);
  func_0x0040ba58(&DAT_0125a32c,uStack_8,0,puVar6,puVar7,uVar8,puVar9,puVar10,uVar11,puVar12,puVar13
                  ,uVar2,puVar14);
  DAT_0125a2ed = func_0x00c87c4c();
  bVar5 = DAT_0125a2ed == '\0';
  if (bVar5) {
    func_0x00ebd8f4(param_1,0);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x604),0);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x674),1);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x670),1);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x664),1);
  }
  else {
    func_0x0040c324(_DAT_0125a2c4,&UNK_00ea4b78);
    if (bVar5) {
      func_0x00ebd8f4(param_1,0);
    }
    else {
      func_0x00ebd8f4(param_1,0x1e);
    }
    func_0x006025b0(*(undefined4 *)(param_1 + 0x604),1);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x668),0);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x66c),0);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x674),0);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x670),0);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x660),0);
    func_0x006025b0(*(undefined4 *)(param_1 + 0x664),0);
  }
  cVar1 = func_0x012035ec(param_1);
  if (cVar1 != '\0') {
    func_0x0040afd4(&DAT_0125a2bc);
    func_0x0040afd4(0x125a2cc);
    func_0x00ea631c(param_1);
  }
  cVar1 = func_0x0120360c(param_1);
  if ((cVar1 != '\0') && (*(int *)(param_1 + 0x48c) != 2)) {
    func_0x0040afd4(&DAT_0125a2bc);
    if (*(char *)(*_DAT_0124f2e0 + 0x35) == '\0') {
      (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),4);
    }
    else {
      (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),2);
    }
    if ((DAT_0125a2f1 != '\0') && (0 < _DAT_0125a2f4)) {
      (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),_DAT_0125a2f4);
    }
    func_0x0068263c(*(undefined4 *)(param_1 + 0x5bc),_DAT_0125a330);
    func_0x0067cfe0(*(undefined4 *)(*(int *)(param_1 + 0x5bc) + 0x2f4));
    func_0x004d4e14(*(undefined4 *)(*(int *)(param_1 + 0x5bc) + 0x30c));
    func_0x006026fc(*(undefined4 *)(param_1 + 0x5e4),0);
    func_0x006026fc(*(undefined4 *)(param_1 + 0x5bc),0);
    (**(code **)(**(int **)(param_1 + 0x4f0) + 0xa0))
              (*(int **)(param_1 + 0x4f0),*(undefined4 *)(param_1 + 0x4e8));
    func_0x006015e8(*(undefined4 *)(param_1 + 0x4f0),5);
    (**(code **)(**(int **)(param_1 + 0x4f0) + 400))();
    func_0x0040afd4(&DAT_0125a2b8);
    (**(code **)(*_DAT_0125a2a8 + 0x48))();
    iVar3 = *(int *)(*(int *)(*_DAT_0124f294 + 8) + 8);
    if (-1 < iVar3 + -1) {
      iVar4 = 0;
      do {
        func_0x004d2ff0(*(undefined4 *)(*_DAT_0124f294 + 8),iVar4);
        func_0x011d700c();
        iVar4 = iVar4 + 1;
        iVar3 = iVar3 + -1;
      } while (iVar3 != 0);
    }
    func_0x009b60ec(0);
    iVar3 = func_0x0066f6b0(*(undefined4 *)(*(int *)(param_1 + 0x5c8) + 0x330));
    if (0 < iVar3) {
      iVar3 = *(int *)(param_1 + 0x5c8);
      uVar2 = func_0x0066fb68(*(undefined4 *)(iVar3 + 0x330));
      func_0x00672184(iVar3,uVar2);
      fLabs_TfrmLabs_tvReportsClick(param_1,param_1);
    }
  }
  if (*(int *)(param_1 + 0x48c) == 1) {
    cVar1 = func_0x0120360c(param_1);
    if (cVar1 == '\0') {
      if (*(char *)(*_DAT_0124f2e0 + 0x35) == '\0') {
        (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),4);
      }
      else {
        (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),2);
      }
      if ((DAT_0125a2f1 != '\0') && (0 < _DAT_0125a2f4)) {
        (**(code **)(**(int **)(param_1 + 0x670) + 0x170))(*(int **)(param_1 + 0x670),_DAT_0125a2f4)
        ;
      }
      func_0x0068263c(*(undefined4 *)(param_1 + 0x5bc),_DAT_0125a330);
      (**(code **)(**(int **)(param_1 + 0x674) + 0x178))();
      func_0x0068263c(*(undefined4 *)(param_1 + 0x5bc),_DAT_0125a330);
      func_0x0067cfe0(*(undefined4 *)(*(int *)(param_1 + 0x5bc) + 0x2f4));
      func_0x006025b0(*(undefined4 *)(param_1 + 0x5d0),0);
      func_0x006025b0(*(undefined4 *)(param_1 + 0x5cc),0);
      iVar3 = func_0x0066f6b0(*(undefined4 *)(*(int *)(param_1 + 0x5c8) + 0x330));
      if (0 < iVar3) {
        iVar3 = *(int *)(param_1 + 0x5c8);
        uVar2 = func_0x0066fb68(*(undefined4 *)(iVar3 + 0x330));
        func_0x00672184(iVar3,uVar2);
        fLabs_TfrmLabs_tvReportsClick(param_1,param_1);
      }
    }
  }
  else if (*(int *)(param_1 + 0x48c) == 2) {
    func_0x00eb2ebc(param_1);
  }
  *in_FS_OFFSET = puVar6;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00ea498c;
  func_0x0040b034(&uStack_c,2,uVar8);
                    /* WARNING: Could not recover jumptable at 0x00ea4983. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

