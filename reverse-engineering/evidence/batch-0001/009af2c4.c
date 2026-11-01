/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void ORNet_ConnectToServer(undefined4 param_1)

{
  code *pcVar1;
  int iVar2;
  undefined4 uVar3;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined4 unaff_EBX;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar5;
  undefined4 uStack_34;
  undefined4 *puStack_30;
  int *piStack_2c;
  undefined4 uStack_28;
  undefined *puStack_24;
  code *UNRECOVERED_JUMPTABLE;
  undefined2 uVar6;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_10 = 4;
  do {
    uStack_8 = 0;
    uStack_10 = uStack_10 + -1;
  } while (uStack_10 != 0);
  puStack_24 = &UNK_009af53f;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  ORNet_RPCTestRetry = 0;
  ORNet_RPCTestFail = 0;
  uVar3 = 0;
  uVar6 = 0;
  piStack_2c = (int *)0x9af308;
  func_0x0040afd4(&uStack_8);
  piStack_2c = (int *)0x9af310;
  func_0x0040afd4(&iStack_c);
  piStack_2c = (int *)0x9af315;
  iVar2 = func_0x00407d54();
  uVar5 = iVar2 == 0;
  if (0 < iVar2) {
    iVar4 = 1;
    do {
      piStack_2c = (int *)0x9af32e;
      func_0x00407db8(iVar4,&UNRECOVERED_JUMPTABLE);
      piStack_2c = (int *)0x9af339;
      func_0x0042c1a8(UNRECOVERED_JUMPTABLE,(int)register0x00000010 + -0x14);
      piStack_2c = (int *)0x9af346;
      func_0x0040c324(unaff_EBX,&UNK_009af55c);
      if ((bool)uVar5) {
        ORNet_RPCTestRetry = 1;
      }
      piStack_2c = (int *)0x9af35c;
      func_0x0040c324(unaff_EBX,&UNK_009af584);
      if ((bool)uVar5) {
        ORNet_RPCTestFail = 1;
      }
      piStack_2c = (int *)0x9af372;
      func_0x0040c324(unaff_EBX,&UNK_009af5ac);
      if ((bool)uVar5) {
        uVar3 = CONCAT13(1,(int3)uVar3);
      }
      piStack_2c = (int *)0x9af385;
      func_0x0040c324(unaff_EBX,&UNK_009af5c4);
      if ((bool)uVar5) {
        DAT_01258fe4 = 1;
      }
      piStack_2c = (int *)0x9af39b;
      func_0x0040c324(unaff_EBX,&UNK_009af5e4);
      if ((bool)uVar5) {
        uVar3 = CONCAT13((char)((uint)uVar3 >> 0x18),0x10000);
      }
      uVar6 = (undefined2)((uint)uVar3 >> 0x10);
      piStack_2c = &uStack_10;
      puStack_30 = (undefined4 *)0x9af3b6;
      func_0x009b2f6c(unaff_EBX,CONCAT22(extraout_var,0x3d),1);
      puStack_30 = (undefined4 *)0x9af3c3;
      func_0x0040c324(uStack_10,&UNK_009af604);
      if ((bool)uVar5) {
LAB_009af3d4:
        puStack_30 = &uStack_8;
        uStack_34 = 0x9af3e2;
        func_0x00407db8(iVar4,&puStack_24);
        uStack_34 = 0x9af3f3;
        func_0x009b2f6c(puStack_24,CONCAT22(extraout_var_00,0x3d),2);
      }
      else {
        puStack_30 = (undefined4 *)0x9af3d2;
        func_0x0040c324(uStack_10,&UNK_009af614);
        if ((bool)uVar5) goto LAB_009af3d4;
      }
      puStack_30 = (undefined4 *)0x9af400;
      func_0x0040c324(uStack_10,&UNK_009af630);
      if ((bool)uVar5) {
LAB_009af411:
        piStack_2c = &iStack_c;
        puStack_30 = (undefined4 *)0x9af41f;
        func_0x00407db8(iVar4,&uStack_28);
        puStack_30 = (undefined4 *)0x9af430;
        func_0x009b2f6c(uStack_28,CONCAT22(extraout_var_01,0x3d),2);
      }
      else {
        piStack_2c = (int *)0x9af40f;
        func_0x0040c324(uStack_10,&UNK_009af640);
        if ((bool)uVar5) goto LAB_009af411;
      }
      iVar4 = iVar4 + 1;
      iVar2 = iVar2 + -1;
      uVar5 = iVar2 == 0;
    } while (!(bool)uVar5);
  }
  if ((uStack_8 == 0) || (iStack_c == 0)) {
    piStack_2c = (int *)0x9af44f;
    iVar2 = func_0x0099916c(&uStack_8,&iStack_c);
    if (iVar2 == 2) goto LAB_009af515;
  }
  puStack_30 = (undefined4 *)&UNK_009af4c2;
  uStack_34 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_34;
  piStack_2c = (int *)((int)register0x00000010 + -4);
  func_0x009ace6c();
  *(char *)(_DAT_01258fcc + 0x10) = (char)uVar6;
  uVar3 = func_0x0042d238(iStack_c,0x23f0);
  func_0x009af244(uStack_8,uVar3,(char)((ushort)uVar6 >> 8));
  func_0x009af288(param_1);
  (**(code **)(*_DAT_01258fcc + 0x58))(_DAT_01258fcc,300);
  *in_FS_OFFSET = uStack_34;
LAB_009af515:
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_009af546;
  puStack_24 = (undefined *)0x9af52f;
  func_0x0040b034(&uStack_28,3,pcVar1);
  puStack_24 = (undefined *)0x9af53c;
  func_0x0040b034((int)register0x00000010 + -0x14,4);
                    /* WARNING: Could not recover jumptable at 0x009af53d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

