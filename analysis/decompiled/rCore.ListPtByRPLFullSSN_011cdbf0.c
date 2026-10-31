/* Static Ghidra output. Delphi register ABI and types require review. */

void rCore_ListPtByRPLFullSSN(code *param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  code *pcVar2;
  char cVar3;
  int iVar4;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined4 unaff_EBX;
  int iVar5;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar6;
  undefined *puVar7;
  undefined4 uVar8;
  undefined4 *puStack_34;
  undefined4 *puStack_30;
  undefined4 uStack_2c;
  code *UNRECOVERED_JUMPTABLE;
  code *pcStack_24;
  undefined *puStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  iVar4 = 6;
  do {
    uStack_8 = 0;
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  puStack_20 = &UNK_011cddd7;
  pcStack_24 = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &pcStack_24;
  UNRECOVERED_JUMPTABLE = (code *)0x11cdc1e;
  func_0x0040b40c(&uStack_8,param_2);
  UNRECOVERED_JUMPTABLE = (code *)0x11cdc30;
  iVar4 = func_0x0040c4b0(&UNK_011cddf4,uStack_8,1);
  while (0 < iVar4) {
    UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -0x18);
    uStack_2c = 0x11cdc4a;
    func_0x0040c35c(uStack_8,iVar4 + 1,0xc);
    puStack_30 = &uStack_1c;
    puStack_34 = (undefined4 *)0x11cdc62;
    func_0x0040c35c(uStack_8,1,iVar4 + -1);
    puVar1 = puStack_30;
    puStack_30 = (undefined4 *)0x11cdc6e;
    func_0x0040c18c(&uStack_8,uStack_1c,puVar1);
    puStack_30 = (undefined4 *)0x11cdc80;
    iVar4 = func_0x0040c4b0(&UNK_011cddf4,uStack_8,1);
  }
  uStack_2c = 0;
  puStack_30 = (undefined4 *)0x11cdc96;
  UNRECOVERED_JUMPTABLE = param_1;
  func_0x0042c1a8(uStack_8,&UNRECOVERED_JUMPTABLE);
  pcStack_24 = UNRECOVERED_JUMPTABLE;
  puStack_20 = (undefined *)CONCAT31(puStack_20._1_3_,0x11);
  puStack_30 = (undefined4 *)0x11cdcaf;
  ORNet_CallVistA(&UNK_011cde04,&pcStack_24,0);
  puStack_30 = (undefined4 *)0x0;
  puStack_34 = (undefined4 *)0x11cdcc1;
  func_0x009b3288(param_1,CONCAT22(extraout_var,0x5e),2);
  puStack_34 = (undefined4 *)0x11cdcc8;
  iVar4 = (**(code **)(*(int *)param_1 + 0x14))();
  if (-1 < iVar4 + -1) {
    iVar5 = 0;
    do {
      puStack_34 = (undefined4 *)0x11cdce3;
      (**(code **)(*(int *)param_1 + 0xc))(param_1,iVar5,&uStack_8);
      puStack_34 = &uStack_c;
      func_0x0079acec(uStack_8,CONCAT22(extraout_var_00,0x5e),3);
      func_0x0079acec(uStack_8,CONCAT22(extraout_var_01,0x5e),4,(int)register0x00000010 + -0x10);
      cVar3 = func_0x011ca654(uStack_c);
      if (cVar3 != '\0') {
        func_0x009b1794(&UNK_011cde34,uStack_c,&uStack_2c);
        func_0x0040b40c(&uStack_c,uStack_2c);
      }
      cVar3 = func_0x011ca608(unaff_EBX);
      if (cVar3 != '\0') {
        func_0x011ca4f0(unaff_EBX,&puStack_30);
        func_0x0040b40c((int)register0x00000010 + -0x10,puStack_30);
      }
      puVar7 = &UNK_011cde58;
      uVar6 = uStack_c;
      uVar8 = unaff_EBX;
      func_0x0040c214(&puStack_34,3);
      func_0x0079af38(&uStack_8,CONCAT22(extraout_var_02,0x5e),3,puStack_34,uVar6,puVar7,uVar8);
      (**(code **)(*(int *)param_1 + 0x20))(param_1,iVar5,uStack_8);
      iVar5 = iVar5 + 1;
      iVar4 = iVar4 + -1;
    } while (iVar4 != 0);
  }
  puStack_34 = (undefined4 *)0x11cdda0;
  func_0x009b2cf8(param_1);
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = puStack_30;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011cddde;
  uStack_2c = 0x11cddba;
  func_0x0040b034(&puStack_34,4,pcVar2);
  uStack_2c = 0x11cddc7;
  func_0x0040b034(&uStack_1c,2);
  uStack_2c = 0x11cddd4;
  func_0x0040b034((int)register0x00000010 + -0x10,3);
                    /* WARNING: Could not recover jumptable at 0x011cddd5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

