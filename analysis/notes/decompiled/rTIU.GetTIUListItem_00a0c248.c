/* Static Ghidra output. Delphi register ABI and types require review. */

void rTIU_GetTIUListItem(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined1 param_4
                        )

{
  undefined1 *puStack_c;
  undefined1 uStack_8;
  
  puStack_c = &param_4;
  uStack_8 = 0x10;
  ORNet_CallVistA(&UNK_00a0c280,&puStack_c,0,0,0,param_1);
  return;
}

