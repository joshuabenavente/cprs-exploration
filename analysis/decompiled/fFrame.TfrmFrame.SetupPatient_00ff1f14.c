/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Switch with 1 destination removed at 0x00ff2c04 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fFrame_TfrmFrame_SetupPatient(int param_1,undefined4 param_2)

{
  undefined4 *puVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  int *in_FS_OFFSET;
  bool bVar5;
  float10 fVar6;
  undefined1 auStack_160 [4];
  undefined4 uStack_15c;
  undefined4 uStack_158;
  undefined4 uStack_154;
  undefined4 uStack_150;
  undefined4 uStack_14c;
  undefined4 uStack_148;
  undefined4 uStack_144;
  int iStack_140;
  undefined4 uStack_13c;
  undefined4 uStack_138;
  undefined4 uStack_134;
  undefined4 uStack_130;
  undefined4 uStack_12c;
  undefined4 uStack_128;
  undefined4 uStack_124;
  undefined4 *puStack_120;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined *puStack_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  undefined1 uStack_e8;
  undefined4 uStack_e4;
  undefined1 uStack_e0;
  undefined4 uStack_dc;
  undefined1 uStack_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined *puStack_c8;
  undefined4 uStack_c4;
  undefined4 uStack_c0;
  int iStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined *puStack_a4;
  undefined1 uStack_a0;
  undefined4 uStack_9c;
  undefined1 uStack_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  int iStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  int iStack_78;
  int iStack_74;
  undefined *puStack_70;
  undefined2 uStack_6c;
  undefined2 uStack_6a;
  undefined4 uStack_68;
  undefined4 uStack_64;
  int iStack_60;
  undefined *puStack_5c;
  int iStack_58;
  int iStack_54;
  undefined *puStack_50;
  int iStack_4c;
  undefined *puStack_48;
  undefined *puStack_44;
  undefined4 *puStack_40;
  undefined4 *puStack_3c;
  undefined4 *puStack_38;
  undefined *puStack_34;
  undefined4 *puStack_30;
  undefined4 *puStack_2c;
  undefined4 *puStack_28;
  undefined4 *puStack_24;
  undefined4 *puStack_20;
  int iStack_1c;
  undefined *puStack_18;
  undefined1 *puStack_14;
  int iStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_14 = (undefined1 *)((int)register0x00000010 + -4);
  iStack_10 = 0x2b;
  do {
    iStack_10 = iStack_10 + -1;
  } while (iStack_10 != 0);
  puStack_18 = &UNK_00ff2c06;
  iStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_1c;
  puStack_20 = (undefined4 *)0xff1f42;
  uStack_7c = param_2;
  uStack_8 = param_1;
  func_0x00fed0f0(param_1,0);
  puStack_20 = (undefined4 *)0xff1f4e;
  iVar3 = func_0x011d4550(*_DAT_0124f2e0);
  puStack_20 = (undefined4 *)0xff1f5e;
  func_0x0040c18c(&uStack_80,&UNK_00ff2c20,*(undefined4 *)(iVar3 + 0xc));
  puStack_20 = (undefined4 *)0xff1f6f;
  func_0x006026fc(*(undefined4 *)(uStack_8 + 0x634),uStack_80);
  puStack_20 = (undefined4 *)0xff1f7b;
  iVar3 = func_0x011d4550(*_DAT_0124f2e0);
  puStack_20 = (undefined4 *)0xff1f8c;
  func_0x006025b0(*(undefined4 *)(uStack_8 + 0x634),*(undefined1 *)(iVar3 + 0x1c));
  puStack_20 = (undefined4 *)0xff1f96;
  func_0x00720c40(uStack_8,1);
  puStack_20 = (undefined4 *)0xff1fa4;
  func_0x009a9728(_UResponsiveGUI__TResponsiveGUI,0,0);
  puStack_20 = (undefined4 *)0xff1fc0;
  func_0x0040c18c(&uStack_84,*(undefined4 *)(*_DAT_0124f2e0 + 0x10),
                  *(undefined4 *)(*_DAT_0124f2e0 + 0x38));
  puStack_20 = (undefined4 *)0xff1fd1;
  func_0x006026fc(*(undefined4 *)(uStack_8 + 0x49c),uStack_84);
  puStack_20 = (undefined4 *)0xff1fdf;
  func_0x01004a70(uStack_8,&uStack_88);
  puStack_20 = (undefined4 *)0xff1ff3;
  func_0x006026fc(*(undefined4 *)(uStack_8 + 0x4a0),uStack_88);
  puStack_20 = &uStack_90;
  puStack_24 = (undefined4 *)0xff2012;
  func_0x0079acec(*(undefined4 *)(*_DAT_0124f2e0 + 0x28),CONCAT22(extraout_var,0x2f),1);
  puStack_24 = (undefined4 *)0xff2023;
  func_0x0042c5fc(uStack_90,&iStack_8c);
  if (iStack_8c == 0) {
    puStack_24 = (undefined4 *)0xff2044;
    func_0x0040b3c4(*(int *)(uStack_8 + 0x498) + 0x90,&UNK_00ff2c34);
  }
  else {
    puStack_24 = &uStack_94;
    puStack_a4 = &UNK_00ff2c34;
    uStack_a0 = 0x11;
    puStack_28 = (undefined4 *)0xff2064;
    uVar4 = func_0x011d7790();
    puStack_28 = (undefined4 *)0xff206f;
    func_0x01201fb8(uVar4,&uStack_a8);
    uStack_9c = uStack_a8;
    uStack_98 = 0x11;
    puStack_28 = (undefined4 *)0xff2097;
    func_0x0042ef18(&UNK_00ff2c88,&puStack_a4,1);
    puStack_28 = (undefined4 *)0xff20b0;
    func_0x0040b3c4(*(int *)(uStack_8 + 0x498) + 0x90,uStack_94);
  }
  puStack_28 = (undefined4 *)0xff20c5;
  puStack_24 = (undefined4 *)((int)register0x00000010 + -4);
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x49c),&uStack_b0);
  puStack_28 = (undefined4 *)0xff20d6;
  func_0x0042c5fc(uStack_b0,&uStack_ac);
  puStack_28 = (undefined4 *)0xff20ed;
  iVar3 = func_0x00ff1e40(uStack_ac,*(undefined4 *)(*(int *)(uStack_8 + 0x49c) + 0x74));
  puVar1 = puStack_24;
  puStack_18 = (undefined *)(iVar3 + *(int *)(*(int *)(uStack_8 + 0x49c) + 0x50) * 2);
  puStack_28 = (undefined4 *)0xff2116;
  puStack_24 = (undefined4 *)((int)register0x00000010 + -4);
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x4a0),&uStack_b8,puVar1);
  puStack_28 = (undefined4 *)0xff2127;
  func_0x0042c5fc(uStack_b8,&uStack_b4);
  puStack_28 = (undefined4 *)0xff213e;
  iVar3 = func_0x00ff1e40(uStack_b4,*(undefined4 *)(*(int *)(uStack_8 + 0x4a0) + 0x74));
  puVar1 = puStack_24;
  puStack_14 = (undefined1 *)(iVar3 + *(int *)(*(int *)(uStack_8 + 0x4a0) + 0x50) * 2);
  if ((int)puStack_14 < (int)puStack_18) {
    iStack_1c = (int)puStack_18;
  }
  else {
    iStack_1c = (int)puStack_14;
  }
  puStack_24 = (undefined4 *)0xff2179;
  func_0x006019b0(*(undefined4 *)(uStack_8 + 0x498),iStack_1c,puVar1);
  puStack_24 = &uStack_c0;
  puStack_28 = (undefined4 *)0xff2198;
  func_0x0079acec(*(undefined4 *)(*_DAT_0124f2e0 + 0x28),CONCAT22(extraout_var_00,0x2f),1);
  puStack_28 = (undefined4 *)0xff21a9;
  uVar4 = func_0x0042c5fc(uStack_c0,&iStack_bc);
  if (iStack_bc == 0) {
    puStack_28 = &uStack_c4;
    puStack_2c = (undefined4 *)0xff21d1;
    func_0x006026ac(*(undefined4 *)(uStack_8 + 0x49c),&puStack_c8);
    puStack_a4 = puStack_c8;
    uStack_a0 = 0x11;
    puStack_2c = (undefined4 *)0xff21f8;
    func_0x006026ac(*(undefined4 *)(uStack_8 + 0x4a0),&uStack_cc);
    uStack_9c = uStack_cc;
    uStack_98 = 0x11;
    puStack_2c = (undefined4 *)0xff2220;
    func_0x0042ef18(&UNK_00ff2cb0,&puStack_a4,1);
    puStack_2c = (undefined4 *)0xff2234;
    func_0x006026fc(*(undefined4 *)(uStack_8 + 0x498),uStack_c4);
  }
  else {
    puStack_28 = (undefined4 *)CONCAT31((int3)((uint)uVar4 >> 8),DAT_00ff2cc4);
    puStack_2c = &uStack_d0;
    puStack_30 = &uStack_d4;
    puStack_34 = (undefined *)0xff2261;
    func_0x006026ac(*(undefined4 *)(uStack_8 + 0x49c),&uStack_f0);
    uStack_ec = uStack_f0;
    uStack_e8 = 0x11;
    puStack_34 = (undefined *)0xff2288;
    func_0x006026ac(*(undefined4 *)(uStack_8 + 0x4a0),&uStack_f4);
    uStack_e4 = uStack_f4;
    uStack_e0 = 0x11;
    puStack_34 = (undefined *)CONCAT31((int3)((uint)uStack_f4 >> 8),DAT_00ff2cc4);
    puStack_38 = &uStack_f8;
    puStack_3c = (undefined4 *)CONCAT31((int3)((uint)puStack_38 >> 8),DAT_00ff2cc4);
    puStack_40 = &uStack_fc;
    puStack_44 = (undefined *)0xff22ce;
    func_0x00438098(*(undefined4 *)(*_DAT_0124e6dc + 4),&UNK_00ff2cec,&UNK_00ff2cd4);
    puStack_44 = (undefined *)0xff22e3;
    func_0x00438098(uStack_fc,&UNK_00ff2d10,&UNK_00ff2cfc);
    uStack_dc = uStack_f8;
    uStack_d8 = 0x11;
    puStack_44 = (undefined *)0xff230b;
    func_0x0042ef18(&UNK_00ff2d24,&uStack_ec,2);
    puStack_44 = (undefined *)0xff2320;
    func_0x00438098(uStack_d4,&UNK_00ff2d50,&UNK_00ff2cd4);
    puStack_44 = (undefined *)0xff2334;
    func_0x006026fc(*(undefined4 *)(uStack_8 + 0x498),uStack_d0);
  }
  puStack_2c = (undefined4 *)0xff233c;
  func_0x010028b8(uStack_8);
  puStack_20 = *(undefined4 **)(*_DAT_0124f2e0 + 0x30);
  puStack_24 = puStack_20;
  if (puStack_20 != (undefined4 *)0x0) {
    puStack_24 = *(undefined4 **)((int)puStack_20 + -4);
  }
  if ((int)puStack_24 < 1) {
    puStack_2c = (undefined4 *)0xff238c;
    func_0x006026fc(*(undefined4 *)(uStack_8 + 0x5e0),&UNK_00ff2d80);
  }
  else {
    puStack_2c = (undefined4 *)0xff2377;
    func_0x006026fc(*(undefined4 *)(uStack_8 + 0x5e0),&UNK_00ff2d60);
  }
  puStack_2c = (undefined4 *)0xff23a4;
  func_0x006026fc(*(undefined4 *)(uStack_8 + 0x5e4),*(undefined4 *)(*_DAT_0124f2e0 + 0x30));
  puStack_2c = (undefined4 *)0xff23b8;
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x5e0),&uStack_104);
  puStack_2c = (undefined4 *)uStack_104;
  puStack_30 = (undefined4 *)&UNK_00ff2da4;
  puStack_34 = (undefined *)0xff23d7;
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x5e4),&puStack_108);
  puStack_34 = puStack_108;
  puStack_38 = (undefined4 *)0xff23ed;
  func_0x0040c214(&uStack_100,3);
  puStack_38 = (undefined4 *)0xff2401;
  func_0x006026fc(*(undefined4 *)(uStack_8 + 0x5dc),uStack_100);
  puStack_28 = *(undefined4 **)(*_DAT_0124f2e0 + 0x60);
  puStack_2c = puStack_28;
  if (puStack_28 != (undefined4 *)0x0) {
    puStack_2c = *(undefined4 **)((int)puStack_28 + -4);
  }
  if ((int)puStack_2c < 1) {
    puStack_30 = *(undefined4 **)(*_DAT_0124f2e0 + 100);
    puStack_34 = (undefined *)puStack_30;
    if (puStack_30 != (undefined4 *)0x0) {
      puStack_34 = *(undefined **)((int)puStack_30 + -4);
    }
    bVar5 = 0 < (int)puStack_34;
  }
  else {
    bVar5 = true;
  }
  if (bVar5) {
    puStack_38 = (undefined4 *)0xff247b;
    func_0x006026fc(*(undefined4 *)(uStack_8 + 0x574),*(undefined4 *)(*_DAT_0124f2e0 + 0x60));
    if (*(int *)(*_DAT_0124f2e0 + 100) != 0) {
      puStack_38 = (undefined4 *)0xff249c;
      func_0x006026ac(*(undefined4 *)(uStack_8 + 0x574),&uStack_110);
      puStack_38 = (undefined4 *)uStack_110;
      puStack_3c = (undefined4 *)&UNK_00ff2db4;
      puStack_40 = (undefined4 *)0xff24be;
      func_0x009b2a68(*(undefined4 *)(*_DAT_0124f2e0 + 100),0,&uStack_114);
      puStack_40 = (undefined4 *)uStack_114;
      puStack_44 = (undefined *)0xff24d4;
      func_0x0040c214(&uStack_10c,3);
      puStack_44 = (undefined *)0xff24e8;
      func_0x006026fc(*(undefined4 *)(uStack_8 + 0x574),uStack_10c);
    }
    puStack_3c = *(undefined4 **)(*_DAT_0124f2e0 + 0x6c);
    puStack_40 = puStack_3c;
    if (puStack_3c != (undefined4 *)0x0) {
      puStack_40 = (undefined4 *)puStack_3c[-1];
    }
    if (0 < (int)puStack_40) {
      puStack_38 = (undefined4 *)0xff2524;
      func_0x006026ac(*(undefined4 *)(uStack_8 + 0x574),&uStack_11c);
      puStack_38 = (undefined4 *)uStack_11c;
      puStack_3c = (undefined4 *)&UNK_00ff2db4;
      puStack_40 = (undefined4 *)0xff2546;
      func_0x009b2a68(*(undefined4 *)(*_DAT_0124f2e0 + 0x6c),0,&puStack_120);
      puStack_40 = puStack_120;
      puStack_44 = (undefined *)0xff255c;
      func_0x0040c214(&uStack_118,3);
      puStack_44 = (undefined *)0xff2570;
      func_0x006026fc(*(undefined4 *)(uStack_8 + 0x574),uStack_118);
    }
  }
  puStack_44 = *(undefined **)(*_DAT_0124f2e0 + 0x68);
  puStack_48 = puStack_44;
  if (puStack_44 != (undefined *)0x0) {
    puStack_48 = *(undefined **)(puStack_44 + -4);
  }
  if (0 < (int)puStack_48) {
    puStack_38 = (undefined4 *)0xff25af;
    func_0x009b2a68(*(undefined4 *)(*_DAT_0124f2e0 + 0x68),0,&uStack_128);
    puStack_38 = (undefined4 *)0xff25c5;
    func_0x0040c18c(&uStack_124,&UNK_00ff2dc8,uStack_128);
    puStack_38 = (undefined4 *)0xff25d9;
    func_0x006026fc(*(undefined4 *)(uStack_8 + 0x578),uStack_124);
  }
  puStack_38 = (undefined4 *)0xff25ed;
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x574),&uStack_130);
  puStack_38 = (undefined4 *)uStack_130;
  puStack_3c = (undefined4 *)&UNK_00ff2da4;
  puStack_40 = (undefined4 *)0xff260c;
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x578),&uStack_134);
  puStack_40 = (undefined4 *)uStack_134;
  puStack_44 = (undefined *)0xff2622;
  func_0x0040c214(&uStack_12c,3);
  puStack_44 = (undefined *)0xff2636;
  func_0x006026fc(*(undefined4 *)(uStack_8 + 0x570),uStack_12c);
  iStack_4c = *(int *)(*_DAT_0124f2e0 + 0x70);
  puStack_50 = (undefined *)iStack_4c;
  if (iStack_4c != 0) {
    puStack_50 = *(undefined **)(iStack_4c + -4);
  }
  if (0 < (int)puStack_50) {
    puStack_44 = (undefined *)0xff2672;
    func_0x006026ac(*(undefined4 *)(uStack_8 + 0x578),&uStack_13c);
    puStack_44 = (undefined *)uStack_13c;
    puStack_48 = &UNK_00ff2e08;
    iStack_4c = 0xff2694;
    func_0x009b2a68(*(undefined4 *)(*_DAT_0124f2e0 + 0x70),0,&iStack_140);
    iStack_4c = iStack_140;
    puStack_50 = (undefined *)0xff26aa;
    func_0x0040c214(&uStack_138,3);
    puStack_50 = (undefined *)0xff26be;
    func_0x006026fc(*(undefined4 *)(uStack_8 + 0x578),uStack_138);
  }
  iStack_54 = *(int *)(*_DAT_0124f2e0 + 0x74);
  iStack_58 = iStack_54;
  if (iStack_54 != 0) {
    iStack_58 = *(int *)(iStack_54 + -4);
  }
  if (0 < iStack_58) {
    puStack_44 = (undefined *)0xff26fd;
    func_0x009b2a68(*(undefined4 *)(*_DAT_0124f2e0 + 0x74),0,&uStack_148);
    puStack_44 = (undefined *)0xff2713;
    func_0x0040c18c(&uStack_144,&UNK_00ff2e48,uStack_148);
    puStack_44 = (undefined *)0xff2727;
    func_0x006026fc(*(undefined4 *)(uStack_8 + 0x658),uStack_144);
  }
  puStack_5c = *(undefined **)(*_DAT_0124f2e0 + 0x74);
  iStack_60 = (int)puStack_5c;
  if (puStack_5c != (undefined *)0x0) {
    iStack_60 = *(int *)((int)puStack_5c + -4);
  }
  if ((iStack_60 == 0) && (bVar5 = *(char *)(*_DAT_0124f2e0 + 0x35) == '\x01', bVar5)) {
    puStack_44 = (undefined *)0xff2770;
    func_0x0040c324(*(undefined4 *)(*_DAT_0124f2e0 + 0x48),&UNK_00ff2e8c);
    if (bVar5) {
      puStack_44 = (undefined *)0xff2785;
      func_0x006026fc(*(undefined4 *)(uStack_8 + 0x658),&UNK_00ff2e9c);
    }
  }
  puStack_44 = (undefined *)0xff2799;
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x574),&uStack_150);
  puStack_44 = (undefined *)uStack_150;
  puStack_48 = &UNK_00ff2da4;
  iStack_4c = 0xff27b8;
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x578),&uStack_154);
  iStack_4c = uStack_154;
  puStack_50 = &UNK_00ff2da4;
  iStack_54 = 0xff27d7;
  func_0x006026ac(*(undefined4 *)(uStack_8 + 0x658),&uStack_158);
  iStack_54 = uStack_158;
  iStack_58 = 0xff27ed;
  func_0x0040c214(&uStack_14c,5);
  iStack_58 = 0xff2801;
  func_0x006026fc(*(undefined4 *)(uStack_8 + 0x570),uStack_14c);
  iStack_58 = 0xff2809;
  func_0x00ffa348(uStack_8);
  iStack_58 = 0xff2811;
  func_0x00fede1c(uStack_8);
  iStack_58 = 0xff2819;
  uVar4 = func_0x0060ca58(uStack_8);
  iStack_58 = 0xff282a;
  func_0x0118edb8(*(undefined4 *)(*_DAT_0124f2e0 + 4),uVar4);
  iStack_58 = 0xff2832;
  func_0x00ff0a60(uStack_8);
  fVar6 = (float10)*(double *)(*_DAT_0124f2e0 + 0x18);
  iStack_74 = SUB104(fVar6,0);
  puStack_70 = (undefined *)((unkuint10)fVar6 >> 0x20);
  uStack_6c = (undefined2)((unkuint10)fVar6 >> 0x40);
  iStack_58 = *(undefined4 *)(*_DAT_0124f2e0 + 0x14);
  puStack_5c = &UNK_00ff2ef0;
  iStack_60 = CONCAT22((short)((uint)*_DAT_0124f2e0 >> 0x10),uStack_6c);
  uStack_64 = puStack_70;
  uStack_68 = iStack_74;
  uStack_6c = 0x286a;
  uStack_6a = 0xff;
  func_0x00430914(_DAT_0124f788,auStack_160);
  uStack_6c = auStack_160._0_2_;
  uStack_6a = auStack_160._2_2_;
  puStack_70 = &UNK_00ff2ef0;
  iStack_74 = *(int *)(*_DAT_0124f2e0 + 0x10);
  iStack_78 = 0xff288f;
  func_0x0040c214(&uStack_15c,5);
  iStack_78 = 0xff289f;
  func_0x011d3f74(&UNK_00ff2f00,uStack_15c);
  iStack_78 = 0xff28a7;
  func_0x0040afd4(&iStack_10);
  iStack_78 = 0xff28b9;
  cVar2 = func_0x011ceac8(*(undefined4 *)(*_DAT_0124f2e0 + 4),&uStack_c);
  if (cVar2 != '\0') {
    iStack_78 = 0xff28c8;
    func_0x0040b40c(&iStack_10,uStack_c);
  }
  iStack_78 = 0xff28da;
  cVar2 = func_0x011ce880(*(undefined4 *)(*_DAT_0124f2e0 + 4),&uStack_c);
  if (cVar2 != '\0') {
    if (iStack_10 != 0) {
      iStack_78 = 0xff28f1;
      func_0x0040c134(&iStack_10,&UNK_00ff2d10);
    }
    iStack_78 = 0xff28fc;
    func_0x0040c134(&iStack_10,uStack_c);
  }
  iStack_78 = 0xff2918;
  func_0x00e6f9d8(*_DAT_0124f954,_DAT_0124f9c8,*(undefined4 *)(*_DAT_0124f2e0 + 4));
  if (*_DAT_0124f9c8 == '\0') {
    iStack_78 = 0xff29a2;
    uVar4 = func_0x009d61a8();
    iStack_78 = 0xff29b2;
    func_0x006025b0(*(undefined4 *)(uStack_8 + 0x664),uVar4);
    iStack_78 = 0xff29c5;
    (**(code **)(**(int **)(uStack_8 + 0x638) + 0x9c))(*(int **)(uStack_8 + 0x638),0);
    iStack_78 = 0xff29db;
    func_0x005cda30(*(undefined4 *)(*(int *)(uStack_8 + 0x63c) + 0x74),0xff00000f);
    iStack_78 = 0xff29ee;
    (**(code **)(**(int **)(uStack_8 + 0x63c) + 0x9c))(*(int **)(uStack_8 + 0x63c),0);
  }
  else {
    iStack_78 = 0xff2932;
    func_0x006025b0(*(undefined4 *)(uStack_8 + 0x664),0);
    iStack_78 = 0xff2945;
    (**(code **)(**(int **)(uStack_8 + 0x638) + 0x9c))(*(int **)(uStack_8 + 0x638),1);
    iStack_78 = 0xff294f;
    uVar4 = func_0x009b6a3c(0x80);
    iStack_78 = 0xff2962;
    func_0x005cda30(*(undefined4 *)(*(int *)(uStack_8 + 0x63c) + 0x74),uVar4);
    iStack_78 = 0xff2975;
    (**(code **)(**(int **)(uStack_8 + 0x63c) + 0x9c))(*(int **)(uStack_8 + 0x63c),1);
    if (*(char *)(uStack_8 + 0x6e2) == '\0') {
      iStack_78 = 0xff2990;
      cVar2 = func_0x00e6fa3c(*(undefined4 *)(*_DAT_0124f2e0 + 4));
      if (cVar2 != '\0') {
        iStack_78 = 0xff299b;
        func_0x00e7067c(0);
      }
    }
  }
  iStack_78 = 0xff2a06;
  func_0x0040b3c4(uStack_8 + 0x734,*(undefined4 *)(*_DAT_0124f2e0 + 4));
  iStack_78 = 0xff2a10;
  func_0x00ffe4b8(uStack_8,0);
  iStack_78 = 0xff2a36;
  func_0x00601944(*(undefined4 *)(uStack_8 + 0x630),
                  *(int *)(*(int *)(uStack_8 + 0x640) + 0x50) -
                  *(int *)(*(int *)(uStack_8 + 0x630) + 0x58));
  iStack_78 = 0xff2a5c;
  func_0x00601944(*(undefined4 *)(uStack_8 + 0x600),
                  *(int *)(*(int *)(uStack_8 + 0x630) + 0x50) -
                  *(int *)(*(int *)(uStack_8 + 0x600) + 0x58));
  iStack_78 = 0xff2a82;
  func_0x00601944(*(undefined4 *)(uStack_8 + 0x670),
                  *(int *)(*(int *)(uStack_8 + 0x600) + 0x50) -
                  *(int *)(*(int *)(uStack_8 + 0x670) + 0x58));
  iStack_78 = 0xff2a87;
  func_0x00df6fa0();
  iStack_78 = iStack_10;
  if (iStack_10 != 0) {
    iStack_78 = *(int *)(iStack_10 + -4);
  }
  if (0 < iStack_78) {
    iStack_78 = 0xff2aaa;
    func_0x00fd8b24(iStack_10);
  }
  iStack_78 = 0xff2abc;
  func_0x00ffedf8(uStack_8,*(undefined4 *)(*_DAT_0124f2e0 + 4));
  iStack_78 = 0xff2ac4;
  func_0x00ffece8(uStack_8);
  iStack_78 = 0xff2ad5;
  (**(code **)(**(int **)(uStack_8 + 0x6bc) + 0x19c))();
  iStack_78 = 0xff2add;
  fFrame_TfrmFrame_SetupPtInfoPanel(uStack_8);
  uVar4 = CONCAT22(uStack_6a,uStack_6c);
  *in_FS_OFFSET = iStack_74;
  uStack_6c = 0x2c10;
  uStack_6a = 0xff;
  puStack_70 = (undefined *)0xff2afa;
  func_0x0040b034(auStack_160,2,uVar4);
  puStack_70 = (undefined *)0xff2b0a;
  func_0x0040b034(&uStack_158,4);
  puStack_70 = (undefined *)0xff2b1a;
  func_0x0040b034(&uStack_148,3);
  puStack_70 = (undefined *)0xff2b2a;
  func_0x0040b034(&uStack_13c,5);
  puStack_70 = (undefined *)0xff2b3a;
  func_0x0040b034(&uStack_128,3);
  puStack_70 = (undefined *)0xff2b4a;
  func_0x0040b034(&uStack_11c,2);
  puStack_70 = (undefined *)0xff2b55;
  func_0x0040afd4(&uStack_114);
  puStack_70 = (undefined *)0xff2b65;
  func_0x0040b034(&uStack_110,5);
  puStack_70 = (undefined *)0xff2b75;
  func_0x0040b034(&uStack_fc,2);
  puStack_70 = (undefined *)0xff2b85;
  func_0x0040b034(&uStack_f4,2);
  puStack_70 = (undefined *)0xff2b95;
  func_0x0040b034(&uStack_d4,2);
  puStack_70 = (undefined *)0xff2ba5;
  func_0x0040b034(&uStack_cc,2);
  puStack_70 = (undefined *)0xff2bb5;
  func_0x0040b034(&uStack_c4,3);
  puStack_70 = (undefined *)0xff2bc0;
  func_0x0040afd4(&uStack_b8);
  puStack_70 = (undefined *)0xff2bcb;
  func_0x0040afd4(&uStack_b4);
  puStack_70 = (undefined *)0xff2bd6;
  func_0x0040afd4(&uStack_b0);
  puStack_70 = (undefined *)0xff2be6;
  func_0x0040b034(&uStack_ac,2);
  puStack_70 = (undefined *)0xff2bf6;
  func_0x0040b034(&uStack_94,6);
  puStack_70 = (undefined *)0xff2c03;
  func_0x0040b034(&iStack_10,2);
  return;
}

