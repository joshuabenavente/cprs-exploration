/* Static Ghidra output. Delphi register ABI and types require review. */

void rCore_ListPtByRPLLast5(code *param_1,undefined4 param_2)

{
  code *pcVar1;
  char cVar2;
  int iVar3;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined4 unaff_EBX;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar5;
  undefined *puVar6;
  undefined4 uVar7;
  undefined4 uStack_2c;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_24;
  undefined *puStack_20;
  undefined1 *puStack_1c;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  iVar3 = 5;
  do {
    uStack_8 = 0;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  puStack_20 = &UNK_011cd915;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  uStack_2c = 0;
  UNRECOVERED_JUMPTABLE = param_1;
  func_0x0042c1a8(param_2,&puStack_20);
  puStack_1c = puStack_20;
  ORNet_CallVistA(&UNK_011cd930,&puStack_1c,0);
  func_0x009b3288(param_1,CONCAT22(extraout_var,0x5e),2);
  iVar3 = (**(code **)(*(int *)param_1 + 0x14))();
  if (-1 < iVar3 + -1) {
    iVar4 = 0;
    do {
      (**(code **)(*(int *)param_1 + 0xc))(param_1,iVar4,&uStack_8);
      func_0x0079acec(uStack_8,CONCAT22(extraout_var_00,0x5e),3,&uStack_c);
      func_0x0079acec(uStack_8,CONCAT22(extraout_var_01,0x5e),4,(int)register0x00000010 + -0x10);
      cVar2 = func_0x011ca654(uStack_c);
      if (cVar2 != '\0') {
        func_0x009b1794(&UNK_011cd95c,uStack_c,&uStack_24);
        func_0x0040b40c(&uStack_c,uStack_24);
      }
      cVar2 = func_0x011ca608(unaff_EBX);
      if (cVar2 != '\0') {
        func_0x011ca4f0(unaff_EBX,&UNRECOVERED_JUMPTABLE);
        func_0x0040b40c((int)register0x00000010 + -0x10,UNRECOVERED_JUMPTABLE);
      }
      puVar6 = &UNK_011cd980;
      uVar5 = uStack_c;
      uVar7 = unaff_EBX;
      func_0x0040c214(&uStack_2c,3);
      func_0x0079af38(&uStack_8,CONCAT22(extraout_var_02,0x5e),3,uStack_2c,uVar5,puVar6,uVar7);
      (**(code **)(*(int *)param_1 + 0x20))(param_1,iVar4,uStack_8);
      iVar4 = iVar4 + 1;
      iVar3 = iVar3 + -1;
    } while (iVar3 != 0);
  }
  func_0x009b2cf8(param_1);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = 0;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011cd91c;
  uStack_2c = 0x11cd905;
  func_0x0040b034(&uStack_2c,4,pcVar1);
  uStack_2c = 0x11cd912;
  func_0x0040b034((int)register0x00000010 + -0x10,3);
                    /* WARNING: Could not recover jumptable at 0x011cd913. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

