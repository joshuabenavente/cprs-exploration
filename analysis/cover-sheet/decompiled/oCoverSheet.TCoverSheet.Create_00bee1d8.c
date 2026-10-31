/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void oCoverSheet_TCoverSheet_Create(int param_1,char param_2)

{
  code *pcVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_24;
  undefined *puStack_20;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_8 = 0;
  uStack_c = 0;
  if (param_2 != '\0') {
    param_1 = func_0x004096ac();
  }
  puStack_20 = &UNK_00bee2ca;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x0040908c(param_1,0);
  uVar2 = func_0x00bed824(_oCoverSheetParamList__TCoverSheetParamList,1);
  uVar3 = func_0x00410738(param_1 + 0x14);
  func_0x004091e8(uVar2,&UNK_00bee2f0,uVar3);
  iVar4 = func_0x00befb04(_oCoverSheet___System_Generics_Collections_TObjectList<Vcl_Controls_TControl>
                          ,1);
  *(int *)(param_1 + 0x18) = iVar4;
  *(undefined1 *)(iVar4 + 0x28) = 0;
  func_0x00bf0138(1,&uStack_8);
  func_0x0040b3c4(param_1 + 0xc,uStack_8);
  func_0x009af7e0(&uStack_c);
  func_0x0040b3c4(param_1 + 0x10,uStack_c);
  *(int *)(param_1 + 0x34) = param_1;
  *(undefined **)(param_1 + 0x30) = &oCoverSheet_TCoverSheet_fRefreshCWAD;
  *(undefined4 *)(param_1 + 0x20) = 8;
  *(undefined1 *)(param_1 + 0x24) = 0;
  func_0x0040eadc(param_1 + 0x1c,_DAT_00bedad0);
  uVar2 = func_0x00bcda20(_oCoverSheetGrid__TCoverSheetGrid,1);
  uVar3 = func_0x00410738(param_1 + 0x28);
  func_0x004091e8(uVar2,&UNK_00bee300,uVar3);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_24;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bee2d1;
  puStack_20 = (undefined *)0xbee2c7;
  func_0x0040b034(&uStack_c,2,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00bee2c8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

