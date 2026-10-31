/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fOrders_TfrmOrders_SetCannedView
               (int param_1,int param_2,undefined4 param_3,uint param_4,char param_5,
               undefined4 param_6)

{
  code *pcVar1;
  double dVar2;
  char cVar3;
  int *piVar4;
  int iVar5;
  undefined4 uVar6;
  uint uVar7;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  int extraout_EDX_01;
  int extraout_EDX_02;
  undefined4 *in_FS_OFFSET;
  bool bVar8;
  float10 in_ST0;
  float10 fVar9;
  float10 in_ST1;
  float10 in_ST2;
  float10 in_ST3;
  float10 fVar10;
  float10 in_ST4;
  float10 in_ST5;
  float10 in_ST6;
  float10 in_ST7;
  undefined8 uVar11;
  undefined4 uStack_54;
  undefined *puStack_50;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_44;
  double dStack_40;
  undefined8 uStack_38;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  int iStack_20;
  double dStack_1c;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_44 = 0;
  uStack_28 = 0;
  uStack_2c = 0;
  uStack_30 = 0;
  uStack_24 = 0;
  puStack_50 = &UNK_0117bca6;
  uStack_54 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_54;
  uStack_10 = param_3;
  iStack_c = param_2;
  uStack_8 = param_1;
  cVar3 = func_0x0117b678(param_1);
  if (cVar3 != '\0') {
    piVar4 = (int *)func_0x007b1014(*(undefined4 *)(uStack_8 + 0x540));
    iVar5 = (**(code **)(*piVar4 + 0x14))();
    if (iVar5 < 1) {
      piVar4 = (int *)func_0x007b1014(*(undefined4 *)(uStack_8 + 0x540));
      func_0x0040c18c(&uStack_24,&UNK_0117bcc0,param_6);
      (**(code **)(*piVar4 + 0x3c))(piVar4,uStack_24);
    }
    (**(code **)(**(int **)(uStack_8 + 0x540) + 0x170))(*(int **)(uStack_8 + 0x540),0);
    piVar4 = (int *)func_0x007b1014(*(undefined4 *)(uStack_8 + 0x540));
    uVar6 = (**(code **)(*piVar4 + 0x18))(piVar4,0);
    *(undefined4 *)(uStack_8 + 0x688) = uVar6;
    if (*(int *)(uStack_8 + 0x688) == 0) {
      uVar6 = func_0x0040908c(_rOrders__TOrderView,1);
      *(undefined4 *)(uStack_8 + 0x688) = uVar6;
    }
    iStack_20 = *(int *)(uStack_8 + 0x688);
    *(undefined4 *)(iStack_20 + 0x18) = 0;
    *(undefined4 *)(iStack_20 + 0x1c) = 0;
    *(undefined4 *)(iStack_20 + 0x20) = 0;
    *(undefined4 *)(iStack_20 + 0x24) = 0;
    if (param_5 == '\0') {
      func_0x0117b608(uStack_8);
    }
    else {
      *(undefined1 *)(iStack_20 + 0x11) = 0;
      *(undefined1 *)(iStack_20 + 0x10) = 1;
      fVar9 = in_ST2;
      if (iStack_c == 6) {
        uVar11 = CONCAT44(&uStack_28,&uStack_2c);
        func_0x011d6b48(*_DAT_0124f490,&uStack_30);
        func_0x0079acec(uStack_30,CONCAT22(extraout_var,0x5e),2,uVar11);
        func_0x0079acec(uStack_2c,CONCAT22(extraout_var_00,0x3b),3);
        in_ST0 = in_ST3;
        fVar9 = in_ST5;
        in_ST3 = in_ST6;
        func_0x011ca88c(uStack_28);
        func_0x009b0e14();
        uVar6 = func_0x004085a0();
        uStack_38 = (double)CONCAT44(extraout_EDX,uVar6);
        dStack_1c = (double)(longlong)uStack_38;
        uStack_38 = dStack_1c - (double)_DAT_0117bccc;
        in_ST5 = in_ST7;
        func_0x009b0d84();
        *(double *)(iStack_20 + 0x18) = (double)in_ST1;
        in_ST1 = in_ST4;
        in_ST4 = in_ST7;
        func_0x011ca6ac();
        *(double *)(iStack_20 + 0x20) = (double)in_ST2;
      }
      in_ST2 = fVar9;
      if (iStack_c == 8) {
        if (*(double *)(*_DAT_0124f2e0 + 0x50) <= 0.0) {
          in_ST0 = in_ST1;
          in_ST1 = in_ST4;
          in_ST2 = in_ST5;
          func_0x011ca6ac();
          func_0x009b0e14();
          uVar7 = func_0x004085a0();
          uStack_38 = (double)CONCAT44(extraout_EDX_01 - (uint)(uVar7 < 0x1e),uVar7 - 0x1e);
        }
        else {
          fVar10 = in_ST3;
          func_0x009b0e14();
          in_ST3 = fVar9;
          uVar6 = func_0x004085a0();
          uStack_38 = (double)CONCAT44(extraout_EDX_00,uVar6);
          fVar9 = in_ST1;
          in_ST1 = fVar10;
          in_ST2 = in_ST4;
        }
        dStack_1c = (double)(longlong)uStack_38;
        func_0x009b0d84();
        *(double *)(iStack_20 + 0x18) = (double)in_ST0;
        in_ST0 = in_ST3;
        in_ST3 = in_ST5;
        func_0x011ca6ac();
        *(double *)(iStack_20 + 0x20) = (double)fVar9;
      }
    }
    fVar9 = in_ST1;
    if (iStack_c == 0x1b) {
      fVar9 = in_ST3;
      func_0x011db22c();
      *(double *)(iStack_20 + 0x18) = (double)in_ST0;
      in_ST0 = in_ST2;
      if (*(double *)(iStack_20 + 0x18) < 0.0) {
        func_0x0079b0f0(&UNK_0117bcdc);
        in_ST0 = in_ST2;
      }
      func_0x011ca6ac();
      *(double *)(iStack_20 + 0x20) = (double)in_ST1;
    }
    if (0 < (int)param_4) {
      func_0x00431328();
      uVar7 = func_0x004085a0();
      uStack_38 = (double)CONCAT44((extraout_EDX_02 - ((int)param_4 >> 0x1f)) -
                                   (uint)(uVar7 < param_4),uVar7 - param_4);
      dStack_40 = (double)(longlong)uStack_38;
      func_0x009b0d84();
      *(double *)(iStack_20 + 0x18) = (double)in_ST0;
      func_0x011ca6ac();
      *(double *)(iStack_20 + 0x20) = (double)fVar9;
    }
    *(int *)(iStack_20 + 0xc) = iStack_c;
    *(undefined4 *)(iStack_20 + 8) = uStack_10;
    *(undefined4 *)(iStack_20 + 0x28) = 0;
    *(undefined4 *)(iStack_20 + 0x2c) = 0;
    *(undefined4 *)(iStack_20 + 0x30) = 0;
    func_0x0040b3c4(iStack_20 + 0x34,param_6);
    piVar4 = (int *)func_0x007b1014(*(undefined4 *)(uStack_8 + 0x540));
    func_0x0040c18c(&uStack_44,&UNK_0117bcc0,*(undefined4 *)(iStack_20 + 0x34));
    (**(code **)(*piVar4 + 0x20))(piVar4,0,uStack_44);
    *(undefined2 *)(iStack_20 + 0x38) = 0x43;
    *(undefined4 *)(iStack_20 + 0x58) = 0;
    bVar8 = true;
    *(undefined4 *)(iStack_20 + 0x60) = 0;
    *(undefined4 *)(iStack_20 + 100) = 0;
    func_0x0040c324(param_6,&UNK_0117bd70);
    if (bVar8) {
      func_0x00602684(*(undefined4 *)(uStack_8 + 0x538),*(undefined4 *)(uStack_8 + 0x624));
      (**(code **)(**(int **)(uStack_8 + 0x538) + 0x198))(*(int **)(uStack_8 + 0x538),0);
      func_0x00709128(*(undefined4 *)(_DAT_0125a9ac + 0x4b4),0);
      dVar2 = uStack_38;
      uStack_38 = (double)CONCAT62(uStack_38._2_6_,0x31);
      uVar11 = uStack_38;
      uStack_38._5_3_ = SUB83(dVar2,5);
      uStack_38._0_4_ = (undefined4)uVar11;
      uStack_38._0_5_ = CONCAT14(9,(undefined4)uStack_38);
      ORNet_CallVistA(&UNK_0117bdac,&uStack_38,0);
      *_DAT_0124fd4c = 1;
    }
    else {
      func_0x00602684(*(undefined4 *)(uStack_8 + 0x538),*(undefined4 *)(uStack_8 + 0x54c));
      (**(code **)(**(int **)(uStack_8 + 0x538) + 0x198))(*(int **)(uStack_8 + 0x538),1);
      func_0x00709128(*(undefined4 *)(_DAT_0125a9ac + 0x4b4),*(undefined1 *)(uStack_8 + 0x6f9));
      dVar2 = uStack_38;
      uStack_38 = (double)CONCAT62(uStack_38._2_6_,0x30);
      uVar11 = uStack_38;
      uStack_38._5_3_ = SUB83(dVar2,5);
      uStack_38._0_4_ = (undefined4)uVar11;
      uStack_38._0_5_ = CONCAT14(9,(undefined4)uStack_38);
      ORNet_CallVistA(&UNK_0117bdac,&uStack_38,0);
      *_DAT_0124fd4c = 0;
    }
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_54;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0117bcad;
  puStack_50 = (undefined *)0x117bc96;
  func_0x0040afd4(&uStack_44,uStack_54,pcVar1);
  puStack_50 = (undefined *)0x117bca3;
  func_0x0040b034(&uStack_30,4);
                    /* WARNING: Could not recover jumptable at 0x0117bca4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

