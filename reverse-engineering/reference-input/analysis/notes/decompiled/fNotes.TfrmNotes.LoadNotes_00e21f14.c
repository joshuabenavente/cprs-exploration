/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fNotes_TfrmNotes_LoadNotes(int param_1,byte param_2)

{
  undefined1 *puVar1;
  char cVar2;
  int *piVar3;
  int iVar4;
  uint uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  int iVar9;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 *puVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uStack_9c;
  undefined *puStack_98;
  undefined1 *puStack_94;
  undefined4 uStack_90;
  undefined *puStack_8c;
  undefined1 *puStack_88;
  undefined4 uStack_84;
  undefined *puStack_80;
  undefined1 *puStack_7c;
  undefined4 uStack_78;
  undefined *puStack_74;
  undefined1 *puStack_70;
  undefined4 uStack_6c;
  undefined *puStack_68;
  undefined1 *puStack_64;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined1 uStack_31;
  undefined4 uStack_30;
  byte bStack_2c;
  byte bStack_2b;
  undefined1 uStack_2a;
  byte bStack_29;
  undefined4 uStack_28;
  undefined4 uStack_24;
  int *piStack_20;
  int iStack_10;
  undefined1 auStack_c [8];
  
  puStack_64 = auStack_c + 8;
  uStack_50 = 0;
  uStack_4c = 0;
  uStack_48 = 0;
  uStack_44 = 0;
  uStack_40 = 0;
  uStack_3c = 0;
  uStack_38 = 0;
  uStack_24 = 0;
  uStack_28 = 0;
  puStack_68 = &UNK_00e22a43;
  uStack_6c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_6c;
  puVar1 = auStack_c + 8;
  bStack_29 = param_2;
  iStack_10 = param_1;
  if (param_1 == 0) {
    puStack_70 = (undefined1 *)0xe21f68;
    func_0x00435fa0(_System_SysUtils__Exception,1,&UNK_00e22a60);
    puStack_70 = (undefined1 *)0xe21f6d;
    func_0x0040a640();
    puVar1 = puStack_64;
  }
  puStack_64 = puVar1;
  puStack_70 = (undefined1 *)0xe21f7e;
  func_0x0040b40c(&uStack_28,*(undefined4 *)(iStack_10 + 0x970));
  uStack_30 = 0;
  uStack_31 = 1;
  puStack_74 = &UNK_00e229c4;
  uStack_78 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_78;
  bStack_2c = *(byte *)(iStack_10 + 0x98c);
  *(undefined1 *)(iStack_10 + 0x98c) = 0;
  uStack_2a = DAT_0125a165;
  DAT_0125a165 = 1;
  puStack_7c = (undefined1 *)0xe21fc5;
  puStack_70 = auStack_c + 8;
  func_0x0040afd4(&uStack_24);
  puStack_7c = (undefined1 *)0xe21fd1;
  piStack_20 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_80 = &UNK_00e2298d;
  uStack_84 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_84;
  puStack_88 = (undefined1 *)0xe21ff0;
  puStack_7c = auStack_c + 8;
  (**(code **)(**(int **)(iStack_10 + 0x91c) + 0x48))();
  puStack_88 = (undefined1 *)0xe21ffe;
  func_0x00608594(*(undefined4 *)(iStack_10 + 0x74c));
  puStack_88 = (undefined1 *)0xe2200c;
  func_0x00608594(*(undefined4 *)(iStack_10 + 0x4d8));
  puStack_8c = &UNK_00e22969;
  uStack_90 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_90;
  bStack_2b = bStack_29 ^ 1;
  puStack_88 = auStack_c + 8;
  if (bStack_2b != 0) {
    puStack_94 = (undefined1 *)0xe2203d;
    puStack_88 = auStack_c + 8;
    func_0x0066fcb4(*(undefined4 *)(*(int *)(iStack_10 + 0x4cc) + 0x330));
  }
  puStack_98 = &UNK_00e2282b;
  uStack_9c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_9c;
  puStack_94 = auStack_c + 8;
  piVar3 = (int *)func_0x007b1014(*(undefined4 *)(iStack_10 + 0x4dc));
  (**(code **)(*piVar3 + 0x48))();
  fNotes_TfrmNotes_ClearTVNotes(iStack_10);
  func_0x0067cfe0(*(undefined4 *)(*(int *)(iStack_10 + 0x4d8) + 0x2f4));
  (**(code **)(**(int **)(iStack_10 + 0x74c) + 400))();
  (**(code **)(**(int **)(iStack_10 + 0x74c) + 0xd8))();
  func_0x009fffc4(*(undefined4 *)(iStack_10 + 0x4c8),0);
  uVar10 = *(int *)(iStack_10 + 0x800) == 0;
  if (!(bool)uVar10) {
    func_0x0040b40c(&uStack_24,uStack_28);
  }
  func_0x0042cfdc(2,&uStack_38);
  func_0x0040c324(*(undefined4 *)(iStack_10 + 0x7f0),uStack_38);
  if (!(bool)uVar10) {
    if ((bStack_2c != 0) || (uVar10 = bStack_29 == 0, (bool)uVar10)) {
      rTIU_ListNotesForTree
                (piStack_20,2,0,&uStack_24,0,1,*(undefined1 *)(iStack_10 + 0x814),0,0,0,0,0,0);
      iVar4 = (**(code **)(*piStack_20 + 0x14))();
      uVar10 = iVar4 == 0;
      if (0 < iVar4) {
        func_0x00a0f8dc(*(undefined4 *)(iStack_10 + 0x91c),piStack_20,2,6,
                        *(undefined1 *)(iStack_10 + 0x814),*(undefined4 *)(iStack_10 + 0x810));
        (**(code **)(**(int **)(iStack_10 + 0x978) + 8))
                  (*(int **)(iStack_10 + 0x978),*(undefined4 *)(iStack_10 + 0x91c));
        uVar10 = *(int *)(iStack_10 + 0x824) == 0;
        if (!(bool)uVar10) {
          func_0x00e21a04(*(undefined4 *)(iStack_10 + 0x824));
        }
        func_0x00e1e6c8(iStack_10,*(undefined4 *)(iStack_10 + 0x91c),
                        *(undefined4 *)(iStack_10 + 0x4cc));
      }
      (**(code **)(*piStack_20 + 0x48))();
    }
    else {
      (**(code **)(**(int **)(iStack_10 + 0x91c) + 8))
                (*(int **)(iStack_10 + 0x91c),*(undefined4 *)(iStack_10 + 0x978));
      func_0x00e1e6c8(iStack_10,*(undefined4 *)(iStack_10 + 0x91c),
                      *(undefined4 *)(iStack_10 + 0x4cc));
    }
    (**(code **)(**(int **)(iStack_10 + 0x91c) + 0x48))();
  }
  func_0x0042cfdc(3,&uStack_3c);
  func_0x0040c324(*(undefined4 *)(iStack_10 + 0x7f0),uStack_3c);
  if (!(bool)uVar10) {
    if (bStack_29 == 0) {
      rTIU_ListNotesForTree
                (piStack_20,3,0,&uStack_24,0,1,*(undefined1 *)(iStack_10 + 0x814),0,0,0,0,0,0);
      iVar4 = (**(code **)(*piStack_20 + 0x14))();
      if (0 < iVar4) {
        func_0x00a0f8dc(*(undefined4 *)(iStack_10 + 0x91c),piStack_20,3,6,
                        *(undefined1 *)(iStack_10 + 0x814),*(undefined4 *)(iStack_10 + 0x810));
        (**(code **)(**(int **)(iStack_10 + 0x97c) + 8))
                  (*(int **)(iStack_10 + 0x97c),*(undefined4 *)(iStack_10 + 0x91c));
        if (*(int *)(iStack_10 + 0x824) != 0) {
          func_0x00e21a04(*(undefined4 *)(iStack_10 + 0x824));
        }
        func_0x00e1e6c8(iStack_10,*(undefined4 *)(iStack_10 + 0x91c),
                        *(undefined4 *)(iStack_10 + 0x4cc));
      }
      (**(code **)(*piStack_20 + 0x48))();
    }
    else {
      (**(code **)(**(int **)(iStack_10 + 0x91c) + 8))
                (*(int **)(iStack_10 + 0x91c),*(undefined4 *)(iStack_10 + 0x97c));
      func_0x00e1e6c8(iStack_10,*(undefined4 *)(iStack_10 + 0x91c),
                      *(undefined4 *)(iStack_10 + 0x4cc));
    }
    (**(code **)(*piStack_20 + 0x48))();
    (**(code **)(**(int **)(iStack_10 + 0x91c) + 0x48))();
  }
  if ((*(int *)(iStack_10 + 0x800) != 0 & bStack_2c) != 0) {
    func_0x0040b40c(&uStack_24,uStack_28);
  }
  uVar12 = *(undefined4 *)(iStack_10 + 0x7e4);
  uVar11 = *(undefined4 *)(iStack_10 + 0x7e0);
  uVar7 = *(undefined4 *)(iStack_10 + 0x7ec);
  uVar8 = *(undefined4 *)(iStack_10 + 0x7e8);
  uVar17 = *(undefined4 *)(iStack_10 + 0x7fc);
  uVar16 = *(undefined4 *)(iStack_10 + 0x7f8);
  uVar5 = (uint)*(byte *)(iStack_10 + 0x814);
  uVar15 = 1;
  puVar13 = &uStack_40;
  uVar14 = uStack_24;
  uVar6 = func_0x0042d238(*(undefined4 *)(iStack_10 + 0x7f0),0);
  rTIU_ListNotesForTree
            (piStack_20,uVar6,*(undefined4 *)(iStack_10 + 0x800),puVar13,uVar14,uVar15,uVar5,uVar16,
             uVar17,uVar8,uVar7,uVar11,uVar12);
  func_0x0040b40c(&uStack_24,uStack_40);
  uVar12 = *(undefined4 *)(iStack_10 + 0x810);
  uVar5 = (uint)*(byte *)(iStack_10 + 0x814);
  uVar11 = 6;
  uVar7 = func_0x0042d238(*(undefined4 *)(iStack_10 + 0x7f0),0);
  func_0x00a0f8dc(*(undefined4 *)(iStack_10 + 0x91c),piStack_20,uVar7,uVar11,uVar5);
  if (*(int *)(iStack_10 + 0x800) != 0) {
    func_0x0040b40c(&uStack_28,uStack_24);
  }
  if (*(int *)(iStack_10 + 0x824) == 0) {
    func_0x00e20ce4(iStack_10,iStack_10 + 2000,&uStack_44);
    func_0x009fffc4(*(undefined4 *)(iStack_10 + 0x4bc),uStack_44);
  }
  else {
    func_0x00e21a04(*(undefined4 *)(iStack_10 + 0x824));
  }
  if (bStack_29 == 0) {
    (**(code **)(**(int **)(iStack_10 + 0x974) + 8))
              (*(int **)(iStack_10 + 0x974),*(undefined4 *)(iStack_10 + 0x91c));
  }
  else {
    (**(code **)(**(int **)(iStack_10 + 0x974) + 0x44))
              (*(int **)(iStack_10 + 0x974),*(undefined4 *)(iStack_10 + 0x91c));
    (**(code **)(**(int **)(iStack_10 + 0x91c) + 8))
              (*(int **)(iStack_10 + 0x91c),*(undefined4 *)(iStack_10 + 0x974));
  }
  func_0x00a13394(*(undefined4 *)(iStack_10 + 0x91c));
  func_0x004d811c(*(undefined4 *)(iStack_10 + 0x91c),0);
  func_0x00a13484(*(undefined4 *)(iStack_10 + 0x91c),iStack_10 + 2000);
  func_0x00e1e6c8(iStack_10,*(undefined4 *)(iStack_10 + 0x91c),*(undefined4 *)(iStack_10 + 0x4cc));
  uVar5 = (uint)(*(int *)(iStack_10 + 0x810) != 0);
  iVar4 = (**(code **)(**(int **)(iStack_10 + 0x974) + 0x14))();
  iVar4 = iVar4 + -1;
  if (-1 < iVar4) {
    do {
      (**(code **)(**(int **)(iStack_10 + 0x974) + 0xc))
                (*(int **)(iStack_10 + 0x974),iVar4,&uStack_48);
      cVar2 = func_0x00a13b8c(uStack_48);
      if (cVar2 != '\0') {
        (**(code **)(**(int **)(iStack_10 + 0x974) + 0x4c))(*(int **)(iStack_10 + 0x974),iVar4);
        uVar5 = uVar5 + 1;
        if (1 < (int)uVar5) break;
      }
      iVar4 = iVar4 + -1;
    } while (iVar4 != -1);
  }
  DAT_0125a165 = 1;
  func_0x00a12328(*(undefined4 *)(iStack_10 + 0x4cc),iStack_10 + 2000);
  if ((bStack_2c != 0) || (bStack_29 == 0)) {
    if (*(int *)(iStack_10 + 0x924) != 0) {
      uVar7 = *(undefined4 *)(iStack_10 + 0x4cc);
      uVar8 = func_0x007b5f64(uVar7,*(undefined4 *)(iStack_10 + 0x924),1,0,0x5e);
      func_0x00672184(uVar7,uVar8);
    }
    if ((bStack_29 == 0) &&
       (iVar4 = func_0x0067213c(*(undefined4 *)(iStack_10 + 0x4cc)), iVar4 == 0)) {
      if ((*(int *)(iStack_10 + 0x810) == 0) && (*(char *)(iStack_10 + 0x820) == '\0')) {
        if (bStack_29 == 0) {
          iVar4 = func_0x007b5f64(*(undefined4 *)(iStack_10 + 0x4cc),
                                  *(undefined4 *)(iStack_10 + 0x7f0),1,0,0x5e);
          if (iVar4 != 0) {
            func_0x0066e014(iVar4,0);
          }
          uVar8 = 0x5e;
          uVar7 = 0;
          func_0x0042cfdc(2,&uStack_4c);
          iVar4 = func_0x007b5f64(*(undefined4 *)(iStack_10 + 0x4cc),uStack_4c,1,uVar7,uVar8);
          if (iVar4 == 0) {
            uVar8 = 0x5e;
            uVar7 = 0;
            func_0x0042cfdc(3,&uStack_50);
            iVar4 = func_0x007b5f64(*(undefined4 *)(iStack_10 + 0x4cc),uStack_50,1,uVar7,uVar8);
          }
          if (iVar4 == 0) {
            iVar4 = func_0x007b5f64(*(undefined4 *)(iStack_10 + 0x4cc),
                                    *(undefined4 *)(iStack_10 + 0x7f0),1,0,0x5e);
          }
          if (iVar4 != 0) {
            iVar9 = func_0x0066e3b0(iVar4);
            if (iVar9 == 0) {
              func_0x00672184(*(undefined4 *)(iStack_10 + 0x4cc),iVar4);
            }
            else {
              func_0x00672184(*(undefined4 *)(iStack_10 + 0x4cc),iVar9);
            }
            DAT_0125a165 = 0;
          }
        }
      }
      else {
        for (iVar4 = func_0x0066fb68(*(undefined4 *)(*(int *)(iStack_10 + 0x4cc) + 0x330));
            iVar4 != 0; iVar4 = func_0x0066e290(iVar4)) {
          func_0x0066e014(iVar4,0);
          func_0x00672184(*(undefined4 *)(iStack_10 + 0x4cc),iVar4);
        }
      }
    }
  }
  iVar4 = *(int *)(iStack_10 + 0x4d8);
  func_0x0068297c(iVar4,0);
  if (*(int *)(iStack_10 + 0x808) != 0) {
    _DAT_0125a160 = func_0x0040c4b0(*(undefined4 *)(iStack_10 + 0x808),&UNK_00e22abc,1);
    _DAT_0125a160 = _DAT_0125a160 + -1;
  }
  if (*(char *)(iStack_10 + 0x804) == '\0') {
    uVar7 = func_0x0067b704(*(undefined4 *)(iVar4 + 0x30c),1);
    func_0x0067b548(uVar7,(*(int *)(iVar4 + 0x58) / 5) * 2);
    uVar7 = func_0x0067b704(*(undefined4 *)(iVar4 + 0x30c),2);
    func_0x0067b548(uVar7,0);
  }
  else {
    uVar7 = func_0x0067b704(*(undefined4 *)(iVar4 + 0x30c),1);
    func_0x0067b548(uVar7,*(int *)(iVar4 + 0x58) / 5);
    func_0x0067b704(*(undefined4 *)(iVar4 + 0x30c),1);
    uVar7 = func_0x0067b46c();
    uVar8 = func_0x0067b704(*(undefined4 *)(iVar4 + 0x30c),2);
    func_0x0067b548(uVar8,uVar7);
  }
  *in_FS_OFFSET = uVar11;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e22832;
  if (bStack_2b != 0) {
    func_0x0066fd00(*(undefined4 *)(*(int *)(iStack_10 + 0x4cc) + 0x330),uVar11,uVar12);
  }
                    /* WARNING: Could not recover jumptable at 0x00e22829. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

