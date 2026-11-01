/* Unverified decompiler output; inspect assembly and ABI. */

void Trpcb_TRPCBroker_StartSecureConnection(int param_1,undefined4 param_2,undefined4 param_3)

{
  code *pcVar1;
  char cVar2;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_3c;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_34;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_34 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  uStack_c = 0;
  uStack_10 = 0;
  uStack_14 = 0;
  uStack_18 = 0;
  uStack_1c = 0;
  uStack_20 = 0;
  uStack_24 = 0;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_009a304e;
  uStack_3c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_3c;
  *(undefined4 *)(param_1 + 0x10c) = 0;
  func_0x0040b3c4(param_3,*(undefined4 *)(param_1 + 0xe4));
  if (*(int *)(param_1 + 0xe4) == 0) {
    func_0x0042cfdc(*(undefined4 *)(param_1 + 0x58),&uStack_10);
    func_0x0040b3c4(param_3,uStack_10);
  }
  func_0x0040b3c4(param_2,*(undefined4 *)(param_1 + 0x70));
  if (*(int *)(param_1 + 0xe8) == 0) {
    func_0x009a2dc8(param_1,&uStack_14);
    func_0x0040b3c4(param_1 + 0xe8,uStack_14);
  }
  if (*(char *)(param_1 + 0xe0) == '\x01') {
    cVar2 = func_0x00512534(*(undefined4 *)(param_1 + 0x70),&UNK_009a306c);
    if (cVar2 == '\0') {
      func_0x0042cfdc(*(undefined4 *)(param_1 + 0x58),&uStack_1c);
      func_0x0040c214(&uStack_c,5);
    }
    else {
      func_0x0042cfdc(*(undefined4 *)(param_1 + 0x58),&uStack_18);
      func_0x0040c214(&uStack_c,5);
    }
    func_0x0040c214(&uStack_8,8);
  }
  if (*(char *)(param_1 + 0xe0) == '\x02') {
    if (*(int *)(param_1 + 0xec) == 0) {
      func_0x009a2e00(param_1,&uStack_20);
      func_0x0040b3c4(param_1 + 0xec,uStack_20);
    }
    func_0x0042cfdc(*(undefined4 *)(param_1 + 0x58),&uStack_24);
    func_0x0040c214(&uStack_c,5);
    func_0x0040c214(&uStack_8,8);
  }
  if (*(char *)(param_1 + 0xf0) == '\0') {
    func_0x00996390(uStack_8,0,2);
  }
  else {
    func_0x00996390(uStack_8,0,0);
  }
  func_0x0041b398();
  pcVar1 = UNRECOVERED_JUMPTABLE;
  if (*(int *)(param_1 + 0xe8) != 0) {
    *(undefined4 *)(param_1 + 0x10c) = 2;
  }
  *in_FS_OFFSET = 5000;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_009a3055;
  uStack_3c = 0x9a304b;
  func_0x0040b034(&uStack_24,8,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x009a304c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

