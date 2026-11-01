/* Static Ghidra output. Delphi register ABI and types require review. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void fFrame_TfrmFrame_FormCreate(int *param_1)

{
  int iVar1;
  undefined1 *puVar2;
  code *pcVar3;
  undefined1 uVar4;
  char cVar5;
  undefined4 uVar6;
  int iVar7;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_50;
  int *piStack_4c;
  undefined1 *puStack_48;
  undefined *puStack_44;
  int *piStack_40;
  code *UNRECOVERED_JUMPTABLE;
  int *piStack_38;
  undefined4 uStack_34;
  undefined *puStack_30;
  undefined1 *puStack_2c;
  undefined4 uStack_28;
  undefined *puStack_24;
  undefined1 *puStack_20;
  int iStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  puStack_20 = (undefined1 *)((int)register0x00000010 + -4);
  puStack_2c = (undefined1 *)((int)register0x00000010 + -4);
  iStack_10 = 8;
  do {
    iStack_10 = iStack_10 + -1;
  } while (iStack_10 != 0);
  puStack_24 = &UNK_00fef130;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  DAT_0125a6ec = 1;
  puStack_30 = &UNK_00fef0ea;
  uStack_34 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_34;
  *(undefined1 *)((int)param_1 + 0x761) = 1;
  *(undefined1 *)((int)param_1 + 0x6d1) = 0;
  piStack_38 = (int *)0xfee560;
  uStack_8 = param_1;
  uVar6 = func_0x0119012c(_rMisc__TSizeHolder,1);
  *_DAT_0124f0b8 = uVar6;
  iVar7 = *_DAT_0124fe08;
  uStack_8[0x1c8] = *(int *)(iVar7 + 0xb0);
  iVar7 = *(int *)(iVar7 + 0xb4);
  uStack_8[0x1c9] = iVar7;
  iVar1 = *_DAT_0124fe08;
  *(int **)(iVar1 + 0xb4) = uStack_8;
  *(undefined **)(iVar1 + 0xb0) = &fFrame_TfrmFrame_ScreenActiveFormChange;
  piStack_38 = (int *)0xfee5b6;
  uVar4 = func_0x00438984(&UNK_00fef16c,&UNK_00fef140,CONCAT31((int3)((uint)iVar7 >> 8),1));
  *(undefined1 *)(uStack_8 + 0x1b8) = uVar4;
  uVar4 = (char)uStack_8[0x1b8] == '\0';
  if ((bool)uVar4) {
    piStack_38 = (int *)0xfee6b3;
    iVar7 = func_0x010057e0(_fFrame__TCPRS_CCOW,1,uStack_8);
    uStack_8[0x1b7] = iVar7;
    piStack_38 = (int *)0xfee6c9;
    func_0x009b82b0(&UNK_00fef188,&uStack_28);
    piStack_38 = (int *)0xfee6d6;
    func_0x0040c324(uStack_28,&UNK_00fef1a0);
    if ((bool)uVar4) {
      *(undefined1 *)(uStack_8[0x1b7] + 10) = 1;
      piStack_38 = (int *)0xfee705;
      func_0x006025b0(uStack_8[0x173],0);
      piStack_38 = (int *)0xfee715;
      func_0x00709244(uStack_8[0x16f],0);
      piStack_38 = (int *)0xfee725;
      func_0x00709244(uStack_8[0x172],0);
    }
    else {
      piStack_38 = (int *)0xfee6e6;
      func_0x010068e0(uStack_8[0x1b7]);
    }
  }
  else {
    piStack_38 = (int *)0xfee5dc;
    func_0x009b82b0(&UNK_00fef188,&puStack_24);
    piStack_38 = (int *)0xfee5e9;
    func_0x0040c324(puStack_24,&UNK_00fef1a0);
    if ((bool)uVar4) {
      fFrame_IsRunExecuted = 0;
      *(undefined1 *)((int)uStack_8 + 0x6d2) = 0;
      piStack_38 = (int *)0xfee67f;
      func_0x006025b0(uStack_8[0x173],0);
      piStack_38 = (int *)0xfee68f;
      func_0x00709244(uStack_8[0x16f],0);
      piStack_38 = (int *)0xfee69f;
      func_0x00709244(uStack_8[0x172],0);
    }
    else {
      UNRECOVERED_JUMPTABLE = (code *)&UNK_00fee60e;
      piStack_40 = (int *)*in_FS_OFFSET;
      *in_FS_OFFSET = &piStack_40;
      puStack_44 = (undefined *)0xfee601;
      piStack_38 = (int *)((int)register0x00000010 + -4);
      func_0x00fef794(uStack_8);
      *in_FS_OFFSET = piStack_40;
    }
  }
  piStack_38 = (int *)0xfee72d;
  func_0x00fee090(uStack_8);
  *(undefined1 *)(uStack_8 + 0x1c2) = 0;
  uStack_8[0x1ba] = 0x14;
  piStack_38 = uStack_8;
  UNRECOVERED_JUMPTABLE = (code *)&fFrame_TfrmFrame_TimeoutCondition;
  piStack_40 = uStack_8;
  puStack_44 = &fFrame_TfrmFrame_TimeOutAction;
  puStack_48 = (undefined1 *)0xfee75b;
  func_0x00aea250();
  uStack_8[0x1ba] = 0x1e;
  puStack_48 = (undefined1 *)0xfee76d;
  func_0x009ace6c();
  if ((char)uStack_8[0x1b8] == '\0') {
    puStack_48 = (undefined1 *)0xfee7e0;
    iVar7 = func_0x00e7b400();
    if (*(char *)(iVar7 + 0x14) != '\0') {
      puStack_48 = (undefined1 *)0xfee7eb;
      func_0x00e7b400();
      puStack_48 = (undefined1 *)0xfee7f0;
      iVar7 = func_0x00e7bc28();
      uVar4 = iVar7 == 0;
      if (!(bool)uVar4) {
        puStack_48 = (undefined1 *)0xfee801;
        func_0x009b82b0(&UNK_00fef188,&puStack_30);
        puStack_48 = (undefined1 *)0xfee80e;
        func_0x0040c324(puStack_30,&UNK_00fef1bc);
        if ((bool)uVar4) {
          *(undefined4 *)(*_DAT_0124eb40 + 0xbc) = 0;
        }
        else {
          puStack_48 = (undefined1 *)0xfee826;
          func_0x00e7b400();
          puStack_48 = (undefined1 *)0xfee82b;
          uVar6 = func_0x00e7bc28();
          *(undefined4 *)(*_DAT_0124eb40 + 0xbc) = uVar6;
        }
        goto LAB_00fee84a;
      }
    }
    *(undefined4 *)(*_DAT_0124eb40 + 0xbc) = 0;
  }
  else {
    uVar4 = _DAT_0125a6bc == 0;
    if ((bool)uVar4) {
      *(undefined4 *)(*_DAT_0124eb40 + 0xbc) = 0;
    }
    else {
      puStack_48 = (undefined1 *)0xfee78f;
      func_0x009b82b0(&UNK_00fef188,&puStack_2c);
      puStack_48 = (undefined1 *)0xfee79c;
      func_0x0040c324(puStack_2c,&UNK_00fef1bc);
      if ((bool)uVar4) {
        *(undefined4 *)(*_DAT_0124eb40 + 0xbc) = 0;
      }
      else {
        *(int *)(*_DAT_0124eb40 + 0xbc) = _DAT_0125a6bc;
      }
    }
  }
LAB_00fee84a:
  piStack_4c = (int *)&UNK_00fee872;
  uStack_50 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_50;
  puStack_48 = (undefined1 *)((int)register0x00000010 + -4);
  cVar5 = func_0x009af2c4(&UNK_00fef1e0);
  puVar2 = puStack_48;
  *in_FS_OFFSET = uStack_50;
  if (cVar5 == '\0') {
    puStack_48 = (undefined1 *)0xfee92d;
    func_0x00727128(uStack_8);
    puStack_48 = (undefined1 *)0xfee932;
    func_0x0040a734();
  }
  else {
    if (((char)uStack_8[0x1b8] != '\0') && (uVar4 = _DAT_0125a6bc == 0, !(bool)uVar4)) {
      puStack_48 = (undefined1 *)0xfee959;
      func_0x009b82b0(&UNK_00fef188,&uStack_34,puVar2);
      puStack_48 = (undefined1 *)0xfee966;
      func_0x0040c324(uStack_34,&UNK_00fef1bc);
      if (!(bool)uVar4) {
        puStack_48 = (undefined1 *)0xfee97a;
        func_0x0077bc88(_DAT_0125a6bc,10,&piStack_38);
        puStack_48 = (undefined1 *)0xfee987;
        func_0x0040bb48(&piStack_38,&UNK_00fef340);
        puStack_48 = (undefined1 *)0xfee999;
        func_0x0077ca20(_DAT_0125a6bc,10,piStack_38);
      }
    }
    puStack_48 = (undefined1 *)0xfee9a1;
    uVar4 = func_0x00ff0574(uStack_8);
    *(undefined1 *)(uStack_8 + 0x1ca) = uVar4;
    puStack_48 = (undefined1 *)0xfee9b6;
    iVar7 = func_0x00c0066c(_rECS__TECSReport,1);
    *_DAT_0124ea8c = iVar7;
    *(char *)(*_DAT_0124ea8c + 0x1c) = (char)uStack_8[0x1ca];
    puStack_48 = (undefined1 *)0xfee9e3;
    (**(code **)(*(int *)*_DAT_0124eb40 + 0x78))((int *)*_DAT_0124eb40,&UNK_00fef1e0);
    iVar7 = *_DAT_0124f460;
    uStack_8[0x1c6] = *(int *)(iVar7 + 0x158);
    uStack_8[0x1c7] = *(int *)(iVar7 + 0x15c);
    iVar7 = *_DAT_0124f460;
    *(int **)(iVar7 + 0x15c) = uStack_8;
    *(undefined **)(iVar7 + 0x158) = &fFrame_TfrmFrame_AppActivated;
    iVar7 = *_DAT_0124f460;
    *(int **)(iVar7 + 0x154) = uStack_8;
    *(undefined **)(iVar7 + 0x150) = &fFrame_TfrmFrame_AppDeActivated;
    uStack_8[0x1ba] = 0x32;
    uStack_8[0x1ba] = 0x28;
    puStack_48 = (undefined1 *)0xfeea60;
    cVar5 = func_0x00fe56d8(&UNK_00fef1e0,0);
    if (cVar5 == '\0') {
      puStack_48 = (undefined1 *)0xfeea6c;
      func_0x00727128(uStack_8);
      puStack_48 = (undefined1 *)0xfeea71;
      func_0x0040a734();
    }
    else {
      puStack_48 = (undefined1 *)0xfeea82;
      iVar7 = func_0x011d413c(_uCore__TUser,1);
      *_DAT_0124f9dc = iVar7;
      puStack_48 = _DAT_011d01cc;
      piStack_4c = (int *)0xfeeaa7;
      func_0x00a64c28(*_DAT_0124e76c,&UNK_00fef358,_DAT_0124f9dc);
      uStack_50 = 0xfeeaad;
      piStack_4c = (int *)((int)register0x00000010 + -4);
      func_0x00fee10c();
      piStack_4c = (int *)0xfeeab3;
      uVar6 = func_0x011d7790();
      piStack_4c = (int *)0xfeeabf;
      uVar4 = func_0x00a02dac(uVar6,&UNK_00fef370,1);
      *_DAT_0124eb84 = uVar4;
      piStack_4c = (int *)0xfeeacc;
      uVar6 = func_0x011d7790();
      piStack_4c = (int *)0xfeeadb;
      func_0x010072b4(uVar6,&UNK_00fef398,500);
      piStack_4c = (int *)0xfeeae0;
      func_0x009af6ac();
      piStack_4c = &iStack_c;
      uStack_50 = 0;
      ORNet_CallVistA(&UNK_00fef3c4,&piStack_38,0xffffffff,0);
      if (iStack_c == 0) {
        func_0x00709244(uStack_8[0x197],1);
      }
      else {
        func_0x00709244(uStack_8[0x197],0);
      }
      if ((*(char *)(*_DAT_0124f9dc + 0x54) == '\0') && (*(char *)(*_DAT_0124f9dc + 0x55) == '\0'))
      {
        func_0x009b44a8(&UNK_00fef424,&UNK_00fef3f0,0);
        func_0x00727128(uStack_8);
        func_0x0040a734();
      }
      else {
        uVar6 = func_0x011d7790();
        cVar5 = func_0x00a02d24(uVar6,&UNK_00fef460);
        if (cVar5 == '\0') {
          (**(code **)(*(int *)uStack_8[0x1ab] + 0x9c))((int *)uStack_8[0x1ab],0);
          func_0x006025b0(uStack_8[0x1ab],0);
        }
        else {
          uVar6 = func_0x011d7790();
          uVar4 = func_0x00a02d24(uVar6,&UNK_00fef4ac);
          *(undefined1 *)(uStack_8 + 0x1d2) = uVar4;
          if ((char)uStack_8[0x1d2] == '\0') {
            uVar6 = func_0x009b6a3c(0xffff);
            func_0x00602888(uStack_8[0x1ab],uVar6);
            (**(code **)(*(int *)uStack_8[0x1ab] + 0x14c))((int *)uStack_8[0x1ab],1);
            func_0x006028dc(uStack_8[0x1ab],1);
            func_0x00602888(uStack_8[0x1ab],0xff00000f);
            (**(code **)(*(int *)uStack_8[0x1ab] + 0xdc))();
          }
          else {
            (**(code **)(*(int *)uStack_8[0x1ab] + 0x14c))((int *)uStack_8[0x1ab],0);
            func_0x006028dc(uStack_8[0x1ab],0);
          }
          uVar6 = func_0x011d7790();
          uVar4 = func_0x00a02d24(uVar6,&UNK_00fef4f8);
          *(undefined1 *)(uStack_8 + 0x1d4) = uVar4;
          uVar6 = func_0x009d619c();
          func_0x0060cdec(uStack_8[0x1ab],uVar6);
        }
        uVar4 = func_0x0118e5bc(&UNK_00fef548);
        *_DAT_0124f0f4 = uVar4;
        uVar4 = func_0x0118e66c();
        *_DAT_0124f790 = uVar4;
        uVar6 = func_0x011d433c(_uCore__TPatient,1);
        *_DAT_0124f2e0 = uVar6;
        func_0x00a64c28(*_DAT_0124e76c,&UNK_00fef56c,_DAT_0124f2e0,_DAT_011d0bd0);
        uVar6 = func_0x011d4b8c(_uCore__TEncounter,1);
        *_DAT_0124e2a0 = uVar6;
        func_0x00a64c28(*_DAT_0124e76c,&UNK_00fef588,_DAT_0124e2a0,_DAT_011d1484);
        uVar6 = func_0x011d56a0(_uCore__TChanges,1);
        *_DAT_0124f8dc = uVar6;
        uVar6 = func_0x011d682c(_uCore__TNotifications,1);
        *_DAT_0124f490 = uVar6;
        uVar6 = func_0x011d72b4(_uCore__TRemoteSiteList,1);
        *_DAT_0124f294 = uVar6;
        uVar6 = func_0x011d7124(_uCore__TRemoteReportList,1);
        *_DAT_0124fc84 = uVar6;
        _DAT_0125a6a4 = func_0x004d81f4(_System_Classes__TStringList,1);
        _DAT_0125a6b8 = func_0x004d81f4(_System_Classes__TStringList,1);
        *_DAT_0124f9c8 = 0;
        uVar6 = func_0x004d81f4(_System_Classes__TStringList,1);
        *_DAT_0124f954 = uVar6;
        _DAT_0125a6e8 = func_0x004d81f4(_System_Classes__TStringList,1);
        func_0x01004928(uStack_8);
        func_0x010dc1ec();
        func_0x009b2a68(*(undefined4 *)(*_DAT_0124f9dc + 0x10),0,&piStack_40,&UNK_00fef5a8);
        func_0x0040c214(&UNRECOVERED_JUMPTABLE,5);
        func_0x006026fc(uStack_8,UNRECOVERED_JUMPTABLE);
        func_0x00ff09d4(uStack_8);
        cVar5 = func_0x00dc0d50();
        if (cVar5 != '\0') {
          func_0x00dbc268();
        }
        uStack_8[0x1ba] = 0x3c;
        func_0x00ffd8d8(uStack_8,2,&UNK_00fef608);
        func_0x00ffd8d8(uStack_8,3,&UNK_00fef628);
        func_0x00ffd8d8(uStack_8,4,&UNK_00fef640);
        func_0x00ffd8d8(uStack_8,6,&UNK_00fef65c);
        func_0x00ffd8d8(uStack_8,7,&UNK_00fef674);
        cVar5 = func_0x00cf3244();
        if (cVar5 != '\0') {
          func_0x00ffd8d8(uStack_8,0xb,&UNK_00fef694);
        }
        func_0x00ffd8d8(uStack_8,8,&UNK_00fef6b0);
        func_0x00ffd8d8(uStack_8,9,&UNK_00fef6d0);
        func_0x00ffd8d8(uStack_8,10,&UNK_00fef6e8);
        func_0x00ffd8d8(uStack_8,1,&UNK_00fef704);
        func_0x00ffdcd8(uStack_8,uStack_8[0x148]);
        iVar7 = func_0x005d5a70(_Vcl_Graphics__TBitmap,1);
        uStack_8[0x1c0] = iVar7;
        func_0x005d6c2c(uStack_8[0x1c0],_DAT_0125363c,&UNK_00fef728);
        func_0x00aea2f8(*(int *)(*_DAT_0124f9dc + 0x24) * 1000);
        func_0x0060c9a4(uStack_8);
        uStack_8[0x1ba] = 0x46;
        (**(code **)(*uStack_8 + 0x9c))(uStack_8,0);
        *(undefined1 *)((int)uStack_8 + 0x731) = 1;
        uStack_8[0x1ba] = 99;
        uVar6 = func_0x00dc0d50();
        func_0x006025b0(uStack_8[0x15f],uVar6);
        *(undefined1 *)(uStack_8 + 0x1ce) = 0;
        func_0x0040afd4(uStack_8 + 0x1cf);
        uVar6 = func_0x011c5f98(_fGraphData__TfrmGraphData,1,uStack_8);
        *_DAT_0124f278 = uVar6;
        func_0x00c7de9c();
        func_0x0040afd4(&DAT_0125a6ac);
        func_0x0040afd4(&DAT_0125a6a8);
        func_0x0040afd4(&DAT_0125a6b0);
        func_0x0040afd4(&DAT_0125a6b4);
        func_0x0040afd4(uStack_8 + 0x1cd);
        func_0x00fefeec(uStack_8);
        uStack_8[0x1d9] = 0;
        func_0x0040afd4(uStack_8 + 0x1dc);
        if (*(char *)(*_DAT_0124f9dc + 0x56) != '\0') {
          func_0x00ffdd94(uStack_8);
        }
        func_0x00acb15c();
        uVar4 = uStack_8[0x1a7] == 0;
        if (!(bool)uVar4) {
          func_0x00709244(uStack_8[0x1a7],*_DAT_0124e250);
          func_0x00709244(uStack_8[0x1a0],*_DAT_0124e250);
        }
        func_0x0060ca58(uStack_8);
        func_0x0041bf80();
        func_0x00c93fb4(1);
        func_0x00ac79b4(uStack_8[0x19b]);
        func_0x00ac6a70(uStack_8[0x19b]);
        func_0x011cb2bc(&UNK_00fef750,&puStack_48);
        func_0x0042c1a8(puStack_48,&puStack_44);
        func_0x0040c324(puStack_44,&UNK_00fef790);
        *_DAT_0124f7a0 = uVar4;
        func_0x0040afd4(&iStack_10);
        func_0x00b0e2e0();
        if (iStack_10 == 0) {
          *in_FS_OFFSET = uStack_50;
          puStack_48 = (undefined1 *)0xfef0f1;
          DAT_0125a6ec = 0;
        }
        else {
          func_0x0079b0f0(iStack_10);
          func_0x0040a734();
        }
      }
    }
  }
  pcVar3 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = puStack_44;
  UNRECOVERED_JUMPTABLE = (code *)&UNK_00fef137;
  piStack_40 = (int *)0xfef10b;
  func_0x0040b034(&puStack_48,4,pcVar3);
  piStack_40 = (int *)0xfef113;
  func_0x0040b01c(&piStack_38);
  piStack_40 = (int *)0xfef120;
  func_0x0040b034(&uStack_34,5);
  piStack_40 = (int *)0xfef12d;
  func_0x0040b034(&iStack_10,2);
                    /* WARNING: Could not recover jumptable at 0x00fef12e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

