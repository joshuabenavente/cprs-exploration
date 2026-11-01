/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_lstSheetsClick(int param_1)

{
  undefined4 *puVar1;
  char cVar2;
  int *piVar3;
  undefined4 uVar4;
  int iVar5;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined4 unaff_EBX;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 *puStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  undefined4 *puStack_20;
  undefined4 uStack_1c;
  undefined *puStack_18;
  undefined4 UNRECOVERED_JUMPTABLE;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  iVar5 = 9;
  do {
    iVar5 = iVar5 + -1;
  } while (iVar5 != 0);
  puStack_18 = &UNK_0117e2dd;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  puStack_20 = (undefined4 *)0x117dc45;
  cVar2 = func_0x010e36b0();
  if (cVar2 != '\0') {
    *(undefined1 *)(param_1 + 0x68c) = 1;
    puStack_20 = (undefined4 *)0x117dc68;
    iVar5 = (**(code **)(**(int **)(param_1 + 0x540) + 0x16c))();
    if (-1 < iVar5) {
      UNRECOVERED_JUMPTABLE = *(code **)(param_1 + 0x540);
      puStack_20 = (undefined4 *)0x117dc87;
      puStack_20 = (undefined4 *)(**(code **)(*(int *)UNRECOVERED_JUMPTABLE + 0x16c))();
      uStack_24 = 0x117dc90;
      piVar3 = (int *)func_0x007b1014(UNRECOVERED_JUMPTABLE);
      puVar1 = puStack_20;
      puStack_20 = (undefined4 *)0x117dc96;
      iVar5 = (**(code **)(*piVar3 + 0x18))(piVar3,puVar1);
      puStack_20 = &uStack_1c;
      uStack_24 = 0x117dcae;
      uStack_24 = (**(code **)(**(int **)(param_1 + 0x540) + 0x16c))();
      uStack_28 = 0x117dcb7;
      piVar3 = (int *)func_0x007b1014(UNRECOVERED_JUMPTABLE);
      uVar4 = uStack_24;
      uStack_24 = 0x117dcc0;
      (**(code **)(*piVar3 + 0xc))(piVar3,uVar4,&puStack_20);
      uStack_24 = 0x117dcd1;
      func_0x0079acec(puStack_20,CONCAT22(extraout_var_00,0x5e),1);
      uStack_24 = 0x117dcdb;
      uVar4 = func_0x0042d238(uStack_1c,0);
      *(undefined4 *)(iVar5 + 0x54) = uVar4;
      if (0 < *(int *)(iVar5 + 0x54)) {
        *(undefined1 *)(param_1 + 0x68c) = 0;
      }
      if (*(int *)(iVar5 + 0x4c) == 0) {
        *(undefined1 *)(param_1 + 0x691) = 0;
      }
      else {
        *(undefined1 *)(param_1 + 0x691) = 1;
      }
      if (((*(int *)(param_1 + 0x688) != 0) &&
          (*(int *)(iVar5 + 0x4c) != *(int *)(*(int *)(param_1 + 0x688) + 0x4c))) &&
         (0 < *(int *)(*(int *)(param_1 + 0x688) + 0x4c))) {
        puStack_20 = (undefined4 *)0x117dd62;
        func_0x0042cfdc(*(undefined4 *)(*(int *)(param_1 + 0x688) + 0x54),
                        (int)register0x00000010 + -0x10);
        if (*(char *)(*_DAT_0124ef68 + 0x5fd) != '\0') goto LAB_0117e296;
        if (0 < *(int *)(*(int *)(param_1 + 0x688) + 0x54)) {
          puStack_20 = (undefined4 *)0x0;
          uStack_24 = 0;
          uStack_28 = 0x117dda9;
          cVar2 = func_0x0118a80c(param_1,*(undefined4 *)(*(int *)(param_1 + 0x688) + 0x54),
                                  *(undefined4 *)(*(int *)(param_1 + 0x688) + 0x50));
          if (cVar2 != '\0') goto LAB_0117e296;
        }
        if (*(char *)(param_1 + 0x6e9) == '\0') {
          puStack_20 = (undefined4 *)0x117ddd3;
          cVar2 = func_0x011e6e9c(unaff_EBX,*(int *)(param_1 + 0x688) + 0x50,1);
          if (cVar2 != '\0') {
            puStack_20 = (undefined4 *)0x117dde2;
            func_0x0118a6b4(param_1,unaff_EBX);
            *(undefined1 *)(param_1 + 0x68c) = 1;
            puStack_20 = (undefined4 *)0x117ddf4;
            func_0x01187cdc(param_1);
            puStack_20 = (undefined4 *)0x117de07;
            (**(code **)(**(int **)(param_1 + 0x540) + 0x170))(*(int **)(param_1 + 0x540),0);
            puStack_20 = (undefined4 *)0x117de12;
            fOrders_TfrmOrders_lstSheetsClick(param_1,param_1);
            goto LAB_0117e296;
          }
        }
      }
      if (((*(int *)(param_1 + 0x688) == 0) || (*(int *)(param_1 + 0x688) != iVar5)) ||
         ((*(int *)(param_1 + 0x688) == iVar5 && (0 < *(int *)(*(int *)(param_1 + 0x688) + 0x4c)))))
      {
        *(int *)(param_1 + 0x688) = iVar5;
        if (*(int *)(*(int *)(param_1 + 0x688) + 0x4c) < 1) {
          *(undefined1 *)(param_1 + 0x68f) = 0;
          puStack_20 = (undefined4 *)0x117e1b2;
          func_0x00709244(*(undefined4 *)(param_1 + 0x5cc),0);
          puStack_20 = (undefined4 *)0x117e1c2;
          func_0x00709244(*(undefined4 *)(param_1 + 0x5d0),0);
          puStack_20 = (undefined4 *)0x117e1d5;
          func_0x006026fc(*(undefined4 *)(param_1 + 0x5d8),&UNK_0117e3d4);
          puStack_20 = (undefined4 *)0x117e1e6;
          func_0x006026ac(*(undefined4 *)(param_1 + 0x5d8),&uStack_48);
          puStack_20 = (undefined4 *)0x117e1f7;
          func_0x007b10c8(*(undefined4 *)(param_1 + 0x544),uStack_48);
          puStack_20 = (undefined4 *)0x117e205;
          func_0x007b1014(*(undefined4 *)(param_1 + 0x544));
          puStack_20 = (undefined4 *)0x117e20a;
          func_0x011e0340();
          puStack_20 = (undefined4 *)0x117e216;
          fOrders_TfrmOrders_RefreshOrderList(param_1,1,0);
        }
        else {
          *(undefined1 *)(param_1 + 0x68c) = 0;
          puStack_20 = (undefined4 *)0x117de8d;
          piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x544));
          puStack_20 = (undefined4 *)0x117de92;
          (**(code **)(*piVar3 + 0x48))();
          puStack_20 = (undefined4 *)0x117deab;
          func_0x0040c18c(&uStack_24,&UNK_0117e2f8,*(undefined4 *)(*(int *)(param_1 + 0x688) + 0x34)
                         );
          puStack_20 = (undefined4 *)0x117debc;
          func_0x006026fc(*(undefined4 *)(param_1 + 0x5d8),uStack_24);
          puStack_20 = (undefined4 *)0x117decd;
          func_0x006026ac(*(undefined4 *)(param_1 + 0x5d8),&uStack_28);
          puStack_20 = (undefined4 *)0x117dede;
          func_0x007b10c8(*(undefined4 *)(param_1 + 0x544),uStack_28);
          puStack_20 = (undefined4 *)0x117deec;
          piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x544));
          puStack_20 = (undefined4 *)0x117def1;
          (**(code **)(*piVar3 + 0x48))();
          puStack_20 = (undefined4 *)0x117deff;
          func_0x0042cfdc(*(undefined4 *)(iVar5 + 0x4c),&puStack_2c);
          puStack_20 = puStack_2c;
          uStack_24 = 0x117df11;
          uVar4 = func_0x007b1014(*(undefined4 *)(param_1 + 0x544));
          puVar1 = puStack_20;
          puStack_20 = (undefined4 *)0x117df17;
          func_0x011e03b0(uVar4,puVar1);
          puStack_20 = (undefined4 *)0x117df25;
          piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x544));
          puStack_20 = (undefined4 *)0x117df2a;
          iVar5 = (**(code **)(*piVar3 + 0x14))();
          if (iVar5 < 1) {
            puStack_20 = (undefined4 *)0x117df3b;
            func_0x007b1014(*(undefined4 *)(param_1 + 0x544));
            puStack_20 = (undefined4 *)0x117df40;
            func_0x011e0340();
          }
          puStack_20 = &uStack_30;
          uStack_24 = 0x117df55;
          uStack_24 = (**(code **)(**(int **)(param_1 + 0x540) + 0x16c))();
          uStack_28 = 0x117df64;
          piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x540));
          uVar4 = uStack_24;
          uStack_24 = 0x117df6d;
          (**(code **)(*piVar3 + 0xc))(piVar3,uVar4,&uStack_34);
          uStack_24 = 0x117df7e;
          func_0x0079acec(uStack_34,CONCAT22(extraout_var_01,0x5e),1);
          uStack_24 = 0x117df8b;
          fOrders_TfrmOrders_RefreshOrderList(param_1,1,uStack_30);
          uStack_24 = 0x117df9b;
          func_0x00709244(*(undefined4 *)(param_1 + 0x5cc),1);
          uStack_24 = 0x117dfab;
          func_0x00709244(*(undefined4 *)(param_1 + 0x5d0),1);
          uStack_24 = 0x117dfbf;
          iVar5 = (**(code **)(**(int **)(*(int *)(param_1 + 0x538) + 0x2d8) + 0x14))();
          if ((iVar5 == 0) && (*(char *)(param_1 + 0x68f) == '\0')) {
            if (*(char *)(*_DAT_0124ef68 + 0x5fd) != '\0') goto LAB_0117e296;
            if (0 < *(int *)(*(int *)(param_1 + 0x688) + 0x54)) {
              puStack_20 = (undefined4 *)0x0;
              uStack_24 = 0;
              uStack_28 = 0x117e01e;
              cVar2 = func_0x0118a80c(param_1,*(undefined4 *)(*(int *)(param_1 + 0x688) + 0x54),
                                      *(undefined4 *)(*(int *)(param_1 + 0x688) + 0x50));
              if (cVar2 != '\0') goto LAB_0117e296;
            }
            puStack_20 = &uStack_38;
            uStack_24 = 0x117e03b;
            uStack_24 = (**(code **)(**(int **)(param_1 + 0x540) + 0x16c))();
            uStack_28 = 0x117e04a;
            piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x540));
            uVar4 = uStack_24;
            uStack_24 = 0x117e053;
            (**(code **)(*piVar3 + 0xc))(piVar3,uVar4,&uStack_3c);
            uStack_24 = 0x117e064;
            func_0x0079acec(uStack_3c,CONCAT22(extraout_var_02,0x5e),1);
            uStack_24 = 0x117e06c;
            cVar2 = func_0x011e3bc0(uStack_38);
            if ((cVar2 != '\0') && (*(char *)(param_1 + 0x690) != '\0')) {
              puStack_20 = (undefined4 *)0x117e097;
              iVar5 = func_0x009b44a8(&UNK_0117e33c,&UNK_0117e314,CONCAT22(extraout_var,0x24));
              if (iVar5 == 6) {
                puStack_20 = &uStack_40;
                uStack_24 = 0x117e0b5;
                uStack_24 = (**(code **)(**(int **)(param_1 + 0x540) + 0x16c))();
                uStack_28 = 0x117e0c4;
                piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x540));
                uVar4 = uStack_24;
                uStack_24 = 0x117e0cd;
                (**(code **)(*piVar3 + 0xc))(piVar3,uVar4,&uStack_44);
                uStack_24 = 0x117e0de;
                func_0x0079acec(uStack_44,CONCAT22(extraout_var_03,0x5e),1);
                uStack_24 = 0x117e0e6;
                func_0x011e3810(uStack_40);
                *(undefined1 *)(param_1 + 0x68c) = 1;
                uStack_24 = 0x117e101;
                uStack_24 = (**(code **)(**(int **)(param_1 + 0x540) + 0x16c))();
                uStack_28 = 0x117e110;
                piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x540));
                uVar4 = uStack_24;
                uStack_24 = 0x117e116;
                (**(code **)(*piVar3 + 0x18))(piVar3,uVar4);
                uStack_24 = 0x117e11b;
                func_0x004090bc();
                uStack_24 = 0x117e12c;
                uStack_24 = (**(code **)(**(int **)(param_1 + 0x540) + 0x16c))();
                uStack_28 = 0x117e13b;
                piVar3 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x540));
                uVar4 = uStack_24;
                uStack_24 = 0x117e141;
                (**(code **)(*piVar3 + 0x4c))(piVar3,uVar4);
                uStack_24 = 0x117e14d;
                uVar4 = func_0x0040908c(_rOrders__TOrderView,1);
                *(undefined4 *)(param_1 + 0x688) = uVar4;
                uStack_24 = 0x117e169;
                (**(code **)(**(int **)(param_1 + 0x540) + 0x170))(*(int **)(param_1 + 0x540),0);
                uStack_24 = 0x117e174;
                fOrders_TfrmOrders_lstSheetsClick(param_1,param_1);
                goto LAB_0117e296;
              }
            }
          }
          if (*(char *)(param_1 + 0x68f) != '\0') {
            *(undefined1 *)(param_1 + 0x68f) = 0;
          }
        }
      }
      else {
        puStack_20 = (undefined4 *)0x117e228;
        func_0x00709244(*(undefined4 *)(param_1 + 0x5cc),0);
        puStack_20 = (undefined4 *)0x117e238;
        func_0x00709244(*(undefined4 *)(param_1 + 0x5d0),0);
        puStack_20 = (undefined4 *)0x117e24b;
        func_0x006026fc(*(undefined4 *)(param_1 + 0x5d8),&UNK_0117e3d4);
        puStack_20 = (undefined4 *)0x117e25c;
        func_0x006026ac(*(undefined4 *)(param_1 + 0x5d8),&uStack_4c);
        puStack_20 = (undefined4 *)0x117e26d;
        func_0x007b10c8(*(undefined4 *)(param_1 + 0x544),uStack_4c);
        puStack_20 = (undefined4 *)0x117e27b;
        func_0x007b1014(*(undefined4 *)(param_1 + 0x544));
        puStack_20 = (undefined4 *)0x117e280;
        func_0x011e0340();
        puStack_20 = (undefined4 *)0x117e28c;
        fOrders_TfrmOrders_RefreshOrderList(param_1,1,0);
      }
      *(undefined1 *)(param_1 + 0x68c) = 1;
    }
  }
LAB_0117e296:
  piVar3 = (int *)UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0117e2e4;
  puStack_18 = (undefined *)0x117e2b0;
  func_0x0040b034(&uStack_4c,2,piVar3);
  puStack_18 = (undefined *)0x117e2bd;
  func_0x0040b034(&uStack_44,7);
  puStack_18 = (undefined *)0x117e2c5;
  func_0x0040afd4(&uStack_28);
  puStack_18 = (undefined *)0x117e2d2;
  func_0x0040b034(&uStack_24,3);
  puStack_18 = (undefined *)0x117e2da;
  func_0x0040afd4((int)register0x00000010 + -0x10);
                    /* WARNING: Could not recover jumptable at 0x0117e2db. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

