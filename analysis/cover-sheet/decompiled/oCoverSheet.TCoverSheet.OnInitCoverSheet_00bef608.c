/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void oCoverSheet_TCoverSheet_OnInitCoverSheet(void)

{
  undefined4 uVar1;
  int *piVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_50;
  undefined *puStack_4c;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined *puStack_38;
  undefined1 *puStack_34;
  undefined4 uStack_30;
  int *piStack_2c;
  int *piStack_28;
  undefined4 uStack_24;
  int *piStack_20;
  int *piStack_1c;
  int iStack_c;
  undefined4 uStack_8;
  
  piStack_1c = (int *)((int)register0x00000010 + -4);
  iVar4 = 5;
  do {
    uStack_8 = 0;
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  piStack_20 = (int *)&UNK_00befa69;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  piStack_28 = (int *)0xbef634;
  uVar1 = func_0x004d81f4(_System_Classes__TStringList,1);
  piStack_28 = (int *)0xbef63f;
  func_0x00bf0108(&piStack_20);
  piStack_28 = (int *)0xbef64a;
  (**(code **)(*piStack_20 + 0x18))(piStack_20,&piStack_1c);
  piStack_28 = (int *)0xbef652;
  (**(code **)(*piStack_1c + 0x1c))();
  piStack_2c = (int *)&UNK_00befa1a;
  uStack_30 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_30;
  puStack_38 = &UNK_00bef9d1;
  uStack_3c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_3c;
  uStack_44 = 0;
  UNRECOVERED_JUMPTABLE = (code *)0xbef684;
  uStack_40 = uVar1;
  puStack_34 = (undefined1 *)((int)register0x00000010 + -4);
  piStack_28 = (int *)((int)register0x00000010 + -4);
  ORNet_CallVistA(&UNK_00befa84,&piStack_20,0xffffffff);
  UNRECOVERED_JUMPTABLE = (code *)0xbef698;
  piVar2 = (int *)func_0x004d5460(_System_Classes__TStringsEnumerator,1,uVar1);
  puStack_4c = &UNK_00bef9c0;
  uStack_50 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_50;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  do {
    iVar4 = (**(code **)(*(int *)piVar2[2] + 0x14))();
    if (iVar4 + -1 <= piVar2[1]) {
      *in_FS_OFFSET = uStack_50;
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00bef9c7;
      if (piVar2 != (int *)0x0) {
        puStack_4c = (undefined *)0xbef9bd;
        (**(code **)(*piVar2 + -4))(piVar2,1);
      }
                    /* WARNING: Could not recover jumptable at 0x00bef9be. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
      return;
    }
    piVar2[1] = piVar2[1] + 1;
    func_0x004d54a4(piVar2,&uStack_8);
    iVar4 = func_0x0040c4b0(&UNK_00befac0,uStack_8,1);
    func_0x0040c35c(uStack_8,1,iVar4 + -1,&uStack_24);
    iVar4 = func_0x0042d238(uStack_24,0);
    if (iVar4 < 0x47) {
      if (iVar4 == 0x46) {
        uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_Vitals__TCoverSheetParam_CPRS_Vitals,1,
                                uStack_8);
        uVar3 = func_0x00410738(&iStack_c);
        func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
      }
      else if (iVar4 < 0x29) {
        if (iVar4 == 0x28) {
          uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_ActiveMeds__TCoverSheetParam_CPRS_ActiveMeds
                                  ,1,uStack_8);
          uVar3 = func_0x00410738(&iStack_c);
          func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
        }
        else if (iVar4 == 10) {
          uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_ProblemList__TCoverSheetParam_CPRS_ProblemList
                                  ,1,uStack_8);
          uVar3 = func_0x00410738(&iStack_c);
          func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
        }
        else if (iVar4 == 0x14) {
          uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_Allergies__TCoverSheetParam_CPRS_Allergies,
                                  1,uStack_8);
          uVar3 = func_0x00410738(&iStack_c);
          func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
        }
        else {
          if (iVar4 != 0x1e) goto LAB_00bef95a;
          uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_Postings__TCoverSheetParam_CPRS_Postings,1,
                                  uStack_8);
          uVar3 = func_0x00410738(&iStack_c);
          func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
        }
      }
      else if (iVar4 == 0x32) {
        uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_Reminders__TCoverSheetParam_CPRS_Reminders,1,
                                uStack_8);
        uVar3 = func_0x00410738(&iStack_c);
        func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
      }
      else {
        if (iVar4 != 0x3c) goto LAB_00bef95a;
        uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_Labs__TCoverSheetParam_CPRS_Labs,1,uStack_8);
        uVar3 = func_0x00410738(&iStack_c);
        func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
      }
    }
    else if (iVar4 < 100) {
      if (iVar4 == 99) {
        uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_WH__TCoverSheetParam_CPRS_WH,1,uStack_8);
        uVar3 = func_0x00410738(&iStack_c);
        func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
      }
      else if (iVar4 == 0x50) {
        uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_Appts__TCoverSheetParam_CPRS_Appts,1,uStack_8
                               );
        uVar3 = func_0x00410738(&iStack_c);
        func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
      }
      else {
        if (iVar4 != 0x5a) goto LAB_00bef95a;
        uVar1 = func_0x00bd5758(_oCoverSheetParam_CPRS_Immunizations__TCoverSheetParam_CPRS_Immunizations
                                ,1,uStack_8);
        uVar3 = func_0x00410738(&iStack_c);
        func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
      }
    }
    else if (iVar4 == 1000) {
      uVar1 = func_0x00bec394(_oCoverSheetParam_WidgetClock__TCoverSheetParam_WidgetClock,1,uStack_8
                             );
      uVar3 = func_0x00410738(&iStack_c);
      func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
    }
    else if (iVar4 == 0x3e9) {
      uVar1 = func_0x00bed054(_oCoverSheetParam_Web__TCoverSheetParam_Web,1,uStack_8);
      uVar3 = func_0x00410738(&iStack_c);
      func_0x004091e8(uVar1,&UNK_00befac4,uVar3);
    }
    else {
LAB_00bef95a:
      func_0x00410738(&iStack_c);
    }
    if (iStack_c != 0) {
      func_0x00bf0108(&piStack_2c);
      (**(code **)(*piStack_2c + 0x18))(piStack_2c,&piStack_28);
      (**(code **)(*piStack_28 + 0x18))(piStack_28,iStack_c);
    }
  } while( true );
}

