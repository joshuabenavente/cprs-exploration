/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_mnuViewDetailClick(int param_1,undefined4 param_2)

{
  code *pcVar1;
  undefined4 uVar2;
  char cVar3;
  int iVar4;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar5;
  float10 in_ST0;
  float10 fVar6;
  float10 in_ST1;
  float10 in_ST2;
  float10 in_ST3;
  float10 in_ST4;
  float10 in_ST5;
  float10 in_ST6;
  undefined4 uStack_88;
  undefined *puStack_84;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined4 *puStack_70;
  undefined4 uStack_6c;
  undefined *puStack_68;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_60;
  undefined *puStack_5c;
  code *UNRECOVERED_JUMPTABLE_01;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  int iStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  int iStack_30;
  int iStack_2c;
  int iStack_28;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  int *piStack_18;
  int iStack_14;
  int iStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE_01 = (code *)((int)register0x00000010 + -4);
  uStack_50 = 0;
  uStack_48 = 0;
  uStack_4c = 0;
  uStack_44 = 0;
  uStack_20 = 0;
  uStack_24 = 0;
  puStack_5c = &UNK_0117cf7c;
  uStack_60 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_60;
  UNRECOVERED_JUMPTABLE_00 = (code *)0x117cc3c;
  uStack_40 = param_2;
  uStack_8 = param_1;
  cVar3 = func_0x01181714(param_1,&UNK_0117cf94);
  if (cVar3 != '\0') {
LAB_0117cf52:
    pcVar1 = UNRECOVERED_JUMPTABLE_01;
    *in_FS_OFFSET = uStack_60;
    UNRECOVERED_JUMPTABLE_01 = (code *)&UNK_0117cf83;
    puStack_5c = (undefined *)0x117cf6c;
    func_0x0040b034(&uStack_50,4,pcVar1);
    puStack_5c = (undefined *)0x117cf79;
    func_0x0040b034(&uStack_24,2);
                    /* WARNING: Could not recover jumptable at 0x0117cf7a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_01)(UNRECOVERED_JUMPTABLE_01);
    return;
  }
  UNRECOVERED_JUMPTABLE_00 = (code *)0x117cc50;
  piStack_18 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  iStack_14 = 0;
  puStack_68 = &UNK_0117cf4b;
  uStack_6c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_6c;
  iStack_28 = *(int *)(uStack_8 + 0x538);
  puStack_70 = (undefined4 *)0x117cc80;
  UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
  iVar4 = (**(code **)(**(int **)(iStack_28 + 0x2d8) + 0x14))();
  if (-1 < iVar4 + -1) {
    iStack_c = 0;
    iStack_2c = iVar4;
    do {
      puStack_70 = (undefined4 *)0x117cc9f;
      cVar3 = func_0x00631c70(iStack_28,iStack_c);
      fVar6 = in_ST0;
      if (cVar3 != '\0') {
        puStack_70 = (undefined4 *)0x117ccb1;
        func_0x009b60ec(&UNK_0117d03c);
        puStack_70 = (undefined4 *)0x117ccc2;
        iVar4 = (**(code **)(**(int **)(iStack_28 + 0x2d8) + 0x18))
                          (*(int **)(iStack_28 + 0x2d8),iStack_c);
        puStack_70 = (undefined4 *)0x117cccd;
        func_0x0040b40c(&uStack_20,*(undefined4 *)(iVar4 + 0xc));
        puStack_70 = &uStack_24;
        uStack_74 = 0x117cce2;
        func_0x0079acec(uStack_20,CONCAT22(extraout_var_00,0x3b),1);
        uStack_74 = 0;
        uStack_78 = 0;
        uStack_7c = 0;
        UNRECOVERED_JUMPTABLE = (code *)0x117ccf0;
        fVar6 = in_ST1;
        in_ST1 = in_ST2;
        in_ST2 = in_ST3;
        in_ST3 = in_ST4;
        in_ST4 = in_ST5;
        in_ST5 = in_ST6;
        func_0x009b1b30(uStack_24);
        uVar5 = (float10)0 != in_ST0;
        in_ST6 = in_ST5;
        if ((bool)uVar5) {
          UNRECOVERED_JUMPTABLE = (code *)0x117cd1a;
          func_0x011dabac(uStack_20,piStack_18);
          UNRECOVERED_JUMPTABLE = (code *)0x117cd2b;
          iVar4 = (**(code **)(**(int **)(iStack_28 + 0x2d8) + 0x18))
                            (*(int **)(iStack_28 + 0x2d8),iStack_c);
          UNRECOVERED_JUMPTABLE = (code *)0x117cd38;
          func_0x0040c324(*(undefined4 *)(iVar4 + 100),&UNK_0117d0f0);
          if ((bool)uVar5) {
LAB_0117cdc2:
            UNRECOVERED_JUMPTABLE = (code *)0x117cdcc;
            (**(code **)(*piStack_18 + 0x3c))(piStack_18,0);
            UNRECOVERED_JUMPTABLE = (code *)0x117cddd;
            func_0x0040c74c(CONCAT22(extraout_var,0x3d),0x4a,&uStack_44);
            UNRECOVERED_JUMPTABLE = (code *)0x117cde8;
            (**(code **)(*piStack_18 + 0x3c))(piStack_18,uStack_44);
            UNRECOVERED_JUMPTABLE = (code *)0x117cdf2;
            (**(code **)(*piStack_18 + 0x3c))(piStack_18,0);
            UNRECOVERED_JUMPTABLE = (code *)0x117cdfe;
            uStack_1c = func_0x004d81f4(_System_Classes__TStringList,1);
            puStack_84 = &UNK_0117ce48;
            uStack_88 = *in_FS_OFFSET;
            *in_FS_OFFSET = &uStack_88;
            UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
            func_0x00adde04(uStack_24,uStack_1c);
            func_0x009b4030(uStack_1c,piStack_18);
            uVar2 = uStack_1c;
            pcVar1 = UNRECOVERED_JUMPTABLE;
            *in_FS_OFFSET = uStack_88;
            UNRECOVERED_JUMPTABLE = (code *)0x117ce4f;
            uStack_34 = uStack_1c;
            uStack_1c = 0;
            puStack_84 = (undefined *)0x117ce45;
            func_0x004090bc(uVar2,uStack_88,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x0117ce46. Too many branches */
                    /* WARNING: Treating indirect jump as call */
            (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
            return;
          }
          UNRECOVERED_JUMPTABLE = (code *)0x117cd4f;
          iVar4 = (**(code **)(**(int **)(iStack_28 + 0x2d8) + 0x18))
                            (*(int **)(iStack_28 + 0x2d8),iStack_c);
          UNRECOVERED_JUMPTABLE = (code *)0x117cd5c;
          func_0x0040c324(*(undefined4 *)(iVar4 + 100),&UNK_0117d114);
          if ((bool)uVar5) goto LAB_0117cdc2;
          UNRECOVERED_JUMPTABLE = (code *)0x117cd6f;
          iVar4 = (**(code **)(**(int **)(iStack_28 + 0x2d8) + 0x18))
                            (*(int **)(iStack_28 + 0x2d8),iStack_c);
          UNRECOVERED_JUMPTABLE = (code *)0x117cd7c;
          func_0x0040c324(*(undefined4 *)(iVar4 + 100),&UNK_0117d134);
          if ((bool)uVar5) goto LAB_0117cdc2;
          UNRECOVERED_JUMPTABLE = (code *)0x117cd8f;
          iVar4 = (**(code **)(**(int **)(iStack_28 + 0x2d8) + 0x18))
                            (*(int **)(iStack_28 + 0x2d8),iStack_c);
          UNRECOVERED_JUMPTABLE = (code *)0x117cd9c;
          func_0x0040c324(*(undefined4 *)(iVar4 + 100),&UNK_0117d164);
          if ((bool)uVar5) goto LAB_0117cdc2;
          UNRECOVERED_JUMPTABLE = (code *)0x117cdaf;
          iVar4 = (**(code **)(**(int **)(iStack_28 + 0x2d8) + 0x18))
                            (*(int **)(iStack_28 + 0x2d8),iStack_c);
          UNRECOVERED_JUMPTABLE = (code *)0x117cdbc;
          func_0x0040c324(*(undefined4 *)(iVar4 + 100),&UNK_0117d198);
          if ((bool)uVar5) goto LAB_0117cdc2;
          UNRECOVERED_JUMPTABLE = (code *)0x117ce57;
          iVar4 = func_0x011db5e4(uStack_24);
          if (iVar4 == 1) {
            UNRECOVERED_JUMPTABLE = (code *)0x117ce62;
            iVar4 = (**(code **)(*piStack_18 + 0x14))();
            if (-1 < iVar4 + -1) {
              iStack_10 = 0;
              iStack_30 = iVar4;
              do {
                UNRECOVERED_JUMPTABLE = (code *)0x117ce80;
                (**(code **)(*piStack_18 + 0xc))(piStack_18,iStack_10,&uStack_4c);
                UNRECOVERED_JUMPTABLE = (code *)0x117ce8b;
                func_0x0042c1a8(uStack_4c,&uStack_48);
                uStack_38 = uStack_48;
                UNRECOVERED_JUMPTABLE = (code *)0x117cea3;
                iStack_3c = func_0x0040c4b0(&UNK_0117d1b8,uStack_48,1);
                if (0 < iStack_3c) {
                  iStack_14 = iStack_10;
                  break;
                }
                iStack_10 = iStack_10 + 1;
                iStack_30 = iStack_30 + -1;
              } while (iStack_30 != 0);
            }
            if (0 < iStack_14) {
              UNRECOVERED_JUMPTABLE = (code *)0x117cecd;
              (**(code **)(*piStack_18 + 0x4c))(piStack_18,iStack_14);
            }
          }
          UNRECOVERED_JUMPTABLE = (code *)0x1;
          puStack_84 = (undefined *)0x117cedf;
          func_0x0040c18c(&uStack_50,&UNK_0117d1d4,uStack_20);
          puStack_84 = (undefined *)0x117ceec;
          func_0x01007fec(piStack_18,uStack_50,1);
        }
        else {
          UNRECOVERED_JUMPTABLE = (code *)0x117cd0a;
          func_0x0079c19c(&UNK_0117d080,0,0);
        }
        UNRECOVERED_JUMPTABLE = (code *)0x117cef3;
        func_0x009b60ec(0);
        UNRECOVERED_JUMPTABLE = (code *)0x117ceff;
        cVar3 = func_0x00febee8(*_DAT_0124f7c4);
        if (cVar3 == '\0') {
          UNRECOVERED_JUMPTABLE = (code *)0x117cf0f;
          cVar3 = func_0x010048d0(*_DAT_0124f7c4);
          if (cVar3 == '\0') {
            UNRECOVERED_JUMPTABLE = (code *)0x117cf27;
            func_0x00631cb4(iStack_28,iStack_c,0);
            goto LAB_0117cf27;
          }
        }
        UNRECOVERED_JUMPTABLE = (code *)0x117cf18;
        func_0x0040a734();
        goto LAB_0117cf52;
      }
LAB_0117cf27:
      iStack_c = iStack_c + 1;
      iStack_2c = iStack_2c + -1;
      in_ST0 = fVar6;
    } while (iStack_2c != 0);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE_00;
  *in_FS_OFFSET = uStack_6c;
  UNRECOVERED_JUMPTABLE_00 = (code *)0x117cf52;
  puStack_68 = (undefined *)0x117cf48;
  func_0x004090bc(piStack_18,uStack_6c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x0117cf49. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

