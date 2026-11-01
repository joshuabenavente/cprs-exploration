/* Unverified decompiler output; inspect assembly and ABI. */

void uWriteAccess_TWriteAccess_WriteAccess
               (int param_1,uint param_2,undefined1 param_3,undefined4 param_4,byte param_5)

{
  code *pcVar1;
  undefined4 uVar2;
  uint uVar3;
  undefined4 *in_FS_OFFSET;
  byte bVar4;
  undefined4 *puVar5;
  undefined4 uStack_24;
  undefined1 *puStack_20;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_c;
  byte bStack_6;
  undefined1 uStack_5;
  
  uStack_c = 0;
  UNRECOVERED_JUMPTABLE = (code *)0x1011301;
  uStack_5 = param_3;
  System__UStrAddRef(param_4);
  puStack_20 = &LAB_010113b1;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  uVar3 = param_2 & 0x7f;
  if (*(char *)(param_1 + 0x17 + uVar3) == '\0') {
    if ((char)param_2 == '\0') {
      bStack_6 = 1;
      *(undefined1 *)(param_1 + 0x17 + uVar3) = 1;
      *(undefined1 *)(param_1 + 4 + uVar3) = 1;
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
    }
    else {
      puVar5 = &uStack_c;
      UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
      uVar2 = uCore_SystemParameters();
      bVar4 = 1;
      fEncVitals_TJSONParameters_AsTypeDef<System_string>
                (uVar2,*(undefined4 *)(&DAT_012397a4 + uVar3 * 0x14),0,puVar5);
      System__UStrEqual(uStack_c,&DAT_010113d4);
      bStack_6 = bVar4;
    }
    *(byte *)(param_1 + 4 + uVar3) = bStack_6;
    *(undefined1 *)(param_1 + 0x17 + uVar3) = 1;
  }
  else {
    bStack_6 = *(byte *)(param_1 + 4 + uVar3);
    UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  }
  if (((bStack_6 ^ 1) & param_5) != 0) {
    uWriteAccess_TWriteAccess_Error(param_1,param_2,uStack_5,0,0,param_4);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_24;
  UNRECOVERED_JUMPTABLE = (code *)&LAB_010113b8;
  puStack_20 = (undefined1 *)0x10113a6;
  System__UStrClr(&uStack_c,uStack_24,pcVar1);
  puStack_20 = (undefined1 *)0x10113ae;
  System__UStrClr(&param_4);
                    /* WARNING: Could not recover jumptable at 0x010113af. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

