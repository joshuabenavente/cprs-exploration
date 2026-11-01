/* Unverified decompiler output; inspect assembly and ABI. */

void Trpcb_TRPCBroker_Call(int *param_1)

{
  code *pcVar1;
  undefined4 uVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_18;
  undefined *puStack_14;
  code *UNRECOVERED_JUMPTABLE;
  
  UNRECOVERED_JUMPTABLE = (code *)0x99f897;
  uVar2 = func_0x004d81f4(System_Classes__TStringList.self_vmt_va,1);
  puStack_14 = &UNK_0099f8e9;
  uStack_18 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_18;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  if (*(char *)((int)param_1 + 0x4d) != '\0') {
    UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
    (**(code **)(*param_1 + 0x48))(param_1,1);
  }
  (**(code **)(*param_1 + 0x6c))(param_1,uVar2);
  (**(code **)(*(int *)param_1[0x18] + 0x44))((int *)param_1[0x18],uVar2);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_18;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_0099f8f0;
  puStack_14 = (undefined *)0x99f8e6;
  func_0x004090bc(uVar2,0,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x0099f8e7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

