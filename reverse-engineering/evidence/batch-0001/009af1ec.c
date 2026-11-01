/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void ORNet_CallBroker(undefined4 param_1,undefined4 param_2)

{
  code *pcVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  
  UNRECOVERED_JUMPTABLE = (code *)0x9af1fb;
  func_0x009acd20();
  puStack_18 = &UNK_009af234;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x009ae170(_ORNet_uBaseContext);
  ORNet_CallBrokerInContext(param_1,param_2);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_009af23b;
  puStack_18 = (undefined *)0x9af231;
  func_0x009acd2c(0,uStack_1c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x009af232. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

