/* Unverified decompiler output; inspect assembly and ABI. */

void rTIU_Submit(undefined4 param_1,undefined4 param_2,undefined4 param_3,int param_4)

{
  int *piVar1;
  int iVar2;
  undefined2 extraout_var;
  undefined4 uVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 uStackY_50;
  undefined4 uStack_44;
  undefined *puStack_40;
  undefined1 *puStack_3c;
  undefined4 uStack_38;
  undefined *puStack_34;
  undefined1 *puStack_30;
  undefined4 uStack_24;
  int iStack_20;
  undefined1 uStack_1c;
  undefined4 uStack_18;
  undefined1 uStack_14;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  puStack_30 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_24 = 0;
  puStack_34 = &UNK_00a0d472;
  uStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_38;
  puStack_3c = (undefined1 *)0xa0d389;
  piVar1 = (int *)func_0x004d81f4(System_Classes__TStringList.self_vmt_va,1);
  puStack_40 = &UNK_00a0d453;
  uStack_44 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_44;
  if (*(int *)(param_4 + -4) == 1) {
    uVar3 = 1;
  }
  else if ((*(int *)(param_4 + -8) == 1) || (*(int *)(param_4 + -0xc) < *(int *)(param_4 + -8))) {
    uVar3 = 1;
  }
  else {
    uVar3 = 0;
  }
  iStack_20 = param_4 + 8;
  uStack_1c = 0x10;
  uStack_18 = *(undefined4 *)(param_4 + -0x10);
  uStack_14 = 0xe;
  uStack_10 = *(undefined4 *)(param_4 + -4);
  uStack_c = 0;
  puStack_3c = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = piVar1;
  ORNet_CallVistA(&UNK_00a0d48c,&iStack_20,2,uVar3);
  iVar2 = (**(code **)(*uStack_8 + 0x14))();
  if (iVar2 < 1) {
    uStackY_50 = 0xa0d43b;
    func_0x0040b3c4(param_1,&UNK_00a0d4c4);
  }
  else {
    (**(code **)(*uStack_8 + 0xc))(uStack_8,0,&uStack_24);
    func_0x009b2f6c(uStack_24,CONCAT22(extraout_var,0x5e),4);
    uStackY_50 = param_1;
  }
  *in_FS_OFFSET = uStackY_50;
  func_0x004090bc(uStack_8,uStackY_50,piVar1);
                    /* WARNING: Could not recover jumptable at 0x00a0d451. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)&UNK_00a0d45a)(&UNK_00a0d45a);
  return;
}

