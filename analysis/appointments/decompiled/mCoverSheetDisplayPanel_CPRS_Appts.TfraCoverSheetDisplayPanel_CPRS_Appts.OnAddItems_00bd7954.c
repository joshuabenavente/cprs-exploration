/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_Appts_TfraCoverSheetDisplayPanel_CPRS_Appts_OnAddItems
               (int param_1,int *param_2)

{
  code *pcVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_78;
  undefined4 uStack_74;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_6c;
  undefined4 uStack_68;
  undefined4 uStack_64;
  undefined1 *puStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined1 *puStack_54;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 auStack_30 [7];
  undefined4 uStack_14;
  int *piStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  puStack_54 = (undefined1 *)(auStack_30 + 0xb);
  uStack_44 = 0;
  uStack_48 = 0;
  uStack_3c = 0;
  uStack_40 = 0;
  uStack_38 = 0;
  uStack_34 = 0;
  auStack_30[0] = 0;
  uStack_8 = 0;
  uStack_58 = 0xbd7c1d;
  uStack_5c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_5c;
  puStack_60 = (undefined1 *)0xbd7992;
  piStack_10 = param_2;
  iStack_c = param_1;
  iVar3 = (**(code **)(*param_2 + 0x14))();
  if (iVar3 == 0) {
    puStack_60 = (undefined1 *)0xbd79a3;
    func_0x004d5810(piStack_10,0xbd7c38);
  }
  uStack_64 = 0xbd7bf1;
  uStack_68 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_68;
  uStack_6c = 0xbd79c5;
  puStack_60 = (undefined1 *)(auStack_30 + 0xb);
  func_0x0067d074(*(undefined4 *)(*(int *)(iStack_c + 0x34c) + 0x2f4));
  uStack_6c = 0x5e;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xbd79d4;
  (**(code **)(*piStack_10 + 0xc))(piStack_10,0,auStack_30);
  UNRECOVERED_JUMPTABLE_00 = (code *)0xbd79e3;
  uStack_14 = func_0x00bcf770(_oDelimitedString__TDelimitedString,1,auStack_30[0]);
  uStack_74 = 0xbd7a5a;
  uStack_78 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_78;
  UNRECOVERED_JUMPTABLE_00 = (code *)(auStack_30 + 0xb);
  cVar2 = func_0x00bd0bd4(uStack_14,1);
  if (cVar2 == '\0') {
    func_0x00bd3be0(iStack_c);
    pcVar1 = UNRECOVERED_JUMPTABLE_00;
    *in_FS_OFFSET = uStack_78;
    UNRECOVERED_JUMPTABLE_00 = (code *)0xbd7a61;
    uStack_74 = 0xbd7a57;
    func_0x004090bc(uStack_14,uStack_78,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00bd7a58. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
    return;
  }
  func_0x00bd36a0(iStack_c);
  uVar4 = func_0x0067cde0(*(undefined4 *)(*(int *)(iStack_c + 0x34c) + 0x2f4));
  func_0x0067c4d8(uVar4,0xbd7c64);
  func_0x0040a734();
  func_0x0040a734();
  pcVar1 = UNRECOVERED_JUMPTABLE_00;
  *in_FS_OFFSET = uStack_78;
  UNRECOVERED_JUMPTABLE_00 = (code *)0xbd7c24;
  uStack_74 = 0xbd7c12;
  func_0x0040b034(&uStack_48,7,pcVar1);
  uStack_74 = 0xbd7c1a;
  func_0x0040afd4(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00bd7c1b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

