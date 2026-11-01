/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_GetOrderText
               (int param_1,int param_2,int param_3,undefined4 *param_4,undefined4 param_5)

{
  code *pcVar1;
  int iVar2;
  int *piVar3;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar4;
  undefined4 uStack_44;
  undefined *puStack_40;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined1 uStack_28;
  undefined4 uStack_24;
  undefined1 uStack_20;
  undefined4 uStack_1c;
  int iStack_18;
  undefined4 uStack_14;
  int iStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_30 = 0;
  uStack_34 = 0;
  uStack_1c = 0;
  iStack_18 = 0;
  uStack_14 = 0;
  puStack_40 = &UNK_0117ed6c;
  uStack_44 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_44;
  pcVar1 = (code *)((int)register0x00000010 + -4);
  iStack_10 = param_3;
  iStack_c = param_2;
  uStack_8 = param_1;
  if (param_2 != 0) {
    pcVar1 = (code *)((int)register0x00000010 + -4);
    switch(param_5) {
    case 0:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      func_0x0040b3c4(param_4,*(undefined4 *)(param_2 + 0x78));
      pcVar1 = UNRECOVERED_JUMPTABLE;
      if (0 < iStack_10) {
        uVar4 = iStack_10 == 1;
        iVar2 = (**(code **)(**(int **)(*(int *)(uStack_8 + 0x538) + 0x2d8) + 0x18))();
        func_0x0040c324(*param_4,*(undefined4 *)(iVar2 + 0x78));
        pcVar1 = UNRECOVERED_JUMPTABLE;
        if ((bool)uVar4) {
          func_0x0040afd4(param_4);
          pcVar1 = UNRECOVERED_JUMPTABLE;
        }
      }
      break;
    case 1:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      func_0x0040b3c4(param_4,*(undefined4 *)(param_2 + 100));
      if (0 < iStack_10) {
        uVar4 = iStack_10 == 1;
        iVar2 = (**(code **)(**(int **)(*(int *)(uStack_8 + 0x538) + 0x2d8) + 0x18))();
        func_0x0040c324(*param_4,*(undefined4 *)(iVar2 + 100));
        if ((bool)uVar4) {
          func_0x0040afd4(param_4);
        }
      }
      piVar3 = (int *)func_0x007b1014(*(undefined4 *)(uStack_8 + 0x540));
      uVar4 = 1;
      (**(code **)(*piVar3 + 0xc))(piVar3,0,&uStack_14);
      func_0x0040c324(uStack_14,&UNK_0117ed88);
      pcVar1 = UNRECOVERED_JUMPTABLE;
      if ((bool)uVar4) {
        func_0x0040b3c4(param_4,*(undefined4 *)(iStack_c + 100));
        pcVar1 = UNRECOVERED_JUMPTABLE;
      }
      break;
    case 2:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      func_0x0040b3c4(param_4,*(undefined4 *)(param_2 + 0x5c));
      pcVar1 = UNRECOVERED_JUMPTABLE;
      if (*(char *)(iStack_c + 0x68) != '\0') {
        if ((*(char *)(*_DAT_0124f490 + 4) != '\0') && (*(char *)(iStack_c + 0xa4) == '\0')) {
          func_0x011dd930(_DAT_0125a9e0);
        }
        func_0x0042c5fc(*(undefined4 *)(iStack_c + 0xa0),&iStack_18);
        if (iStack_18 == 0) {
          func_0x0040c134(param_4,&UNK_0117ede8);
          pcVar1 = UNRECOVERED_JUMPTABLE;
        }
        else {
          uStack_2c = *param_4;
          uStack_28 = 0x11;
          uStack_24 = *(undefined4 *)(iStack_c + 0xa0);
          uStack_20 = 0x11;
          func_0x0042ef18(&UNK_0117edcc,&uStack_2c,1,&uStack_1c);
          func_0x0040b3c4(param_4,uStack_1c);
          pcVar1 = UNRECOVERED_JUMPTABLE;
        }
      }
      break;
    case 3:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      fOrders_TfrmOrders_GetStartStopText
                (param_1,*(undefined4 *)(param_2 + 0x20),*(undefined4 *)(param_2 + 0x24),param_4);
      pcVar1 = UNRECOVERED_JUMPTABLE;
      break;
    case 4:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      func_0x009b2a68(*(undefined4 *)(param_2 + 0x48),0,param_4);
      func_0x0079acec(*param_4,CONCAT22(extraout_var,0x2c),1,&uStack_30);
      func_0x0079acec(*param_4,CONCAT22(extraout_var_00,0x2c),2,&uStack_34,&UNK_0117ee0c,uStack_30);
      func_0x0040c214(param_4,3);
      pcVar1 = UNRECOVERED_JUMPTABLE;
      break;
    case 5:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      func_0x0040b3c4(param_4,*(undefined4 *)(param_2 + 0x30));
      pcVar1 = UNRECOVERED_JUMPTABLE;
      break;
    case 6:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      func_0x0040b3c4(param_4,*(undefined4 *)(param_2 + 0x34));
      pcVar1 = UNRECOVERED_JUMPTABLE;
      break;
    case 7:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      func_0x0040b3c4(param_4,*(undefined4 *)(param_2 + 0x38));
      pcVar1 = UNRECOVERED_JUMPTABLE;
      break;
    case 8:
      if (*(int *)(param_2 + 0x88) == 0) {
        UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
        func_0x011dad98(*(undefined4 *)(param_2 + 0x28),param_4);
        pcVar1 = UNRECOVERED_JUMPTABLE;
      }
      else {
        UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
        func_0x0040b3c4(param_4,*(undefined4 *)(param_2 + 0x88));
        pcVar1 = UNRECOVERED_JUMPTABLE;
      }
      break;
    case 9:
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      func_0x009b2a68(*(undefined4 *)(param_2 + 0x80),0,param_4);
      pcVar1 = UNRECOVERED_JUMPTABLE;
      break;
    case 10:
      func_0x0040b3c4(param_4,*(undefined4 *)(param_2 + 0x94));
      pcVar1 = UNRECOVERED_JUMPTABLE;
    }
  }
  UNRECOVERED_JUMPTABLE = pcVar1;
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_44;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0117ed73;
  puStack_40 = (undefined *)0x117ed5c;
  func_0x0040b034(&uStack_34,2,pcVar1);
  puStack_40 = (undefined *)0x117ed69;
  func_0x0040b034(&uStack_1c,3);
                    /* WARNING: Could not recover jumptable at 0x0117ed6a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

