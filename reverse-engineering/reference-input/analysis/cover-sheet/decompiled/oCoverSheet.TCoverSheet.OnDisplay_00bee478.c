/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void oCoverSheet_TCoverSheet_OnDisplay(int param_1,undefined4 param_2,int param_3)

{
  int *piVar1;
  int **ppiVar2;
  char cVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int *in_FS_OFFSET;
  double dVar8;
  int iStack_88;
  undefined4 *puStack_84;
  int **UNRECOVERED_JUMPTABLE;
  int iStack_7c;
  undefined *puStack_78;
  undefined1 *puStack_74;
  int iStack_70;
  undefined *puStack_6c;
  undefined1 *puStack_68;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined1 uStack_40;
  int iStack_3c;
  undefined1 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  int iStack_2c;
  int iStack_28;
  int iStack_24;
  int *piStack_20;
  undefined4 uStack_1c;
  int iStack_18;
  int *piStack_14;
  int *piStack_10;
  int *piStack_c;
  undefined4 uStack_8;
  
  puStack_68 = (undefined1 *)((int)register0x00000010 + -4);
  puStack_74 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_4c = 0;
  uStack_34 = 0;
  uStack_48 = 0;
  uStack_8 = (int *)0x0;
  piStack_c = (int *)0x0;
  piStack_10 = (int *)0x0;
  piStack_14 = (int *)0x0;
  puStack_6c = &UNK_00bee966;
  iStack_70 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_70;
  puStack_78 = &UNK_00bee8e3;
  iStack_7c = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_7c;
  UNRECOVERED_JUMPTABLE = (int **)0xbee4c1;
  iStack_18 = param_3;
  uVar4 = (**(code **)(**(int **)(param_1 + 0x14) + 0x14))();
  UNRECOVERED_JUMPTABLE = (int **)0xbee4cb;
  (**(code **)(**(int **)(param_1 + 0x28) + 0x20))(*(int **)(param_1 + 0x28),uVar4);
  UNRECOVERED_JUMPTABLE = (int **)0xbee4d5;
  func_0x006025b0(iStack_18,0);
  UNRECOVERED_JUMPTABLE = (int **)0xbee4df;
  func_0x006015e8(iStack_18,0);
  UNRECOVERED_JUMPTABLE = (int **)0xbee4ea;
  func_0x004598c4(*(int *)(param_1 + 0x18) + 4);
  UNRECOVERED_JUMPTABLE = (int **)0xbee4f8;
  func_0x004d4e14(*(undefined4 *)(iStack_18 + 0x2f0));
  UNRECOVERED_JUMPTABLE = (int **)0xbee506;
  func_0x004d4e14(*(undefined4 *)(iStack_18 + 0x2e8));
  UNRECOVERED_JUMPTABLE = (int **)0xbee514;
  func_0x004d4e14(*(undefined4 *)(iStack_18 + 0x2ec));
  UNRECOVERED_JUMPTABLE = (int **)0xbee522;
  func_0x006bb1d4(*(undefined4 *)(iStack_18 + 0x2ec));
  while( true ) {
    iVar6 = *(int *)(iStack_18 + 0x2e8);
    UNRECOVERED_JUMPTABLE = (int **)0xbee543;
    iVar5 = (**(code **)(**(int **)(param_1 + 0x28) + 0x1c))();
    if (iVar5 <= *(int *)(*(int *)(iVar6 + 8) + 8)) break;
    UNRECOVERED_JUMPTABLE = (int **)0xbee532;
    func_0x006bb030(*(undefined4 *)(iStack_18 + 0x2e8));
  }
  UNRECOVERED_JUMPTABLE = *(int ***)(*(int *)(*(int *)(iStack_18 + 0x2e8) + 8) + 8);
  puStack_84 = (undefined4 *)0xbee56e;
  func_0x0040e9b8(param_1 + 0x1c,_DAT_00bedad0,1);
  iVar6 = *(int *)(*(int *)(*(int *)(iStack_18 + 0x2e8) + 8) + 8);
  if (-1 < iVar6 + -1) {
    iVar5 = 0;
    iStack_28 = iVar6;
    do {
      UNRECOVERED_JUMPTABLE = &piStack_20;
      puStack_84 = (undefined4 *)0xbee5a5;
      func_0x00bcd62c(iStack_18,1,1);
      puStack_84 = &uStack_34;
      iStack_88 = 0xbee5b6;
      func_0x00408ee4(*piStack_20,&uStack_48);
      uStack_44 = uStack_48;
      uStack_40 = 0x11;
      uStack_38 = 0;
      iStack_88 = 0xbee5d9;
      iStack_3c = iVar5;
      func_0x0042ef18(&UNK_00bee980,&uStack_44,1);
      iStack_88 = 0xbee5e4;
      (**(code **)(*piStack_20 + 0x28))(piStack_20,uStack_34);
      iStack_88 = 0xbee5f2;
      (**(code **)(*piStack_20 + 0xa0))(piStack_20,iStack_18);
      iStack_88 = iVar5;
      func_0x006bb684(*(undefined4 *)(iStack_18 + 0x2f0),piStack_20,0);
      func_0x00bcd77c(piStack_20,*(int *)(param_1 + 0x1c) + iVar5 * 4);
      iVar5 = iVar5 + 1;
      iStack_28 = iStack_28 + -1;
    } while (iStack_28 != 0);
  }
  UNRECOVERED_JUMPTABLE = (int **)0xbee626;
  iVar6 = (**(code **)(**(int **)(param_1 + 0x14) + 0x14))();
  if (-1 < iVar6 + -1) {
    iVar5 = 0;
    iStack_28 = iVar6;
    do {
      UNRECOVERED_JUMPTABLE = (int **)0xbee642;
      (**(code **)(**(int **)(param_1 + 0x14) + 0x10))(*(int **)(param_1 + 0x14),iVar5,&uStack_8);
      UNRECOVERED_JUMPTABLE = (int **)0xbee64c;
      uVar4 = (**(code **)(**(int **)(param_1 + 0x28) + 0x14))(*(int **)(param_1 + 0x28),iVar5);
      UNRECOVERED_JUMPTABLE = (int **)0xbee656;
      (**(code **)(*uStack_8 + 0x20))(uStack_8,uVar4);
      UNRECOVERED_JUMPTABLE = (int **)0xbee660;
      uVar4 = (**(code **)(**(int **)(param_1 + 0x28) + 0x10))(*(int **)(param_1 + 0x28),iVar5);
      UNRECOVERED_JUMPTABLE = (int **)0xbee66a;
      (**(code **)(*uStack_8 + 0x1c))(uStack_8,uVar4);
      UNRECOVERED_JUMPTABLE = (int **)0xbee675;
      uStack_30 = (**(code **)(*uStack_8 + 0x28))(uStack_8,iStack_18);
      UNRECOVERED_JUMPTABLE = (int **)0xbee68c;
      uStack_1c = uStack_30;
      func_0x004597a0(*(int *)(param_1 + 0x18) + 4,&uStack_30);
      UNRECOVERED_JUMPTABLE = (int **)0xbee694;
      uVar4 = func_0x00410738(&piStack_10);
      UNRECOVERED_JUMPTABLE = (int **)0xbee6a3;
      cVar3 = func_0x004091e8(uStack_1c,&UNK_00bee994,uVar4);
      if (cVar3 != '\0') {
        UNRECOVERED_JUMPTABLE = (int **)0xbee6b2;
        (**(code **)(*uStack_8 + 0x18))(uStack_8,&uStack_4c);
        UNRECOVERED_JUMPTABLE = (int **)0xbee6bd;
        (**(code **)(*piStack_10 + 0x44))(piStack_10,uStack_4c);
        UNRECOVERED_JUMPTABLE = (int **)0xbee6c7;
        (**(code **)(*piStack_10 + 0x30))(piStack_10,2);
        UNRECOVERED_JUMPTABLE = (int **)0xbee6d1;
        (**(code **)(*piStack_10 + 0x34))(piStack_10,1);
      }
      UNRECOVERED_JUMPTABLE = (int **)0xbee6d9;
      uVar4 = func_0x00410738(&piStack_c);
      UNRECOVERED_JUMPTABLE = (int **)0xbee6e8;
      cVar3 = func_0x00439820(uStack_1c,&UNK_00bee9a4,uVar4);
      if (cVar3 != '\0') {
        UNRECOVERED_JUMPTABLE = (int **)0xbee6f7;
        (**(code **)(*piStack_c + 0x28))(piStack_c,uStack_8);
      }
      UNRECOVERED_JUMPTABLE = (int **)0xbee6ff;
      uVar4 = func_0x00410738(&piStack_14);
      UNRECOVERED_JUMPTABLE = (int **)0xbee70e;
      cVar3 = func_0x00439820(uStack_1c,&UNK_00bee9b4,uVar4);
      if (cVar3 != '\0') {
        UNRECOVERED_JUMPTABLE = (int **)0xbee71f;
        (**(code **)(*piStack_14 + 0xc))(piStack_14,param_1,*(undefined4 *)(param_1 + 0x20));
        UNRECOVERED_JUMPTABLE = (int **)0xbee72d;
        (**(code **)(*piStack_14 + 0x14))(piStack_14,param_1,*(undefined1 *)(param_1 + 0x24));
      }
      while( true ) {
        UNRECOVERED_JUMPTABLE = (int **)0xbee753;
        iVar6 = (**(code **)(*uStack_8 + 0x14))();
        UNRECOVERED_JUMPTABLE = (int **)0xbee75e;
        iVar6 = (**(code **)(**(int **)(*(int *)(param_1 + 0x1c) + iVar6 * 4) + 0x10))();
        UNRECOVERED_JUMPTABLE = (int **)0xbee769;
        iVar7 = (**(code **)(*uStack_8 + 0x10))();
        if (iVar7 <= iVar6 + -1) break;
        UNRECOVERED_JUMPTABLE = (int **)0x40240000;
        puStack_84 = (undefined4 *)0x0;
        iStack_88 = 0xbee73e;
        iVar6 = (**(code **)(*uStack_8 + 0x14))();
        piVar1 = *(int **)(*(int *)(param_1 + 0x1c) + iVar6 * 4);
        UNRECOVERED_JUMPTABLE = (int **)0xbee74b;
        (**(code **)(*piVar1 + 0x3c))
                  (piVar1,CONCAT31((int3)((uint)*(int *)(param_1 + 0x1c) >> 8),1));
      }
      UNRECOVERED_JUMPTABLE = (int **)0x0;
      puStack_84 = (undefined4 *)0x5;
      iStack_88 = 0xbee779;
      iStack_88 = (**(code **)(*uStack_8 + 0x10))();
      iVar7 = (**(code **)(*uStack_8 + 0x14))();
      iVar6 = iStack_88;
      piVar1 = *(int **)(*(int *)(param_1 + 0x1c) + iVar7 * 4);
      iStack_88 = 0xbee791;
      (**(code **)(*piVar1 + 0x40))(piVar1,uStack_1c,iVar6);
      iVar5 = iVar5 + 1;
      iStack_28 = iStack_28 + -1;
    } while (iStack_28 != 0);
  }
  puStack_84 = (undefined4 *)&UNK_00bee8b5;
  iStack_88 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_88;
  UNRECOVERED_JUMPTABLE = (int **)((int)register0x00000010 + -4);
  (**(code **)(**(int **)(iStack_18 + 0x2e8) + 0x20))();
  iVar6 = *(int *)(*(int *)(*(int *)(iStack_18 + 0x2e8) + 8) + 8);
  if (-1 < iVar6 + -1) {
    iVar5 = 0;
    iStack_28 = iVar6;
    do {
      uVar4 = func_0x006bad98(*(undefined4 *)(iStack_18 + 0x2e8),iVar5);
      func_0x006bace8(uVar4,1);
      func_0x006bad98(*(undefined4 *)(iStack_18 + 0x2e8),iVar5);
      dVar8 = (double)(_DAT_00bee9c4 /
                      (float)*(int *)(*(int *)(*(int *)(iStack_18 + 0x2e8) + 8) + 8));
      func_0x006bacf8();
      iVar6 = (**(code **)(**(int **)(*(int *)(param_1 + 0x1c) + iVar5 * 4) + 0x10))();
      if (-1 < iVar6 + -1) {
        iStack_24 = 0;
        iStack_2c = iVar6;
        do {
          piVar1 = *(int **)(*(int *)(param_1 + 0x1c) + iVar5 * 4);
          (**(code **)(*piVar1 + 0x30))(piVar1,iStack_24,1,dVar8);
          iVar7 = (**(code **)(**(int **)(*(int *)(param_1 + 0x1c) + iVar5 * 4) + 0x10))();
          piVar1 = *(int **)(*(int *)(param_1 + 0x1c) + iVar5 * 4);
          iVar6 = *piVar1;
          (**(code **)(iVar6 + 0x2c))(piVar1,iStack_24,iVar6,(double)(_DAT_00bee9c4 / (float)iVar7))
          ;
          iStack_24 = iStack_24 + 1;
          iStack_2c = iStack_2c + -1;
        } while (iStack_2c != 0);
      }
      (**(code **)(**(int **)(*(int *)(param_1 + 0x1c) + iVar5 * 4) + 0x48))();
      iVar5 = iVar5 + 1;
      iStack_28 = iStack_28 + -1;
    } while (iStack_28 != 0);
  }
  ppiVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = iStack_88;
  UNRECOVERED_JUMPTABLE = (int **)&UNK_00bee8bc;
  iVar6 = **(int **)(iStack_18 + 0x2e8);
  puStack_84 = (undefined4 *)0xbee8b2;
  (**(code **)(iVar6 + 0x24))(*(int **)(iStack_18 + 0x2e8),iVar6,ppiVar2);
                    /* WARNING: Could not recover jumptable at 0x00bee8b3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

