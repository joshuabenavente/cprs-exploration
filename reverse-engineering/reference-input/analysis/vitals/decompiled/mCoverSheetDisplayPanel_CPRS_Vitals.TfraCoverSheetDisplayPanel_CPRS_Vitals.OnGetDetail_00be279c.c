/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_Vitals_TfraCoverSheetDisplayPanel_CPRS_Vitals_OnGetDetail
               (undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  int *in_FS_OFFSET;
  float10 in_ST0;
  float10 in_ST1;
  int **ppiVar2;
  undefined4 **ppuVar3;
  code *UNRECOVERED_JUMPTABLE;
  int *piStack_44;
  undefined **ppuStack_40;
  undefined4 *puStack_3c;
  undefined8 uStack_38;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  int iStack_28;
  undefined *puStack_24;
  undefined1 *puStack_20;
  undefined4 uStack_10;
  undefined8 uStack_c;
  
  puStack_20 = (undefined1 *)((int)register0x00000010 + -4);
  iVar1 = 7;
  do {
    iVar1 = iVar1 + -1;
  } while (iVar1 != 0);
  LOCK();
  uStack_c = 0.0;
  UNLOCK();
  puStack_24 = &UNK_00be297f;
  iStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_28;
  uStack_2c = 0;
  uStack_30 = 0;
  uStack_38 = (double)CONCAT44(0xbe27d4,(undefined4)uStack_38);
  func_0x00bcfa8c(param_2,4);
  uStack_38 = (double)in_ST0;
  puStack_3c = (undefined4 *)0xbe27e0;
  func_0x009b0e14();
  uStack_c = (double)in_ST1;
  puStack_3c = (undefined4 *)0xbe27eb;
  (**(code **)(iRam00000000 + 0x48))();
  puStack_3c = &uStack_10;
  puStack_20 = &UNK_00be2998;
  ppuStack_40 = &puStack_24;
  piStack_44 = (int *)0xbe280d;
  func_0x00bcfe80(param_2,2,0);
  piStack_44 = (int *)0xbe2829;
  func_0x0042ef18(&UNK_00be29c8,&puStack_20,1);
  piStack_44 = (int *)0xbe2833;
  (**(code **)(iRam00000000 + 0x3c))(0,uStack_10);
  piStack_44 = &iStack_28;
  puStack_20 = &UNK_00be29e0;
  func_0x00432550(&UNK_00be2a10,_DAT_0124f788,&uStack_2c,(undefined4)uStack_c,uStack_c._4_4_);
  func_0x0042ef18(&UNK_00be29c8,&puStack_20,1);
  (**(code **)(iRam00000000 + 0x3c))(0,iStack_28);
  puStack_20 = &UNK_00be2a44;
  func_0x00bcfe80(param_2,5,0,(int)&uStack_38 + 4,&uStack_30);
  func_0x0042ef18(&UNK_00be29c8,&puStack_20,1);
  (**(code **)(iRam00000000 + 0x3c))(0,uStack_30);
  puStack_20 = &UNK_00be2a74;
  ppuVar3 = &puStack_3c;
  func_0x00bcfe80(param_2,6,0,ppuVar3,&uStack_38);
  func_0x0042ef18(&UNK_00be29c8,&puStack_20,1);
  (**(code **)(iRam00000000 + 0x3c))(0,(undefined4)uStack_38);
  puStack_20 = &UNK_00be2aa4;
  ppiVar2 = &piStack_44;
  func_0x00bcfe80(param_2,7,0,ppiVar2,&ppuStack_40);
  func_0x0042ef18(&UNK_00be29c8,&puStack_20,1);
  (**(code **)(iRam00000000 + 0x3c))(0,ppuStack_40);
  *in_FS_OFFSET = (int)ppiVar2;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00be2986;
  func_0x0040b034(&piStack_44,9,ppuVar3);
  func_0x0040afd4(&uStack_10);
                    /* WARNING: Could not recover jumptable at 0x00be297d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

