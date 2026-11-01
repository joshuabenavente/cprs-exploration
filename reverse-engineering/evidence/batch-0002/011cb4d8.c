/* Unverified decompiler output; inspect assembly and ABI. */

void rCore_ValidESCode(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  char cVar1;
  undefined4 *in_FS_OFFSET;
  undefined4 uVar2;
  undefined4 uStack_24;
  undefined1 *puStack_20;
  undefined1 *puStack_1c;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  puStack_1c = (undefined1 *)((int)register0x00000010 + -4);
  uStack_14 = 0;
  uStack_8 = 0;
  puStack_20 = &LAB_011cb55d;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  uVar2 = 0;
  XWBHash_Encrypt(param_1,&uStack_14,param_3,0,0);
  uStack_10 = uStack_14;
  uStack_c = 0x11;
  cVar1 = ORNet_CallVistA(L"ORWU VALIDSIG",&uStack_10,0);
  if (cVar1 != '\0') {
    System__UStrEqual(uStack_8,&DAT_011cb5a0);
  }
  *in_FS_OFFSET = uVar2;
  System__UStrClr(&uStack_14,uVar2,&uStack_8);
  System__UStrClr(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x011cb55b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)&LAB_011cb564)(&LAB_011cb564);
  return;
}

