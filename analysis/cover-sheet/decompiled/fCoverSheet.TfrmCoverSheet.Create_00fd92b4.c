/* Static Ghidra output. Delphi register ABI and types require review. */

int fCoverSheet_TfrmCoverSheet_Create(int param_1,char param_2)

{
  char extraout_DL;
  char cVar1;
  undefined4 unaff_ESI;
  undefined4 *in_FS_OFFSET;
  
  cVar1 = '\0';
  if (param_2 != '\0') {
    param_1 = func_0x004096ac();
    cVar1 = extraout_DL;
  }
  func_0x011c5f98(param_1,0);
  *(undefined4 *)(param_1 + 0x488) = 0;
  *(undefined4 *)(param_1 + 0x484) = 0;
  *(undefined4 *)(param_1 + 0x48c) = 0;
  if (cVar1 != '\0') {
    func_0x00409704(param_1);
    *in_FS_OFFSET = unaff_ESI;
  }
  return param_1;
}

