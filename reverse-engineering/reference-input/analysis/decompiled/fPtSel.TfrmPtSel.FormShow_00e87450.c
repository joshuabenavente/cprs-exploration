/* Static Ghidra output. Delphi register ABI and types require review. */

void fPtSel_TfrmPtSel_FormShow(int param_1,undefined4 param_2)

{
  code *pcVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 uVar4;
  int iVar5;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 uVar6;
  undefined4 *puVar7;
  byte *pbVar8;
  int *in_FS_OFFSET;
  bool bVar9;
  undefined1 uVar10;
  byte bVar11;
  code *UNRECOVERED_JUMPTABLE;
  undefined *puStack_50;
  undefined1 *puStack_4c;
  undefined4 uStack_3c;
  byte abStack_36 [32];
  ushort uStack_16;
  int iStack_14;
  undefined4 uStack_10;
  ushort *puStack_c;
  undefined4 uStack_8;
  
  bVar11 = 0;
  puStack_4c = abStack_36 + 0x32;
  uStack_3c = 0;
  uStack_8 = 0;
  puStack_c = (ushort *)0x0;
  puStack_50 = &UNK_00e875ae;
  UNRECOVERED_JUMPTABLE = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = (int)&UNRECOVERED_JUMPTABLE;
  uStack_10 = param_2;
  iVar2 = func_0x0067ce80(*(undefined4 *)(*(int *)(param_1 + 0x4bc) + 0x2f4));
  if (iVar2 == 0) {
    func_0x00724140(param_1,*(undefined4 *)(param_1 + 0x480));
  }
  func_0x011cc04c(&uStack_8);
  func_0x0079acec(uStack_8,CONCAT22(extraout_var,0x5e),1,&puStack_c);
  uVar10 = puStack_c == (ushort *)0x0;
  uVar6 = extraout_var_00;
  if ((bool)uVar10) {
    func_0x0040b40c(&puStack_c,&UNK_00e875c8);
    uVar6 = extraout_var_01;
  }
  func_0x0079acec(uStack_8,CONCAT22(uVar6,0x5e),2);
  func_0x0040b3c4(param_1 + 0x528,uStack_3c);
  func_0x0040c324(*(undefined4 *)(param_1 + 0x528),&UNK_00e875d8);
  if ((bool)uVar10) {
    *(undefined1 *)(param_1 + 0x524) = 1;
  }
  else {
    *(undefined1 *)(param_1 + 0x524) = 0;
  }
  iVar2 = *(int *)(*(int *)(*(int *)(*(int *)(param_1 + 0x4bc) + 0x30c) + 8) + 8);
  if (-1 < iVar2 + -1) {
    iStack_14 = 0;
    puVar3 = (undefined4 *)0x1239380;
    do {
      uStack_16 = *puStack_c;
      puVar7 = puVar3;
      pbVar8 = abStack_36;
      for (iVar5 = 8; iVar5 != 0; iVar5 = iVar5 + -1) {
        *(undefined4 *)pbVar8 = *puVar7;
        puVar7 = puVar7 + (uint)bVar11 * -2 + 1;
        pbVar8 = pbVar8 + ((uint)bVar11 * -2 + 1) * 4;
      }
      bVar9 = uStack_16 < 0xff;
      if (uStack_16 < 0x100) {
        bVar9 = (abStack_36[(int)(uint)uStack_16 >> 3] >> (uStack_16 & 7) & 1) != 0;
      }
      if (bVar9) {
        uVar4 = func_0x0067b704(*(undefined4 *)(*(int *)(param_1 + 0x4bc) + 0x30c),iStack_14);
        func_0x00e8624c(param_1,uStack_10,uVar4);
        break;
      }
      iStack_14 = iStack_14 + 1;
      puVar3 = puVar3 + 0xc;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = (int)&uStack_3c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e875b5;
  func_0x0040afd4(&uStack_3c,&uStack_3c,pcVar1);
  func_0x0040b034(&puStack_c,2);
                    /* WARNING: Could not recover jumptable at 0x00e875ac. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

