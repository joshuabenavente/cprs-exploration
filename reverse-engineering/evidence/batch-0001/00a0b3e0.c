/* Unverified decompiler output; inspect assembly and ABI. */

void rTIU_CosignDocument(undefined4 param_1)

{
  undefined4 *in_FS_OFFSET;
  undefined4 uVar1;
  undefined4 uStack_20;
  undefined *puStack_1c;
  undefined1 *puStack_18;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  puStack_18 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  puStack_1c = &UNK_00a0b440;
  uStack_20 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_20;
  uVar1 = 0;
  uStack_c = 0;
  uStack_10 = param_1;
  ORNet_CallVistA(&UNK_00a0b45c,&uStack_10,0,0,0);
  func_0x0040c324(uStack_8,&UNK_00a0b4a0);
  *in_FS_OFFSET = uVar1;
  func_0x0040afd4(&uStack_8,uVar1,&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00a0b43e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)&UNK_00a0b447)(&UNK_00a0b447);
  return;
}

