/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void uCore_AllowAccessToSensitivePatient(undefined4 param_1,int *param_2)

{
  code **ppcVar1;
  code ***pppcVar2;
  code *pcVar3;
  undefined4 uVar4;
  int iVar5;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_48;
  code **ppcStack_44;
  undefined *puStack_40;
  undefined4 **ppuStack_3c;
  undefined4 uStack_38;
  undefined4 **ppuStack_34;
  code ***pppcStack_30;
  undefined4 **ppuStack_2c;
  undefined *puStack_28;
  code *UNRECOVERED_JUMPTABLE;
  code **ppcStack_20;
  undefined4 uStack_1c;
  undefined *puStack_18;
  undefined4 **ppuStack_14;
  undefined4 uStack_10;
  int *piStack_c;
  undefined4 *puStack_8;
  
  uStack_10 = 8;
  do {
    uStack_10 = uStack_10 + -1;
  } while (uStack_10 != 0);
  ppuStack_14 = (undefined4 **)0x11d364e;
  piStack_c = param_2;
  puStack_8 = (undefined4 *)param_1;
  func_0x0040b0c8(param_1);
  puStack_18 = &UNK_011d382e;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  uStack_10 = CONCAT13(1,(undefined3)uStack_10);
  if (*(char *)(_DAT_0125aa64 + 4) == '\0') {
    ppcStack_20 = (code **)0x11d36be;
    ppuStack_14 = (undefined4 **)((int)register0x00000010 + -4);
    func_0x0040afd4(&uStack_1c);
    ppcStack_20 = (code **)0x11d36c6;
    func_0x0040afd4(&puStack_18);
  }
  else {
    ppcStack_20 = &UNRECOVERED_JUMPTABLE;
    UNRECOVERED_JUMPTABLE = (code *)0x11d367c;
    ppuStack_14 = (undefined4 **)((int)register0x00000010 + -4);
    func_0x011d6b48(_DAT_0125aa64,&puStack_28);
    UNRECOVERED_JUMPTABLE = (code *)0x11d368d;
    func_0x009b2f6c(puStack_28,CONCAT22(extraout_var_00,0x5e),1);
    puStack_28 = &UNK_011d3848;
    ppuStack_2c = (undefined4 **)&UNK_011d3848;
    pppcStack_30 = (code ***)0x11d36a7;
    func_0x0040c214(&uStack_1c,3);
    pppcStack_30 = (code ***)0x11d36b4;
    func_0x0040b40c(&puStack_18,&UNK_011d385c);
  }
  pppcStack_30 = (code ***)0x11d36d4;
  rCore_CheckSensitiveRecordAccess(puStack_8,piStack_c,&ppuStack_14);
  iVar5 = *piStack_c;
  if (iVar5 == -1) {
    pppcStack_30 = (code ***)0x11d3700;
    func_0x0040c18c(&ppuStack_2c,puStack_18,&UNK_011d3894);
    pppcStack_30 = (code ***)ppuStack_2c;
    ppuStack_34 = (undefined4 **)0x11d3714;
    func_0x0040c18c(&pppcStack_30,uStack_1c,&UNK_011d38ac);
    pppcVar2 = pppcStack_30;
    pppcStack_30 = (code ***)0x11d371f;
    func_0x009b44a8(pppcVar2,pppcVar2,0);
    uStack_10 = uStack_10 & 0xffffff;
  }
  else if (iVar5 != 0) {
    if (iVar5 == 1) {
      pppcStack_30 = (code ***)0x11d3738;
      func_0x0040c18c(&ppuStack_34,puStack_18,&UNK_011d390c);
      pppcStack_30 = (code ***)ppuStack_34;
      ppuStack_34 = (undefined4 **)0x11d374a;
      func_0x0040c18c(&uStack_38,uStack_1c,ppuStack_14);
      pppcVar2 = pppcStack_30;
      pppcStack_30 = (code ***)0x11d3755;
      func_0x009b44a8(uStack_38,pppcVar2,0);
    }
    else if (iVar5 == 2) {
      pppcStack_30 = &ppcStack_20;
      ppuStack_34 = (undefined4 **)0x11d3763;
      uVar4 = func_0x011d7790();
      ppuStack_34 = (undefined4 **)0x11d3772;
      func_0x00b94a00(uVar4,&UNK_011d39c4,&UNK_011d393c);
      ppuStack_34 = (undefined4 **)0x11d3782;
      func_0x0040c18c(&ppuStack_3c,puStack_18,&UNK_011d390c);
      ppuStack_34 = ppuStack_3c;
      uStack_38 = uStack_1c;
      ppuStack_3c = ppuStack_14;
      puStack_40 = &UNK_011d3848;
      ppcStack_44 = ppcStack_20;
      uStack_48 = 0x11d37a1;
      func_0x0040c214(&puStack_40,4);
      ppcVar1 = ppcStack_44;
      ppcStack_44 = (code **)0x11d37ae;
      iVar5 = func_0x009b44a8(puStack_40,ppcVar1,CONCAT22(extraout_var,0x134));
      if (iVar5 == 6) {
        pppcStack_30 = (code ***)0x11d37bb;
        func_0x011ce9f4(puStack_8);
      }
      else {
        uStack_10 = uStack_10 & 0xffffff;
      }
    }
    else {
      pppcStack_30 = (code ***)0x11d37d3;
      func_0x0040c18c(&ppcStack_44,puStack_18,&UNK_011d3a00);
      pppcStack_30 = (code ***)ppcStack_44;
      ppuStack_34 = (undefined4 **)0x11d37e5;
      func_0x0040c18c(&uStack_48,uStack_1c,ppuStack_14);
      pppcVar2 = pppcStack_30;
      pppcStack_30 = (code ***)0x11d37f0;
      func_0x009b44a8(uStack_48,pppcVar2,0);
      if (*(char *)(_DAT_0125aa64 + 4) != '\0') {
        pppcStack_30 = (code ***)0x11d3805;
        func_0x011d6df8(_DAT_0125aa64);
      }
      uStack_10 = uStack_10 & 0xffffff;
    }
  }
  pcVar3 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = ppuStack_2c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_011d3835;
  puStack_28 = (undefined *)0x11d3823;
  func_0x0040b034(&uStack_48,0xe,pcVar3);
  puStack_28 = (undefined *)0x11d382b;
  func_0x0040afd4(&puStack_8);
                    /* WARNING: Could not recover jumptable at 0x011d382c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

