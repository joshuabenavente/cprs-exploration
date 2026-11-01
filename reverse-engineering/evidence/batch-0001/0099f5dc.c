/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void Trpcb_TRPCBroker_CreateContext(int *param_1,undefined4 param_2)

{
  undefined1 *puVar1;
  code *pcVar2;
  int *piVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar5;
  undefined4 uStack_4c;
  undefined *puStack_48;
  undefined1 *puStack_44;
  undefined4 uStack_40;
  undefined *puStack_3c;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_34;
  undefined *puStack_30;
  undefined1 *puStack_2c;
  undefined4 uStack_1c;
  int *piStack_18;
  undefined1 uStack_11;
  int *piStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_1c = 0;
  uStack_c = 0;
  puStack_2c = (undefined1 *)0x99f5fb;
  piStack_10 = param_1;
  uStack_8 = param_2;
  func_0x0040b0c8(param_2);
  puStack_30 = &UNK_0099f7d9;
  uStack_34 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_34;
  UNRECOVERED_JUMPTABLE = (code *)0x99f613;
  puStack_2c = (undefined1 *)((int)register0x00000010 + -4);
  (**(code **)(*piStack_10 + 0x4c))(piStack_10,1);
  piStack_18 = (int *)0x0;
  puStack_3c = &UNK_0099f7ad;
  uStack_40 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_40;
  puStack_44 = (undefined1 *)0x99f63a;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  piStack_18 = (int *)Trpcb_TRPCBroker_Create(Trpcb__TRPCBroker.self_vmt_va,1,*_DAT_0124f460);
  piStack_18[0x1d] = piStack_10[0x1d];
  piStack_18[3] = 0x4d2;
  *(char *)(piStack_18 + 0x26) = (char)piStack_10[0x26];
  puStack_44 = (undefined1 *)0x99f674;
  (**(code **)(*piStack_18 + 0x54))(piStack_18,piStack_10[0x1c]);
  piStack_18[0x16] = piStack_10[0x16];
  *(char *)(piStack_18 + 0x15) = (char)piStack_10[0x15];
  puStack_44 = (undefined1 *)0x99f69d;
  func_0x0040b3c4(piStack_18 + 0x1a,&UNK_0099f7f8);
  puStack_44 = (undefined1 *)0x99f6aa;
  iVar4 = func_0x0099f124(piStack_18[0x17],0);
  *(undefined1 *)(iVar4 + 0x48) = 0;
  puStack_44 = (undefined1 *)0x99f6bb;
  iVar4 = func_0x0099f124(piStack_18[0x17],0);
  puStack_44 = (undefined1 *)(iVar4 + 0x44);
  puStack_48 = (undefined *)0x99f6ca;
  XWBHash_Encrypt(uStack_8,&uStack_1c);
  puVar1 = puStack_44;
  puStack_44 = (undefined1 *)0x99f6d3;
  func_0x0040b3c4(puVar1,uStack_1c);
  uVar5 = 1;
  puStack_48 = &UNK_0099f728;
  uStack_4c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_4c;
  puStack_44 = (undefined1 *)((int)register0x00000010 + -4);
  (**(code **)(*piStack_18 + 0x74))(piStack_18,&uStack_c);
  func_0x0040c324(uStack_c,&UNK_0099f82c);
  if ((bool)uVar5) {
    uStack_11 = 1;
    func_0x0040b3c4(piStack_10 + 0x14,uStack_8);
  }
  else {
    uStack_11 = 0;
    func_0x0040afd4(piStack_10 + 0x14);
  }
  puVar1 = puStack_44;
  *in_FS_OFFSET = uStack_4c;
  if (piStack_18[0x27] != 0) {
    puStack_44 = (undefined1 *)0x99f790;
    func_0x0040b3c4(piStack_10 + 0x27,piStack_18[0x27],puVar1);
  }
  piVar3 = piStack_18;
  pcVar2 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_40;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0099f7b4;
  piStack_18 = (int *)0x0;
  puStack_3c = (undefined *)0x99f7aa;
  func_0x004090bc(piVar3,0,pcVar2);
                    /* WARNING: Could not recover jumptable at 0x0099f7ab. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

