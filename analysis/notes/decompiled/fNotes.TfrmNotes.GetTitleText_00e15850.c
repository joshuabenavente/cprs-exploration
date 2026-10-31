/* Static Ghidra output. Delphi register ABI and types require review. */

void fNotes_TfrmNotes_GetTitleText(int param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined4 unaff_EBX;
  undefined4 unaff_ESI;
  undefined4 unaff_EDI;
  undefined4 *in_FS_OFFSET;
  float10 in_ST0;
  undefined4 uStackY_60;
  undefined4 **ppuVar3;
  undefined4 *in_stack_ffffffa8;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puVar4;
  undefined4 *puVar5;
  undefined *puVar6;
  undefined4 uVar7;
  undefined8 uStack_34;
  undefined4 *puStack_2c;
  undefined4 uStack_28;
  undefined *puStack_24;
  undefined4 uStack_20;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_20 = (undefined1 *)((int)register0x00000010 + -4);
  iVar2 = 5;
  do {
    uStack_c = 0;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  LOCK();
  UNLOCK();
  uStack_8 = 0;
  puStack_24 = &UNK_00e159bb;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  puStack_2c = (undefined4 *)0xe15886;
  piVar1 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
  puStack_2c = (undefined4 *)0xe1588b;
  iVar2 = (**(code **)(*piVar1 + 0x14))();
  if (param_2 < iVar2) {
    puStack_2c = &uStack_10;
    uStack_34 = (double)CONCAT44(0xe158a2,(undefined4)uStack_34);
    piVar1 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
    uStack_34 = (double)CONCAT44(0xe158ac,(undefined4)uStack_34);
    (**(code **)(*piVar1 + 0xc))(piVar1,param_2,(int)register0x00000010 + -0x14);
    uStack_34 = (double)CONCAT44(0xe158bd,(undefined4)uStack_34);
    func_0x0079acec(unaff_EBX,CONCAT22(extraout_var,0x5e),3);
    uStack_34 = (double)CONCAT44(0xe158c5,(undefined4)uStack_34);
    func_0x009b18cc(uStack_10);
    uStack_34 = (double)in_ST0;
    func_0x009b11a0(&UNK_00e159d8,&uStack_c);
    puVar6 = &UNK_00e159f8;
    iVar2 = (int)register0x00000010 + -0x18;
    uVar7 = uStack_c;
    piVar1 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
    (**(code **)(*piVar1 + 0xc))(piVar1,param_2,(int)register0x00000010 + -0x1c,iVar2,puVar6,uVar7);
    func_0x0079acec(unaff_EDI,CONCAT22(extraout_var_00,0x5e),2);
    puVar6 = &UNK_00e15a0c;
    puVar5 = &uStack_20;
    piVar1 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
    (**(code **)(*piVar1 + 0xc))(piVar1,param_2,&puStack_24,puVar5,puVar6,unaff_ESI);
    func_0x0079acec(puStack_24,CONCAT22(extraout_var_01,0x5e),6);
    puVar6 = &UNK_00e15a0c;
    in_stack_ffffffa8 = &uStack_28;
    ppuVar3 = &puStack_2c;
    puVar4 = uStack_20;
    piVar1 = (int *)func_0x007b1014(*(undefined4 *)(param_1 + 0x4dc));
    (**(code **)(*piVar1 + 0xc))
              (piVar1,param_2,(int)&uStack_34 + 4,ppuVar3,in_stack_ffffffa8,puVar6,puVar4);
    func_0x0079acec(uStack_34._4_4_,CONCAT22(extraout_var_02,0x5e),5);
    func_0x0079acec(puStack_2c,CONCAT22(extraout_var_03,0x3b),2);
    uStackY_60 = uStack_28;
    func_0x0040c214(uStack_8,7);
  }
  else {
    puStack_2c = (undefined4 *)0xe1599e;
    func_0x0040afd4(uStack_8);
  }
  *in_FS_OFFSET = uStackY_60;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e159c2;
  func_0x0040b034((int)&uStack_34 + 4,10,in_stack_ffffffa8);
                    /* WARNING: Could not recover jumptable at 0x00e159b9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

