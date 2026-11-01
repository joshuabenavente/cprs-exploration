/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rCore_CheckSensitiveRecordAccess(undefined4 param_1,undefined4 *param_2,undefined4 param_3)

{
  code *pcVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar4;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_38;
  undefined1 *puStack_34;
  undefined4 uStack_30;
  undefined *puStack_2c;
  undefined1 *puStack_28;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  puStack_28 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_18 = 0;
  uStack_14 = 0;
  puStack_2c = &UNK_011ce1f4;
  uStack_30 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_30;
  puStack_34 = (undefined1 *)0x11ce12d;
  uStack_8 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_38 = &UNK_011ce1d0;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE;
  uVar4 = 0;
  uStack_c = 0x11;
  puStack_34 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_10 = param_1;
  ORNet_CallVistA(&UNK_011ce210,&uStack_10,0,0,uStack_8);
  *param_2 = 0xffffffff;
  func_0x0040afd4(param_3);
  iVar2 = (**(code **)(*uStack_8 + 0x14))();
  if (0 < iVar2) {
    (**(code **)(*uStack_8 + 0xc))(uStack_8,0,&uStack_14);
    uVar3 = func_0x0042d238(uStack_14,0xffffffff);
    *param_2 = uVar3;
    (**(code **)(*uStack_8 + 0x4c))(uStack_8,0);
    iVar2 = (**(code **)(*uStack_8 + 0x14))();
    if (0 < iVar2) {
      (**(code **)(*uStack_8 + 0x1c))(uStack_8,&uStack_18);
      func_0x0040b3c4(param_3,uStack_18);
    }
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uVar4;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011ce1d7;
  func_0x004090bc(uStack_8,uVar4,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011ce1ce. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

