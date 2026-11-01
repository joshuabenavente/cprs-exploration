/* Unverified decompiler output; inspect assembly and ABI. */

void ORNet_CallBroker(undefined4 param_1,undefined4 param_2)

{
  code *pcVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  code *UNRECOVERED_JUMPTABLE;
  
  UNRECOVERED_JUMPTABLE = (code *)0x9af1fb;
  ORNet_LockBroker();
  uStack_18 = 0x9af234;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  ORNet_UpdateContext(ORNet_uBaseContext);
  ORNet_CallBrokerInContext(param_1,param_2);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)0x9af23b;
  uStack_18 = 0x9af231;
  ORNet_UnlockBroker(0,uStack_1c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x009af232. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

