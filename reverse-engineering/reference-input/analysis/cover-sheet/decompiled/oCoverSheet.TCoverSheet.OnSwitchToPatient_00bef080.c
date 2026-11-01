/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void oCoverSheet_TCoverSheet_OnSwitchToPatient(int param_1,undefined4 param_2,int param_3)

{
  code *pcVar1;
  char cVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_b0;
  undefined *puStack_ac;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_a4;
  undefined *puStack_a0;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_98;
  undefined *puStack_94;
  undefined1 *puStack_90;
  undefined4 uStack_8c;
  undefined *puStack_88;
  undefined1 *puStack_84;
  code *pcStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  int *piStack_68;
  undefined4 uStack_64;
  int *piStack_60;
  undefined4 uStack_5c;
  int iStack_58;
  undefined1 uStack_54;
  undefined4 uStack_50;
  undefined1 uStack_4c;
  undefined4 uStack_48;
  undefined1 uStack_44;
  int iStack_40;
  int *piStack_30;
  int iStack_20;
  int *piStack_1c;
  int *piStack_18;
  undefined4 uStack_14;
  int *piStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_6c = 0;
  uStack_5c = 0;
  uStack_64 = 0;
  piStack_68 = (int *)0x0;
  piStack_60 = (int *)0x0;
  piStack_10 = (int *)0x0;
  uStack_14 = 0;
  piStack_18 = (int *)0x0;
  uStack_c = 0;
  piStack_1c = (int *)0x0;
  puStack_84 = (undefined1 *)0xbef0b7;
  iStack_20 = param_1;
  uStack_8 = param_3;
  func_0x0040b0c8(param_3);
  puStack_88 = &UNK_00bef538;
  uStack_8c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_8c;
  puStack_94 = &UNK_00bef4a4;
  uStack_98 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_98;
  if (uStack_8 != 0) {
    UNRECOVERED_JUMPTABLE = (code *)&uStack_c;
    puStack_a0 = (undefined *)0x0;
    uStack_a4 = 0;
    iStack_58 = uStack_8;
    uStack_54 = 0x11;
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbef0f7;
    puStack_90 = (undefined1 *)((int)register0x00000010 + -4);
    puStack_84 = (undefined1 *)((int)register0x00000010 + -4);
    func_0x00bf0108(&piStack_60);
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbef102;
    (**(code **)(*piStack_60 + 0x20))(piStack_60,&uStack_5c);
    uStack_50 = uStack_5c;
    uStack_4c = 0x11;
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbef114;
    func_0x00bf0108(&piStack_68);
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbef11f;
    (**(code **)(*piStack_68 + 0x1c))(piStack_68,&uStack_64);
    uStack_48 = uStack_64;
    uStack_44 = 0x11;
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbef13b;
    ORNet_CallVistA(&UNK_00bef554,&iStack_58,2);
    piStack_1c = (int *)0x0;
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbef14e;
    (**(code **)(**(int **)(iStack_20 + 0x14) + 0x20))(*(int **)(iStack_20 + 0x14),&piStack_1c);
    puStack_ac = &UNK_00bef1ef;
    uStack_b0 = *in_FS_OFFSET;
    *in_FS_OFFSET = &uStack_b0;
    UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
    while( true ) {
      cVar2 = (**(code **)(*piStack_1c + 0x10))();
      pcVar1 = UNRECOVERED_JUMPTABLE_00;
      if (cVar2 == '\0') break;
      (**(code **)(*piStack_1c + 0xc))(piStack_1c,&uStack_14);
      uVar3 = func_0x00410738(&piStack_18);
      cVar2 = func_0x004397f8(uStack_14,&UNK_00bef56c,uVar3);
      if (cVar2 != '\0') {
        uVar3 = (**(code **)(*piStack_18 + 0xc))();
        func_0x0042cfdc(uVar3,&uStack_6c);
        iVar4 = func_0x0040c4b0(uStack_6c,uStack_c,1);
        (**(code **)(*piStack_18 + 100))(piStack_18,iVar4 == 0);
        (**(code **)(*piStack_18 + 0x60))(piStack_18,&pcStack_74);
        (*pcStack_74)(uStack_70,iStack_20);
      }
    }
    *in_FS_OFFSET = uStack_b0;
    UNRECOVERED_JUMPTABLE_00 = (code *)&UNK_00bef1f6;
    puStack_ac = (undefined *)0xbef1ec;
    func_0x00410738(&piStack_1c,uStack_b0,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00bef1ed. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
    return;
  }
  piStack_30 = (int *)0x0;
  UNRECOVERED_JUMPTABLE = (code *)0xbef40a;
  puStack_90 = (undefined1 *)((int)register0x00000010 + -4);
  puStack_84 = (undefined1 *)((int)register0x00000010 + -4);
  piStack_30 = (int *)func_0x0061782c(_Vcl_Controls___System_Generics_Collections_TList<Vcl_Controls_TControl>_TEnumerator
                                      ,1,*(undefined4 *)(iStack_20 + 0x18));
  puStack_a0 = &UNK_00bef493;
  uStack_a4 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_a4;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  while( true ) {
    if (*(int *)(piStack_30[1] + 8) + -1 <= piStack_30[2]) break;
    piStack_30[2] = piStack_30[2] + 1;
    iStack_40 = piStack_30[1];
    uVar3 = *(undefined4 *)(*(int *)(iStack_40 + 4) + piStack_30[2] * 4);
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbef440;
    uVar5 = func_0x00410738(&piStack_10);
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbef44e;
    cVar2 = func_0x00439820(uVar3,&UNK_00bef57c,uVar5);
    if (cVar2 != '\0') {
      UNRECOVERED_JUMPTABLE_00 = (code *)0xbef45d;
      (**(code **)(*piStack_10 + 0x38))(piStack_10,iStack_20);
    }
  }
  *in_FS_OFFSET = uStack_a4;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bef49a;
  if (piStack_30 != (int *)0x0) {
    puStack_a0 = (undefined *)0xbef490;
    (**(code **)(*piStack_30 + -4))(piStack_30,1);
  }
                    /* WARNING: Could not recover jumptable at 0x00bef491. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

