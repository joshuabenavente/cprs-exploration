/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rCover_DetailProblem(undefined4 param_1)

{
  undefined4 uVar1;
  uint uVar2;
  undefined4 *in_FS_OFFSET;
  float10 fVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uStack_48;
  undefined *puStack_44;
  undefined1 *puStack_40;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined1 uStack_28;
  undefined4 uStack_24;
  undefined1 uStack_20;
  undefined4 uStack_1c;
  undefined1 uStack_18;
  undefined1 auStack_14 [8];
  ushort uStack_c;
  undefined1 auStack_a [6];
  
  puStack_40 = auStack_a + 6;
  uStack_30 = 0;
  uStack_34 = 0;
  puStack_44 = &UNK_00bf032b;
  uStack_48 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_48;
  uVar1 = func_0x004d81f4(_System_Classes__TStringList,1);
  fVar3 = (float10)*(double *)(*_DAT_0124e2a0 + 8);
  uVar9 = 0;
  uVar8 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  puVar7 = &UNK_00bf0348;
  uStack_c = (ushort)((unkuint10)fVar3 >> 0x40);
  uVar2 = (uint)uStack_c;
  auStack_14._4_4_ = SUB104((unkuint10)fVar3 >> 0x20,0);
  auStack_14._0_4_ = SUB104(fVar3,0);
  uVar5 = auStack_14._0_4_;
  uVar6 = auStack_14._4_4_;
  _auStack_14 = fVar3;
  func_0x00430914(_DAT_0124f788,&uStack_34);
  uVar4 = uStack_34;
  func_0x0040c214(&uStack_30,3);
  uStack_2c = uStack_30;
  uStack_28 = 0x11;
  uStack_20 = 0;
  uStack_1c = 0;
  uStack_18 = 0x11;
  uStack_24 = param_1;
  ORNet_CallVistA(&UNK_00bf0358,&uStack_2c,2,uVar4,uVar5,uVar6,uVar2,puVar7,uVar8,uVar9,uVar1);
  *in_FS_OFFSET = uVar4;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bf0332;
  func_0x0040b034(&uStack_34,2,uVar6);
                    /* WARNING: Could not recover jumptable at 0x00bf0329. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

