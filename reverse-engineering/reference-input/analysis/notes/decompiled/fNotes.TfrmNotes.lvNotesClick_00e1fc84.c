/* Static Ghidra output. Delphi register ABI and types require review. */

void fNotes_TfrmNotes_lvNotesClick(void)

{
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_24;
  undefined4 uStack_20;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 auStack_c [2];
  
  auStack_c[0] = 0;
  uStack_24 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_24;
  *in_FS_OFFSET = uStack_24;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00e1fd95;
  uStack_20 = 0xe1fd8b;
  func_0x0040afd4(auStack_c,uStack_24,auStack_c + 2);
                    /* WARNING: Could not recover jumptable at 0x00e1fd8c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

