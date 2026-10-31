/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void oCoverSheet_TCoverSheet_OnClearPtData(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  char cVar2;
  int *piVar3;
  undefined4 uVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_38;
  undefined *puStack_34;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_2c;
  undefined *puStack_28;
  undefined1 *puStack_24;
  undefined4 uStack_8;
  
  puStack_24 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = (int *)0x0;
  puStack_28 = &UNK_00bee451;
  uStack_2c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_2c;
  UNRECOVERED_JUMPTABLE = (code *)0xbee3a9;
  piVar3 = (int *)func_0x0061782c(_Vcl_Controls___System_Generics_Collections_TList<Vcl_Controls_TControl>_TEnumerator
                                  ,1,*(undefined4 *)(param_1 + 0x18));
  puStack_34 = &UNK_00bee432;
  uStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_38;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  while( true ) {
    if (*(int *)(piVar3[1] + 8) + -1 <= piVar3[2]) break;
    piVar3[2] = piVar3[2] + 1;
    uVar1 = *(undefined4 *)(*(int *)(piVar3[1] + 4) + piVar3[2] * 4);
    uVar4 = func_0x00410738(&uStack_8);
    cVar2 = func_0x00439820(uVar1,&UNK_00bee460,uVar4);
    if (cVar2 != '\0') {
      (**(code **)(*uStack_8 + 0x38))(uStack_8,param_2);
    }
  }
  *in_FS_OFFSET = uStack_38;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bee439;
  if (piVar3 != (int *)0x0) {
    puStack_34 = (undefined *)0xbee42f;
    (**(code **)(*piVar3 + -4))(piVar3,1);
  }
                    /* WARNING: Could not recover jumptable at 0x00bee430. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

