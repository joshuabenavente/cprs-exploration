/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void mCoverSheetDisplayPanel_CPRS_TfraCoverSheetDisplayPanel_CPRS_DisplayItemDetail
               (int *param_1,undefined4 param_2,int *param_3,char param_4)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 *puVar4;
  undefined *puVar5;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_48;
  undefined *puStack_44;
  undefined1 *puStack_40;
  undefined4 uStack_3c;
  undefined *puStack_38;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 *puStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  int iStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = (int *)0x0;
  uStack_c = 0;
  uStack_14 = 0;
  iStack_18 = 0;
  uStack_1c = 0;
  uStack_20 = 0;
  puStack_24 = (undefined4 *)0x0;
  puStack_38 = &UNK_00bd4335;
  uStack_3c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_3c;
  uStack_10 = param_2;
  if (param_3 == (int *)0x0) {
    puStack_40 = (undefined1 *)0xbd4300;
    func_0x00bd40a4(param_1,param_2);
  }
  else {
    puStack_40 = (undefined1 *)0xbd41ee;
    UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
    iVar1 = func_0x0067cb00(param_3);
    param_1[0xd8] = iVar1;
    if ((param_4 == '\0') && (param_3[10] != 0)) {
      puStack_40 = (undefined1 *)0xbd4218;
      func_0x00bcf93c(param_3[10],1,&iStack_18);
      if (iStack_18 != 0) {
        puStack_44 = &UNK_00bd42ef;
        uStack_48 = *in_FS_OFFSET;
        *in_FS_OFFSET = &uStack_48;
        puStack_40 = (undefined1 *)((int)register0x00000010 + -4);
        uStack_14 = func_0x004d81f4(_System_Classes__TStringList,1);
        (**(code **)(*param_1 + 0x210))(param_1,param_3[10],uStack_14);
        (**(code **)(*param_1 + 0x198))(param_1,&uStack_1c);
        (**(code **)(*param_3 + 0x18))(param_3,&uStack_20,*param_3,&UNK_00bd4354,uStack_1c);
        uVar3 = uStack_20;
        func_0x0040c214(&uStack_c,3);
        uVar2 = func_0x00410738(&uStack_8);
        puVar5 = &UNK_00bd4374;
        (**(code **)(*param_1 + 0x1ec))(param_1,&puStack_24,*param_1,&UNK_00bd4374,uVar2,uVar3);
        puVar4 = puStack_24;
        iVar1 = (**(code **)*puStack_24)();
        if (iVar1 == 0) {
          uVar3 = (**(code **)(*uStack_8 + 0x58))();
          (**(code **)(*param_1 + 0x214))(param_1,uStack_14,uStack_c);
        }
        else {
          uVar3 = 0;
          (**(code **)(*param_1 + 0x214))(param_1,uStack_14,uStack_c,0,puVar4);
        }
        uVar2 = uStack_14;
        *in_FS_OFFSET = uVar3;
        UNRECOVERED_JUMPTABLE_00 = (code *)0xbd4300;
        uStack_14 = 0;
        func_0x004090bc(uVar2,0,puVar5);
                    /* WARNING: Could not recover jumptable at 0x00bd42ed. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
        return;
      }
    }
  }
  UNRECOVERED_JUMPTABLE_00 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_3c;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00bd433c;
  puStack_38 = (undefined *)0xbd4315;
  func_0x00410738(&puStack_24,uStack_3c,UNRECOVERED_JUMPTABLE_00);
  puStack_38 = (undefined *)0xbd4322;
  func_0x0040b034(&uStack_20,3);
  puStack_38 = (undefined *)0xbd432a;
  func_0x0040afd4(&uStack_c);
  puStack_38 = (undefined *)0xbd4332;
  func_0x00410738(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00bd4333. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

