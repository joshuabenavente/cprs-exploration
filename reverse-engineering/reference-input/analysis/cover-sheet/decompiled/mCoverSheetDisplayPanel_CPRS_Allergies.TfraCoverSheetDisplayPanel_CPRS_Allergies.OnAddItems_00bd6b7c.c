/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_Allergies_TfraCoverSheetDisplayPanel_CPRS_Allergies_OnAddItems
               (int param_1,undefined4 param_2)

{
  char cVar1;
  int *piVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_3c;
  undefined *puStack_38;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_30;
  undefined *puStack_2c;
  undefined1 *puStack_28;
  undefined4 uStack_24;
  undefined *puStack_20;
  undefined1 *puStack_1c;
  undefined4 uStack_8;
  
  puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  puStack_28 = (undefined1 *)((int)register0x00000010 + -4);
  iVar4 = 5;
  do {
    uStack_8 = 0;
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  puStack_20 = &UNK_00bd6d7a;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  puStack_2c = &UNK_00bd6d4e;
  uStack_30 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_30;
  UNRECOVERED_JUMPTABLE = (code *)0xbd6bc3;
  func_0x0067d074(*(undefined4 *)(*(int *)(param_1 + 0x34c) + 0x2f4));
  UNRECOVERED_JUMPTABLE = (code *)0xbd6bd6;
  piVar2 = (int *)func_0x004d5460(_System_Classes__TStringsEnumerator,1,param_2);
  puStack_38 = &UNK_00bd6d23;
  uStack_3c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_3c;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  while( true ) {
    iVar4 = (**(code **)(*(int *)piVar2[2] + 0x14))();
    if (iVar4 + -1 <= piVar2[1]) break;
    piVar2[1] = piVar2[1] + 1;
    func_0x004d54a4(piVar2,&uStack_8);
    uVar3 = func_0x00bcf770(_oDelimitedString__TDelimitedString,1,uStack_8,0x5e);
    iVar4 = func_0x0067ce80(*(undefined4 *)(*(int *)(param_1 + 0x34c) + 0x2f4));
    if (iVar4 == 0) {
      cVar1 = func_0x00bd0bd4(uVar3,1);
      if (cVar1 == '\0') {
        func_0x00bd3be0(param_1);
      }
      else {
        func_0x00bd36a0(param_1);
      }
    }
    iVar4 = func_0x0067cde0(*(undefined4 *)(*(int *)(param_1 + 0x34c) + 0x2f4));
    func_0x00bcf93c(uVar3,2,&puStack_20);
    func_0x009b2a68(puStack_20,0,&puStack_1c);
    func_0x0067c4d8(iVar4,puStack_1c);
    func_0x00bcf93c(uVar3,3,&puStack_28);
    func_0x009b2a68(puStack_28,0,&uStack_24);
    (**(code **)(**(int **)(iVar4 + 8) + 0x3c))(*(int **)(iVar4 + 8),uStack_24);
    func_0x00bcf93c(uVar3,4,&uStack_30);
    func_0x009b2a68(uStack_30,0,&puStack_2c);
    (**(code **)(**(int **)(iVar4 + 8) + 0x3c))(*(int **)(iVar4 + 8),puStack_2c);
    func_0x0067c5e0(iVar4,uVar3);
  }
  *in_FS_OFFSET = uStack_3c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bd6d2a;
  if (piVar2 != (int *)0x0) {
    puStack_38 = (undefined *)0xbd6d20;
    (**(code **)(*piVar2 + -4))(piVar2,1);
  }
                    /* WARNING: Could not recover jumptable at 0x00bd6d21. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

