/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void rOrders_LoadOrdersAbbr(undefined4 param_1,int param_2,undefined4 param_3)

{
  code *pcVar1;
  undefined4 uVar2;
  char cVar3;
  int iVar4;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined2 extraout_var_03;
  undefined2 uVar5;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar6;
  float10 in_ST0;
  float10 in_ST1;
  undefined4 uStack_10c;
  undefined *puStack_108;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 *puStack_100;
  undefined4 uStack_fc;
  int *piStack_f8;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined *puStack_f0;
  undefined1 *puStack_ec;
  undefined4 uStack_e8;
  undefined *puStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  undefined *puStack_d8;
  undefined1 *puStack_d4;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined1 uStack_c4;
  undefined *puStack_c0;
  undefined1 uStack_bc;
  undefined4 uStack_b8;
  undefined1 uStack_b4;
  float10 *pfStack_b0;
  undefined1 uStack_ac;
  float10 *pfStack_a8;
  undefined1 uStack_a4;
  undefined4 uStack_a0;
  undefined1 uStack_9c;
  undefined4 uStack_98;
  int iStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  float10 fStack_88;
  float10 fStack_7c;
  undefined4 uStack_70;
  undefined1 uStack_6c;
  undefined4 uStack_68;
  undefined1 uStack_64;
  undefined4 uStack_60;
  undefined1 uStack_5c;
  float10 *pfStack_58;
  undefined1 uStack_54;
  float10 *pfStack_50;
  undefined1 uStack_4c;
  undefined4 uStack_48;
  undefined1 uStack_44;
  undefined1 uStack_40;
  undefined1 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined1 uStack_25;
  undefined4 uStack_24;
  int *piStack_20;
  double dStack_1c;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  uStack_cc = 0;
  iStack_94 = 0;
  uStack_98 = 0;
  uStack_8c = 0;
  uStack_90 = 0;
  uStack_34 = 0;
  uStack_38 = 0;
  uStack_24 = 0;
  puStack_d4 = (undefined1 *)0x11dc678;
  uStack_10 = param_3;
  iStack_c = param_2;
  uStack_8 = param_1;
  func_0x0040b0c8(param_3);
  puStack_d8 = &UNK_011dc9f1;
  uStack_dc = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_dc;
  puStack_d4 = (undefined1 *)((int)register0x00000010 + -4);
  if (_DAT_0125aacc == 0) {
    uStack_e0 = 0x11dc694;
    puStack_d4 = (undefined1 *)((int)register0x00000010 + -4);
    func_0x011dad28();
  }
  uStack_e0 = 0x11dc6a2;
  func_0x0042cfdc(*(undefined4 *)(iStack_c + 0xc),&uStack_34);
  uStack_e0 = uStack_34;
  puStack_e4 = &UNK_011dca0c;
  uStack_e8 = 0x11dc6b8;
  func_0x0042cfdc(*(undefined4 *)(iStack_c + 0x58),&uStack_38);
  uStack_e8 = uStack_38;
  puStack_ec = (undefined1 *)0x11dc6c8;
  func_0x0040c214(&uStack_24,3);
  if ((*(char *)(*_DAT_0124f490 + 4) == '\0') || (*(int *)(iStack_c + 0xc) != 0xc)) {
    uStack_25 = 0;
  }
  else {
    uStack_25 = 1;
  }
  puStack_ec = (undefined1 *)0x11dc6f3;
  piStack_f8 = (int *)func_0x004d81f4(_System_Classes__TStringList,1);
  puStack_f0 = &UNK_011dc9a2;
  UNRECOVERED_JUMPTABLE_00 = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = &UNRECOVERED_JUMPTABLE_00;
  uStack_fc = 0;
  uStack_70 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
  uStack_6c = 0x11;
  uStack_68 = uStack_24;
  uStack_64 = 0x11;
  uStack_60 = *(undefined4 *)(iStack_c + 8);
  uStack_5c = 0;
  fStack_7c = (float10)*(double *)(iStack_c + 0x18);
  pfStack_58 = &fStack_7c;
  uStack_54 = 3;
  fStack_88 = (float10)*(double *)(iStack_c + 0x20);
  pfStack_50 = &fStack_88;
  uStack_4c = 3;
  uStack_48 = uStack_10;
  uStack_44 = 0x11;
  uStack_40 = uStack_25;
  uStack_3c = 1;
  puStack_100 = (undefined4 *)0x11dc786;
  puStack_ec = (undefined1 *)((int)register0x00000010 + -4);
  piStack_20 = piStack_f8;
  ORNet_CallVistA(&UNK_011dca1c,&uStack_70,6);
  puStack_100 = (undefined4 *)0x11dc78e;
  iVar4 = (**(code **)(*piStack_20 + 0x14))();
  if (iVar4 < 1) {
    puStack_100 = (undefined4 *)0x11dc79a;
    rOrders_ClearOrders(uStack_8);
    pcVar1 = UNRECOVERED_JUMPTABLE_00;
    *in_FS_OFFSET = uStack_fc;
    UNRECOVERED_JUMPTABLE_00 = (code *)&UNK_011dc9a9;
    piStack_f8 = (int *)0x11dc99f;
    func_0x004090bc(piStack_20,uStack_fc,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011dc9a0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
    return;
  }
  puStack_100 = &uStack_8c;
  uVar6 = 1;
  UNRECOVERED_JUMPTABLE = (code *)0x11dc7b6;
  (**(code **)(*piStack_20 + 0xc))(piStack_20,0,&uStack_90);
  UNRECOVERED_JUMPTABLE = (code *)0x11dc7ca;
  func_0x0079acec(uStack_90,CONCAT22(extraout_var,0x5e),1);
  UNRECOVERED_JUMPTABLE = (code *)0x11dc7da;
  func_0x0040c324(uStack_8c,&UNK_011dca40);
  if (!(bool)uVar6) {
    UNRECOVERED_JUMPTABLE = (code *)&iStack_94;
    puStack_108 = (undefined *)0x11dc7f3;
    (**(code **)(*piStack_20 + 0xc))(piStack_20,0,&uStack_98);
    puStack_108 = (undefined *)0x11dc807;
    func_0x0079acec(uStack_98,CONCAT22(extraout_var_00,0x5e),1);
    if (iStack_94 != 0) goto LAB_011dc92a;
  }
  if (*(int *)(iStack_c + 0xc) == 5) {
    UNRECOVERED_JUMPTABLE = (code *)0x11dc829;
    (**(code **)(*piStack_20 + 0x48))();
    UNRECOVERED_JUMPTABLE = (code *)0x11dc82e;
    func_0x011db22c();
    dStack_1c = (double)in_ST0;
    if (0.0 <= dStack_1c) {
      UNRECOVERED_JUMPTABLE = (code *)piStack_20;
      puStack_108 = (undefined *)0x0;
      uStack_c8 = *(undefined4 *)(*_DAT_0124f2e0 + 4);
      uStack_c4 = 0x11;
      puStack_c0 = &UNK_011dcae4;
      uStack_bc = 0x11;
      uStack_b8 = *(undefined4 *)(iStack_c + 8);
      uStack_b4 = 0;
      fStack_7c = (float10)dStack_1c;
      pfStack_b0 = &fStack_7c;
      uStack_ac = 3;
      uStack_10c = 0x11dc8ae;
      func_0x011ca6ac();
      pfStack_a8 = &fStack_88;
      uStack_a4 = 3;
      uStack_a0 = uStack_10;
      uStack_9c = 0x11;
      uStack_10c = 0x11dc8ed;
      fStack_88 = in_ST1;
      cVar3 = ORNet_CallVistA(&UNK_011dca1c,&uStack_c8,5);
      uVar5 = extraout_var_02;
      if (cVar3 == '\0') {
        UNRECOVERED_JUMPTABLE = (code *)0x11dc8f9;
        (**(code **)(*piStack_20 + 0x48))();
        uVar5 = extraout_var_03;
      }
    }
    else {
      UNRECOVERED_JUMPTABLE = (code *)0x11dc84b;
      func_0x0079b0f0(&UNK_011dca50);
      uVar5 = extraout_var_01;
    }
    UNRECOVERED_JUMPTABLE = (code *)&uStack_cc;
    puStack_108 = (undefined *)0x11dc914;
    func_0x0079acec(*(undefined4 *)(iStack_c + 0x34),CONCAT22(uVar5,0x2d),2);
    puStack_108 = (undefined *)0x11dc92a;
    func_0x0040c18c(iStack_c + 0x34,&UNK_011dcafc,uStack_cc);
  }
LAB_011dc92a:
  UNRECOVERED_JUMPTABLE = (code *)0x11dc936;
  uStack_2c = func_0x0040908c(_System_Classes__TList,1);
  puStack_108 = &UNK_011dc983;
  uStack_10c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_10c;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  func_0x011dbf3c(uStack_2c,iStack_c,piStack_20);
  func_0x011dc258(uStack_2c,uStack_8);
  uVar2 = uStack_2c;
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_10c;
  UNRECOVERED_JUMPTABLE = (code *)0x11dc98a;
  uStack_30 = uStack_2c;
  uStack_2c = 0;
  puStack_108 = (undefined *)0x11dc980;
  func_0x004090bc(uVar2,uStack_10c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x011dc981. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

