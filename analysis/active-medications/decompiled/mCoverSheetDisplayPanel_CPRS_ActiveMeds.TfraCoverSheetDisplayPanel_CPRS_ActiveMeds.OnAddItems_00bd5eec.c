/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_ActiveMeds_TfraCoverSheetDisplayPanel_CPRS_ActiveMeds_OnAddItems
               (int *param_1,int *param_2)

{
  char cVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_68;
  undefined4 uStack_64;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined1 *puStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined1 *puStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined1 *puStack_3c;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  undefined1 uStack_1d;
  int *piStack_1c;
  int *piStack_18;
  undefined4 uStack_14;
  int *piStack_10;
  int *piStack_c;
  undefined4 uStack_8;
  
  puStack_3c = (undefined1 *)((int)register0x00000010 + -4);
  uStack_2c = 0;
  uStack_30 = 0;
  uStack_24 = 0;
  uStack_28 = 0;
  uStack_8 = 0;
  uStack_40 = 0xbd613e;
  uStack_44 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_44;
  puStack_48 = (undefined1 *)0xbd5f2d;
  piStack_10 = param_2;
  piStack_c = param_1;
  func_0x0067d074(*(undefined4 *)(param_1[0xd3] + 0x2f4));
  uStack_4c = 0xbd6112;
  uStack_50 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_50;
  puStack_54 = (undefined1 *)0xbd5f4f;
  puStack_48 = (undefined1 *)((int)register0x00000010 + -4);
  (**(code **)(*piStack_c + 0x21c))(piStack_c,piStack_c[0xd3]);
  puStack_54 = (undefined1 *)0xbd5f5b;
  uStack_14 = func_0x004d81f4(_System_Classes__TStringList,1);
  uStack_58 = 0xbd60e7;
  uStack_5c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_5c;
  UNRECOVERED_JUMPTABLE = (code *)0xbd5f77;
  puStack_54 = (undefined1 *)((int)register0x00000010 + -4);
  rMeds_ExtractActiveMeds(uStack_14,piStack_10);
  piStack_18 = (int *)0x0;
  UNRECOVERED_JUMPTABLE = (code *)0xbd5f8b;
  piStack_18 = (int *)func_0x004d5460(_System_Classes__TStringsEnumerator,1,uStack_14);
  uStack_64 = 0xbd60c3;
  uStack_68 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_68;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  do {
    piStack_1c = piStack_18;
    iVar3 = (**(code **)(*(int *)piStack_18[2] + 0x14))();
    uStack_1d = piStack_1c[1] < iVar3 + -1;
    if (!(bool)uStack_1d) {
      *in_FS_OFFSET = uStack_68;
      UNRECOVERED_JUMPTABLE = (code *)0xbd60ca;
      if (piStack_18 != (int *)0x0) {
        uStack_64 = 0xbd60c0;
        (**(code **)(*piStack_18 + -4))(piStack_18,1);
      }
                    /* WARNING: Could not recover jumptable at 0x00bd60c1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
      return;
    }
    piStack_1c[1] = piStack_1c[1] + 1;
    func_0x004d54a4(piStack_18,&uStack_8);
    uVar2 = func_0x00bcf770(_oDelimitedString__TDelimitedString,1,uStack_8,0x5e);
    iVar3 = func_0x0067ce80(*(undefined4 *)(piStack_c[0xd3] + 0x2f4));
    if (iVar3 == 0) {
      cVar1 = func_0x00bd0338(uVar2,1,0xbd6158,1);
      if (cVar1 != '\0') {
        iVar3 = (**(code **)(*piStack_10 + 0x14))();
        if (iVar3 == 1) {
          func_0x00bd36a0(piStack_c);
          goto LAB_00bd6011;
        }
      }
      func_0x00bd3be0(piStack_c);
    }
LAB_00bd6011:
    iVar3 = func_0x0067cde0(*(undefined4 *)(piStack_c[0xd3] + 0x2f4));
    func_0x00bcf93c(uVar2,2,&uStack_28);
    func_0x009b2a68(uStack_28,0,&uStack_24);
    func_0x0067c4d8(iVar3,uStack_24);
    func_0x00bcf93c(uVar2,4,&uStack_30);
    func_0x009b2a68(uStack_30,0,&uStack_2c);
    (**(code **)(**(int **)(iVar3 + 8) + 0x3c))(*(int **)(iVar3 + 8),uStack_2c);
    func_0x0067c5e0(iVar3,uVar2);
  } while( true );
}

