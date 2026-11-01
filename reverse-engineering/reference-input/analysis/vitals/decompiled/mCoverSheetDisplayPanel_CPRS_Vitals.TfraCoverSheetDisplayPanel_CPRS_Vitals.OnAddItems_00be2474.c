/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: stack */

void mCoverSheetDisplayPanel_CPRS_Vitals_TfraCoverSheetDisplayPanel_CPRS_Vitals_OnAddItems
               (int param_1)

{
  bool bVar1;
  code *pcVar2;
  float10 fVar3;
  float10 fVar4;
  float10 fVar5;
  float10 fVar6;
  float10 fVar7;
  float10 fVar8;
  char cVar9;
  undefined4 uVar10;
  int iVar11;
  int iVar12;
  undefined4 unaff_EBX;
  undefined4 *in_FS_OFFSET;
  float10 in_ST0;
  float10 fVar13;
  float10 in_ST1;
  float10 in_ST2;
  float10 in_ST3;
  float10 in_ST4;
  float10 in_ST5;
  float10 in_ST6;
  float10 in_ST7;
  undefined4 uVar14;
  undefined *puStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  code *UNRECOVERED_JUMPTABLE;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined8 uStack_2c;
  undefined4 uStack_24;
  int *piStack_20;
  int *piStack_1c;
  int *piStack_18;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  piStack_18 = (int *)((int)register0x00000010 + -4);
  iVar12 = 8;
  do {
    uStack_8 = 0;
    iVar12 = iVar12 + -1;
  } while (iVar12 != 0);
  piStack_1c = (int *)&UNK_00be271b;
  piStack_20 = (int *)*in_FS_OFFSET;
  *in_FS_OFFSET = &piStack_20;
  uStack_24 = (undefined1 *)0xbe24a1;
  iVar12 = (*pcRam00000014)();
  if (iVar12 == 0) {
    uStack_24 = (undefined1 *)0xbe24b2;
    (**(code **)(*piStack_18 + 0x3c))(piStack_18,&UNK_00be2734);
  }
  uStack_2c = (double)CONCAT44(&UNK_00be26ea,*in_FS_OFFSET);
  *in_FS_OFFSET = &uStack_2c;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xbe24d4;
  uStack_24 = (undefined1 *)((int)register0x00000010 + -4);
  func_0x0067d074(*(undefined4 *)(*(int *)(param_1 + 0x34c) + 0x2f4));
  piStack_1c = (int *)0x0;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xbe24e8;
  piStack_1c = (int *)func_0x004d5460(_System_Classes__TStringsEnumerator,1,piStack_18);
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00be26b7;
  uStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_38;
  UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
  do {
    piStack_20 = piStack_1c;
    uStack_3c = 0xbe2682;
    iVar12 = (**(code **)(*(int *)piStack_1c[2] + 0x14))();
    bVar1 = piStack_20[1] < iVar12 + -1;
    uStack_24 = (undefined1 *)CONCAT13(bVar1,(undefined3)uStack_24);
    if (!bVar1) {
      *in_FS_OFFSET = uStack_38;
      UNRECOVERED_JUMPTABLE_00 = (code *)&UNK_00be26be;
      if (piStack_1c != (int *)0x0) {
        UNRECOVERED_JUMPTABLE = (code *)0xbe26b4;
        (**(code **)(*piStack_1c + -4))(piStack_1c,1);
      }
                    /* WARNING: Could not recover jumptable at 0x00be26b5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
      return;
    }
    piStack_20[1] = piStack_20[1] + 1;
    uStack_3c = 0xbe250f;
    func_0x004d54a4(piStack_1c,(int)register0x00000010 + -0x10);
    uStack_3c = 0x5e;
    uStack_40 = 0xbe2520;
    uVar10 = func_0x00bcf770(_oDelimitedString__TDelimitedString,1,unaff_EBX);
    uStack_40 = 0xbe2536;
    iVar12 = func_0x0067ce80(*(undefined4 *)(*(int *)(param_1 + 0x34c) + 0x2f4));
    fVar13 = in_ST0;
    fVar3 = in_ST1;
    fVar4 = in_ST2;
    fVar5 = in_ST3;
    fVar6 = in_ST4;
    fVar7 = in_ST5;
    fVar8 = in_ST6;
    if (iVar12 == 0) {
      uStack_40 = 0xbe2546;
      cVar9 = func_0x00bd0bd4(uVar10,1);
      fVar13 = in_ST0;
      fVar3 = in_ST1;
      fVar4 = in_ST2;
      fVar5 = in_ST3;
      fVar6 = in_ST4;
      fVar7 = in_ST5;
      fVar8 = in_ST6;
      if (cVar9 != '\0') {
        uStack_40 = 0xbe2552;
        iVar12 = (**(code **)(*piStack_18 + 0x14))();
        fVar13 = in_ST0;
        fVar3 = in_ST1;
        fVar4 = in_ST2;
        fVar5 = in_ST3;
        fVar6 = in_ST4;
        fVar7 = in_ST5;
        fVar8 = in_ST6;
        if (iVar12 == 1) {
          uStack_40 = 0xbe255d;
          func_0x00bd36a0(param_1);
          uStack_40 = 0xbe2562;
          func_0x0040a734();
          uStack_40 = 0xbe2567;
          func_0x0040a734();
          pcVar2 = UNRECOVERED_JUMPTABLE;
          *in_FS_OFFSET = uStack_3c;
          UNRECOVERED_JUMPTABLE = (code *)&UNK_00be2722;
          uStack_38 = 0xbe270b;
          func_0x0040b034(&puStack_44,6,pcVar2);
          uStack_38 = 0xbe2718;
          func_0x0040b034((int)register0x00000010 + -0x10,3);
                    /* WARNING: Could not recover jumptable at 0x00be2719. Too many branches */
                    /* WARNING: Treating indirect jump as call */
          (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
          return;
        }
      }
    }
    in_ST6 = in_ST7;
    in_ST5 = fVar8;
    in_ST4 = fVar7;
    in_ST3 = fVar6;
    in_ST2 = fVar5;
    in_ST1 = fVar4;
    in_ST0 = fVar3;
    uStack_40 = 0xbe2580;
    iVar11 = func_0x0067cde0(*(undefined4 *)(*(int *)(param_1 + 0x34c) + 0x2f4));
    uStack_40 = 0xbe2591;
    func_0x00bcf93c(uVar10,2,&UNRECOVERED_JUMPTABLE_00);
    uStack_40 = 0xbe259b;
    func_0x0067c4d8(iVar11,UNRECOVERED_JUMPTABLE_00);
    uStack_40 = 0xbe25aa;
    func_0x00bcf93c(uVar10,5,&uStack_38);
    uStack_40 = uStack_38;
    puStack_44 = &UNK_00be2764;
    func_0x00bcf93c(uVar10,6,&uStack_3c);
    uVar14 = uStack_3c;
    func_0x0040c214(&UNRECOVERED_JUMPTABLE,3);
    iVar12 = **(int **)(iVar11 + 8);
    (**(code **)(iVar12 + 0x3c))(*(int **)(iVar11 + 8),UNRECOVERED_JUMPTABLE,iVar12,uVar14);
    func_0x00bcfee8(uVar10,4,0,0,0);
    uStack_2c = (double)fVar13;
    in_ST7 = in_ST6;
    func_0x00432550(&UNK_00be2774,_DAT_0124f788,&uStack_40,uStack_2c);
    (**(code **)(**(int **)(iVar11 + 8) + 0x3c))(*(int **)(iVar11 + 8),uStack_40);
    func_0x00bcf93c(uVar10,7,&uStack_8);
    func_0x00bcf93c(uVar10,8,&uStack_c);
    func_0x0042c5fc(uStack_c,&puStack_44);
    if (puStack_44 != (undefined *)0x0) {
      func_0x0040c214(&uStack_8,3);
    }
    (**(code **)(**(int **)(iVar11 + 8) + 0x3c))(*(int **)(iVar11 + 8),uStack_8);
    uStack_3c = 0xbe2671;
    func_0x0067c5e0(iVar11,uVar10);
  } while( true );
}

