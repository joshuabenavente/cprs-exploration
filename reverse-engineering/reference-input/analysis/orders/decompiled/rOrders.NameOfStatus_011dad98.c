/* Static Ghidra output. Delphi register ABI and types require review. */

void rOrders_NameOfStatus(int param_1,undefined4 param_2)

{
  if (param_1 < 10) {
    if (param_1 == 9) {
      func_0x0040b3c4(param_2,&UNK_011db088);
    }
    else {
      switch(param_1) {
      case 0:
        func_0x0040b3c4(param_2,&UNK_011daf80);
        break;
      case 1:
        func_0x0040b3c4(param_2,&UNK_011daf98);
        break;
      case 2:
        func_0x0040b3c4(param_2,&UNK_011dafc0);
        break;
      case 3:
        func_0x0040b3c4(param_2,&UNK_011dafe0);
        break;
      case 4:
        func_0x0040b3c4(param_2,&UNK_011daff8);
        break;
      case 5:
        func_0x0040b3c4(param_2,&UNK_011db014);
        break;
      case 6:
        func_0x0040b3c4(param_2,&UNK_011db030);
        break;
      case 7:
        func_0x0040b3c4(param_2,&UNK_011db04c);
        break;
      case 8:
        func_0x0040b3c4(param_2,&UNK_011db068);
      }
    }
  }
  else if (param_1 < 0xf) {
    if (param_1 == 0xe) {
      func_0x0040b3c4(param_2,&UNK_011db130);
    }
    else if (param_1 == 10) {
      func_0x0040b3c4(param_2,&UNK_011db0b4);
    }
    else if (param_1 == 0xb) {
      func_0x0040b3c4(param_2,&UNK_011db0d0);
    }
    else if (param_1 == 0xc) {
      func_0x0040b3c4(param_2,&UNK_011db0f4);
    }
    else if (param_1 == 0xd) {
      func_0x0040b3c4(param_2,&UNK_011db110);
    }
  }
  else if (param_1 == 0xf) {
    func_0x0040b3c4(param_2,&UNK_011db14c);
  }
  else if (param_1 == 0x61) {
    func_0x0040afd4(param_2);
  }
  else if (param_1 == 0x62) {
    func_0x0040b3c4(param_2,&UNK_011db168);
  }
  else if (param_1 == 99) {
    func_0x0040b3c4(param_2,&UNK_011db17c);
  }
  return;
}

