/* Unverified decompiler output; inspect assembly and ABI. */

void MFunStr_Translate(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  code *pcVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_38;
  undefined1 *puStack_34;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_14 = 0;
  uStack_18 = 0;
  uStack_1c = 0;
  uStack_20 = 0;
  UNRECOVERED_JUMPTABLE = (code *)0x8617e1;
  uStack_10 = param_3;
  uStack_c = param_2;
  uStack_8 = param_1;
  System__UStrAddRef(param_1);
  UNRECOVERED_JUMPTABLE = (code *)0x8617e9;
  System__UStrAddRef(uStack_c);
  UNRECOVERED_JUMPTABLE = (code *)0x8617f1;
  System__UStrAddRef(uStack_10);
  puStack_34 = &LAB_008618af;
  uStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_38;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  System__UStrClr(&uStack_14);
  iVar4 = 0;
  if (uStack_8 != 0) {
    iVar4 = *(int *)(uStack_8 + -4);
  }
  if (0 < iVar4) {
    iVar3 = 1;
    do {
      System__UStrCopy(uStack_8,iVar3,1,&uStack_18);
      iVar2 = System__UStrPos(uStack_18,uStack_c,1);
      if (iVar2 < 1) {
        System__UStrCopy(uStack_8,iVar3,1,&uStack_20);
        System__UStrCat(&uStack_14,uStack_20);
      }
      else {
        System__UStrCopy(uStack_10,iVar2,1,&uStack_1c);
        System__UStrCat(&uStack_14,uStack_1c);
      }
      iVar3 = iVar3 + 1;
      iVar4 = iVar4 + -1;
    } while (iVar4 != 0);
  }
  System__UStrAsg(param_4,uStack_14);
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_38;
  UNRECOVERED_JUMPTABLE = (code *)&LAB_008618b6;
  puStack_34 = (undefined1 *)0x8618ac;
  System__UStrArrayClr(&uStack_20,7,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x008618ad. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

