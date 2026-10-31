/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fNotes_TfrmNotes_DoSelect(int param_1)

{
  undefined4 uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  undefined4 uVar6;
  int iVar7;
  uint uVar8;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 extraout_EDX;
  undefined2 extraout_var_01;
  uint *in_FS_OFFSET;
  uint in_stack_ffffffa0;
  undefined4 in_stack_ffffffa8;
  code *UNRECOVERED_JUMPTABLE;
  uint uStack_4c;
  undefined *puStack_48;
  int iStack_44;
  uint uStack_40;
  undefined *puStack_3c;
  int iStack_38;
  uint uStack_34;
  undefined *puStack_30;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  int iStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
  iVar5 = (int)register0x00000010 + -4;
  uStack_c = 0;
  uStack_10 = 0;
  iStack_14 = 0;
  uStack_18 = 0;
  uStack_1c = 0;
  uStack_20 = 0;
  puStack_30 = &UNK_00e234d0;
  uStack_34 = *in_FS_OFFSET;
  *in_FS_OFFSET = (uint)&uStack_34;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = param_1;
  if (param_1 != 0) {
    iStack_38 = 0xe230ad;
    cVar2 = func_0x0060cec0(param_1);
    UNRECOVERED_JUMPTABLE = UNRECOVERED_JUMPTABLE_00;
    if (cVar2 != '\0') {
      iStack_38 = 0xe230c3;
      iVar3 = func_0x0067213c(*(undefined4 *)(uStack_8 + 0x4cc));
      UNRECOVERED_JUMPTABLE = UNRECOVERED_JUMPTABLE_00;
      if (iVar3 != 0) {
        iStack_38 = 0xe230d7;
        func_0x00e216c0(uStack_8,0,0);
        iStack_14 = (int)*(short *)(*_DAT_0124fe08 + 0x54);
        iStack_38 = 0xe230f5;
        func_0x00729a50(*_DAT_0124fe08,CONCAT22(extraout_var,0xfff5));
        puStack_3c = &UNK_00e2349f;
        uStack_40 = *in_FS_OFFSET;
        *in_FS_OFFSET = (uint)&uStack_40;
        iStack_44 = 0xe23111;
        iStack_38 = (int)register0x00000010 + -4;
        func_0x009a9728(_UResponsiveGUI__TResponsiveGUI,0,0);
        uVar1 = *(undefined4 *)(uStack_8 + 0x4cc);
        if (uStack_8 != 0) {
          iStack_44 = 0xe23127;
          cVar2 = func_0x0060cec0(uVar1);
          if (cVar2 != '\0') {
            iStack_44 = 0xe23132;
            iVar3 = func_0x0067213c(uVar1);
            if (iVar3 != 0) {
              iStack_44 = 0xe23147;
              iVar3 = func_0x0067213c(uVar1);
              if (*(int *)(iVar3 + 0xc) != 0) {
                iStack_44 = 0xe23154;
                iVar3 = func_0x0067213c(uVar1);
                iStack_44 = 0xe2316a;
                func_0x00e216c0(uStack_8,**(undefined4 **)(iVar3 + 0xc),
                                *(undefined4 *)(uStack_8 + 0x4cc));
              }
              iStack_44 = 0xe23178;
              func_0x00608594(*(undefined4 *)(uStack_8 + 0x4cc));
              iStack_44 = 0xe23186;
              func_0x00608594(*(undefined4 *)(uStack_8 + 0x4d8));
              iStack_44 = 0xe23194;
              func_0x00608594(*(undefined4 *)(uStack_8 + 0x74c));
              puStack_48 = &UNK_00e23478;
              uStack_4c = *in_FS_OFFSET;
              *in_FS_OFFSET = (uint)&uStack_4c;
              iStack_44 = (int)register0x00000010 + -4;
              func_0x0067213c(uVar1);
              uVar4 = func_0x0066e1a0();
              func_0x00709128(*(undefined4 *)(uStack_8 + 0x60c),uVar4);
              func_0x0067213c(uVar1);
              uVar4 = func_0x0066e1a0();
              func_0x00709128(*(undefined4 *)(uStack_8 + 0x614),uVar4);
              iVar3 = func_0x0067213c(uVar1);
              func_0x0040b40c(&uStack_c,*(undefined4 *)(iVar3 + 0x30));
              iVar3 = func_0x0067213c(uVar1);
              if (*(uint *)(iVar3 + 0x14) < 3) {
                iVar3 = func_0x0067213c(uVar1);
                func_0x00e22cb8(*(undefined4 *)(iVar3 + 8));
                func_0x00e22bc8(&uStack_18);
                func_0x0040b40c(&uStack_10,uStack_18,iVar5);
                DAT_0125a165 = 1;
                iVar5 = uStack_8 + 2000;
                uVar4 = uStack_10;
                func_0x0067213c(uVar1);
                uVar6 = func_0x0066e3b0();
                func_0x00a115b0(*(undefined4 *)(uStack_8 + 0x4cc),*(undefined4 *)(uStack_8 + 0x4d8),
                                uVar6,iVar5,uVar4);
                func_0x00e22f70();
                iVar3 = *(int *)(uStack_8 + 0x4d8);
                iVar7 = func_0x0067ce80(*(undefined4 *)(iVar3 + 0x2f4));
                if (iVar7 < 1) {
                  func_0x0068297c(iVar3,0);
                  (**(code **)(**(int **)(uStack_8 + 0x4dc) + 0x170))
                            (*(int **)(uStack_8 + 0x4dc),0xffffffff);
                  func_0x007adbdc(*(undefined4 *)(uStack_8 + 0x4dc));
                  in_stack_ffffffa8 = extraout_EDX;
                  func_0x00aa27b8(*(undefined4 *)(*(int *)(uStack_8 + 0x768) + 0x314));
                  func_0x00e1529c(uStack_8);
                  func_0x00e15068(uStack_8,0);
                }
                else {
                  uVar4 = func_0x0067ced0(*(undefined4 *)(iVar3 + 0x2f4),0);
                  func_0x0068297c(iVar3,uVar4);
                  DAT_0125a165 = 0;
                  in_stack_ffffffa8 = 1;
                  uVar4 = func_0x00682964(iVar3);
                  fNotes_TfrmNotes_lvNotesSelectItem(uStack_8,uStack_8,uVar4);
                }
                DAT_0125a165 = 0;
                func_0x00e0fe84(uStack_8,1);
                func_0x00d8f7f8();
                func_0x00e15068(uStack_8,0);
                in_stack_ffffffa0 = (uint)DAT_00e234e0;
                uVar4 = func_0x01011c80(7,0,0,in_stack_ffffffa0,DAT_00e234e0);
                iVar3 = func_0x00e0fe7c(uStack_8);
                uVar8 = (uint)*(byte *)(iVar3 + 0x3f9);
                uVar6 = func_0x00e0fe7c(uStack_8);
                func_0x00d9a560(uVar6,uVar4,uVar8);
                func_0x00e205dc(uStack_8,0);
              }
              else {
                func_0x0079acec(uStack_c,CONCAT22(extraout_var_00,0x5e),1,&uStack_1c);
                iVar5 = 0xe2338e;
                iVar3 = func_0x0042d238(uStack_1c,0);
                if (0 < iVar3) {
                  (**(code **)(**(int **)(uStack_8 + 0x74c) + 400))();
                  func_0x00e238f8(uStack_8,0);
                  func_0x0079acec(uStack_c,CONCAT22(extraout_var_01,0x5e),1,&uStack_20);
                  func_0x007ae0d4(*(undefined4 *)(uStack_8 + 0x4dc),uStack_20);
                  fNotes_TfrmNotes_lstNotesClick(uStack_8,uStack_8);
                  func_0x0060ca58(*(undefined4 *)(uStack_8 + 0x74c));
                  func_0x0041c028();
                }
              }
              iVar3 = func_0x0067213c(uVar1);
              if (iVar3 != 0) {
                iVar3 = func_0x0067213c(uVar1);
                if (*(int *)(iVar3 + 0xc) != 0) {
                  iVar3 = func_0x0067213c(uVar1);
                  if (*(char *)(*(int *)(iVar3 + 0xc) + 0x3d) != '\0') {
                    func_0x006aa580(&UNK_00e234f4,2,_DAT_00e234e4,0,0xffffffff,0xffffffff,0xffffffff
                                   );
                  }
                }
              }
              *in_FS_OFFSET = in_stack_ffffffa0;
              UNRECOVERED_JUMPTABLE = (code *)&UNK_00e2347f;
              func_0x006085cc(*(undefined4 *)(uStack_8 + 0x74c),in_stack_ffffffa0,in_stack_ffffffa8,
                              &UNK_00e2347f,iVar5);
              func_0x006085cc(*(undefined4 *)(uStack_8 + 0x4d8));
              func_0x006085cc(*(undefined4 *)(uStack_8 + 0x4cc));
                    /* WARNING: Could not recover jumptable at 0x00e23476. Too many branches */
                    /* WARNING: Treating indirect jump as call */
              (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
              return;
            }
          }
        }
        iStack_44 = 0xe2313b;
        func_0x0040a734();
        UNRECOVERED_JUMPTABLE = UNRECOVERED_JUMPTABLE_00;
      }
    }
  }
  UNRECOVERED_JUMPTABLE_00 = UNRECOVERED_JUMPTABLE;
  UNRECOVERED_JUMPTABLE = UNRECOVERED_JUMPTABLE_00;
  *in_FS_OFFSET = uStack_34;
  UNRECOVERED_JUMPTABLE_00 = (code *)&UNK_00e234d7;
  puStack_30 = (undefined *)0xe234c0;
  func_0x0040b034(&uStack_20,3,UNRECOVERED_JUMPTABLE);
  puStack_30 = (undefined *)0xe234cd;
  func_0x0040b034(&uStack_10,2);
                    /* WARNING: Could not recover jumptable at 0x00e234ce. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

