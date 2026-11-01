/* Unverified decompiler output; inspect assembly and ABI. */

void ORRedirect_TORRedirect_Start(void)

{
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_20;
  undefined *puStack_1c;
  undefined1 *puStack_18;
  
  puStack_18 = (undefined1 *)((int)register0x00000010 + -4);
  if (DAT_01259088 == '\0') {
    puStack_1c = &DAT_009bd267;
    uStack_20 = *in_FS_OFFSET;
    *in_FS_OFFSET = &uStack_20;
    DAT_01259088 = '\x01';
    ORRedirect_StartIntercepting();
    *in_FS_OFFSET = uStack_20;
  }
  return;
}

