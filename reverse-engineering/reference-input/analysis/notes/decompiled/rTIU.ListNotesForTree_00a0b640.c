/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rTIU_ListNotesForTree
               (int *param_1,int param_2,undefined4 param_3,undefined4 param_4,undefined4 param_5,
               undefined4 param_6,char param_7,undefined1 param_8,undefined4 param_9,double param_10
               ,double param_11)

{
  code *pcVar1;
  int iVar2;
  int iVar3;
  undefined2 extraout_var;
  undefined2 uVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_a8;
  undefined *puStack_a4;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  int iStack_84;
  float10 fStack_80;
  float10 fStack_74;
  undefined4 uStack_68;
  undefined1 uStack_64;
  int iStack_60;
  undefined1 uStack_5c;
  undefined4 uStack_58;
  undefined1 uStack_54;
  float10 *pfStack_50;
  undefined1 uStack_4c;
  float10 *pfStack_48;
  undefined1 uStack_44;
  undefined1 *puStack_40;
  undefined1 uStack_3c;
  undefined4 uStack_38;
  undefined1 uStack_34;
  undefined2 uStack_30;
  undefined1 uStack_2c;
  undefined1 uStack_28;
  undefined1 uStack_24;
  undefined4 uStack_20;
  undefined1 uStack_1c;
  undefined4 uStack_18;
  undefined1 uStack_14;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  uStack_90 = 0;
  uStack_8c = 0;
  iStack_84 = 0;
  uStack_88 = 0;
  UNRECOVERED_JUMPTABLE = (code *)0xa0b672;
  uStack_8 = param_3;
  func_0x0040b0c8(param_5);
  puStack_a4 = &UNK_00a0b7fe;
  uStack_a8 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_a8;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x0040afd4(param_4);
  if (param_7 == '\0') {
    uVar4 = 0x44;
  }
  else {
    uVar4 = 0x41;
  }
  if (0 < param_2) {
    uStack_68 = 3;
    uStack_64 = 0;
    uStack_5c = 0;
    uStack_58 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
    uStack_54 = 0x11;
    fStack_74 = (float10)param_11;
    pfStack_50 = &fStack_74;
    uStack_4c = 3;
    fStack_80 = (float10)param_10;
    pfStack_48 = &fStack_80;
    uStack_44 = 3;
    puStack_40 = &param_8;
    uStack_3c = 0x10;
    uStack_38 = uStack_8;
    uStack_34 = 0;
    uStack_2c = 9;
    uStack_28 = 1;
    uStack_24 = 1;
    uStack_20 = 0;
    uStack_1c = 0;
    uStack_18 = param_6;
    uStack_14 = 0;
    uStack_10 = param_5;
    uStack_c = 0x11;
    iStack_60 = param_2;
    uStack_30 = uVar4;
    ORNet_CallVistA(&UNK_00a0b81c,&uStack_68,0xb,0,param_1);
    iVar2 = (**(code **)(*param_1 + 0x14))();
    if (0 < iVar2) {
      iVar2 = 0;
      while( true ) {
        iVar3 = (**(code **)(*param_1 + 0x14))();
        if (iVar3 <= iVar2) break;
        (**(code **)(*param_1 + 0xc))(param_1,iVar2,&uStack_88);
        func_0x0042c5fc(uStack_88,&iStack_84);
        if (iStack_84 == 0) {
          (**(code **)(*param_1 + 0x4c))(param_1,iVar2);
        }
        else {
          (**(code **)(*param_1 + 0xc))(param_1,iVar2,&uStack_8c);
          iVar3 = func_0x00437d28(&UNK_00a0b85c,uStack_8c);
          if (0 < iVar3) {
            (**(code **)(*param_1 + 0xc))(param_1,iVar2,&uStack_90,param_4);
            func_0x009b2f6c(uStack_90,CONCAT22(extraout_var,0x5e),1);
          }
          iVar2 = iVar2 + 1;
        }
      }
    }
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_a8;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00a0b805;
  puStack_a4 = (undefined *)0xa0b7f3;
  func_0x0040b034(&uStack_90,4,pcVar1);
  puStack_a4 = (undefined *)0xa0b7fb;
  func_0x0040afd4(&param_5);
                    /* WARNING: Could not recover jumptable at 0x00a0b7fc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

