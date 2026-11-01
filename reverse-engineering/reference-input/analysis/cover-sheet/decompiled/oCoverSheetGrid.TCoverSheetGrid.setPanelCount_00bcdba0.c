/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void oCoverSheetGrid_TCoverSheetGrid_setPanelCount(int param_1,int param_2)

{
  undefined4 *puVar1;
  int iVar2;
  int iStack_27c;
  undefined1 uStack_278;
  
  func_0x0040eadc(param_1 + 0x10,_DAT_00bcd7fc);
  if ((param_2 < 1) || (0xc < param_2)) {
    uStack_278 = 0;
    iStack_27c = param_2;
    func_0x00435fdc(_System_SysUtils__Exception,1,&UNK_00bce82c,0,&iStack_27c);
    func_0x0040a640();
  }
  else {
    func_0x0040e9b8(param_1 + 0x10,_DAT_00bcd7fc,1,param_2);
  }
  switch(param_2) {
  default:
    *(undefined4 *)(param_1 + 0xc) = 0;
    break;
  case 1:
    *(undefined4 *)(param_1 + 0xc) = 1;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    break;
  case 2:
    *(undefined4 *)(param_1 + 0xc) = 1;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    break;
  case 3:
    *(undefined4 *)(param_1 + 0xc) = 2;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 0;
    *(undefined4 *)(iVar2 + 0x14) = 1;
    break;
  case 4:
    *(undefined4 *)(param_1 + 0xc) = 2;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 0;
    *(undefined4 *)(iVar2 + 0x14) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 1;
    *(undefined4 *)(iVar2 + 0x1c) = 1;
    break;
  case 5:
    *(undefined4 *)(param_1 + 0xc) = 2;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 2;
    *(undefined4 *)(iVar2 + 0x14) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 0;
    *(undefined4 *)(iVar2 + 0x1c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x20) = 1;
    *(undefined4 *)(iVar2 + 0x24) = 1;
    break;
  case 6:
    *(undefined4 *)(param_1 + 0xc) = 2;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 2;
    *(undefined4 *)(iVar2 + 0x14) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 0;
    *(undefined4 *)(iVar2 + 0x1c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x20) = 1;
    *(undefined4 *)(iVar2 + 0x24) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x28) = 2;
    *(undefined4 *)(iVar2 + 0x2c) = 1;
    break;
  case 7:
    *(undefined4 *)(param_1 + 0xc) = 3;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 2;
    *(undefined4 *)(iVar2 + 0x14) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 0;
    *(undefined4 *)(iVar2 + 0x1c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x20) = 1;
    *(undefined4 *)(iVar2 + 0x24) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x28) = 0;
    *(undefined4 *)(iVar2 + 0x2c) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x30) = 1;
    *(undefined4 *)(iVar2 + 0x34) = 2;
    break;
  case 8:
    *(undefined4 *)(param_1 + 0xc) = 3;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 2;
    *(undefined4 *)(iVar2 + 0x14) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 0;
    *(undefined4 *)(iVar2 + 0x1c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x20) = 1;
    *(undefined4 *)(iVar2 + 0x24) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x28) = 0;
    *(undefined4 *)(iVar2 + 0x2c) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x30) = 1;
    *(undefined4 *)(iVar2 + 0x34) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x38) = 2;
    *(undefined4 *)(iVar2 + 0x3c) = 2;
    break;
  case 9:
    *(undefined4 *)(param_1 + 0xc) = 3;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 2;
    *(undefined4 *)(iVar2 + 0x14) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 0;
    *(undefined4 *)(iVar2 + 0x1c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x20) = 1;
    *(undefined4 *)(iVar2 + 0x24) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x28) = 2;
    *(undefined4 *)(iVar2 + 0x2c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x30) = 0;
    *(undefined4 *)(iVar2 + 0x34) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x38) = 1;
    *(undefined4 *)(iVar2 + 0x3c) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x40) = 2;
    *(undefined4 *)(iVar2 + 0x44) = 2;
    break;
  case 10:
    *(undefined4 *)(param_1 + 0xc) = 3;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 2;
    *(undefined4 *)(iVar2 + 0x14) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 3;
    *(undefined4 *)(iVar2 + 0x1c) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x20) = 0;
    *(undefined4 *)(iVar2 + 0x24) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x28) = 1;
    *(undefined4 *)(iVar2 + 0x2c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x30) = 2;
    *(undefined4 *)(iVar2 + 0x34) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x38) = 0;
    *(undefined4 *)(iVar2 + 0x3c) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x40) = 1;
    *(undefined4 *)(iVar2 + 0x44) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x48) = 2;
    *(undefined4 *)(iVar2 + 0x4c) = 2;
    break;
  case 0xb:
    *(undefined4 *)(param_1 + 0xc) = 3;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 2;
    *(undefined4 *)(iVar2 + 0x14) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 3;
    *(undefined4 *)(iVar2 + 0x1c) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x20) = 0;
    *(undefined4 *)(iVar2 + 0x24) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x28) = 1;
    *(undefined4 *)(iVar2 + 0x2c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x30) = 2;
    *(undefined4 *)(iVar2 + 0x34) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x38) = 0;
    *(undefined4 *)(iVar2 + 0x3c) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x40) = 1;
    *(undefined4 *)(iVar2 + 0x44) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x48) = 2;
    *(undefined4 *)(iVar2 + 0x4c) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x50) = 3;
    *(undefined4 *)(iVar2 + 0x54) = 2;
    break;
  case 0xc:
    *(undefined4 *)(param_1 + 0xc) = 3;
    puVar1 = *(undefined4 **)(param_1 + 0x10);
    *puVar1 = 0;
    puVar1[1] = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 8) = 1;
    *(undefined4 *)(iVar2 + 0xc) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x10) = 2;
    *(undefined4 *)(iVar2 + 0x14) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x18) = 3;
    *(undefined4 *)(iVar2 + 0x1c) = 0;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x20) = 0;
    *(undefined4 *)(iVar2 + 0x24) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x28) = 1;
    *(undefined4 *)(iVar2 + 0x2c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x30) = 2;
    *(undefined4 *)(iVar2 + 0x34) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x38) = 3;
    *(undefined4 *)(iVar2 + 0x3c) = 1;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x40) = 0;
    *(undefined4 *)(iVar2 + 0x44) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x48) = 1;
    *(undefined4 *)(iVar2 + 0x4c) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x50) = 2;
    *(undefined4 *)(iVar2 + 0x54) = 2;
    iVar2 = *(int *)(param_1 + 0x10);
    *(undefined4 *)(iVar2 + 0x58) = 3;
    *(undefined4 *)(iVar2 + 0x5c) = 2;
  }
  return;
}

