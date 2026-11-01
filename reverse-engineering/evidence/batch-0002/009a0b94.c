/* Unverified decompiler output; inspect assembly and ABI. */

void Trpcb_AuthenticateUser(int *param_1)

{
  undefined *puVar1;
  code *pcVar2;
  int *piVar3;
  char cVar4;
  int iVar5;
  undefined4 uVar6;
  HWND hWnd;
  undefined *puVar7;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_74;
  undefined4 *puStack_70;
  code *UNRECOVERED_JUMPTABLE_02;
  undefined4 uStack_68;
  undefined1 *puStack_64;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_5c;
  undefined1 *puStack_58;
  undefined1 *puStack_54;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  char cStack_3d;
  int iStack_3c;
  HWND pHStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  int iStack_28;
  undefined1 uStack_22;
  char cStack_21;
  int iStack_20;
  int *piStack_1c;
  undefined1 uStack_16;
  undefined1 uStack_15;
  int *piStack_14;
  int iStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  puStack_54 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_4c = 0;
  uStack_48 = 0;
  uStack_44 = 0;
  uStack_8 = 0;
  uStack_c = 0;
  iStack_10 = 0;
  puStack_58 = &LAB_009a151a;
  uStack_5c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_5c;
  UNRECOVERED_JUMPTABLE = (code *)0x9a0bce;
  piStack_14 = param_1;
  piStack_1c = (int *)Trpcb_TParams_Create(Trpcb__TParams.self_vmt_va,1,0);
  UNRECOVERED_JUMPTABLE = (code *)0x9a0bdf;
  (**(code **)(*piStack_1c + 8))(piStack_1c,piStack_14[0x17]);
  UNRECOVERED_JUMPTABLE = (code *)0x9a0bed;
  System__UStrLAsg(&uStack_8,piStack_14[0x1a]);
  UNRECOVERED_JUMPTABLE = (code *)0x9a0bfb;
  System__UStrLAsg(&uStack_c,piStack_14[0x1b]);
  iStack_20 = piStack_14[0x18];
  uStack_15 = (undefined1)piStack_14[0x13];
  uStack_16 = *(undefined1 *)((int)piStack_14 + 0x4d);
  UNRECOVERED_JUMPTABLE = (code *)0x9a0c22;
  (**(code **)(*piStack_14 + 0x44))(piStack_14,1);
  UNRECOVERED_JUMPTABLE = (code *)0x9a0c2c;
  (**(code **)(*piStack_14 + 0x48))(piStack_14,1);
  uStack_22 = (undefined1)piStack_14[0x20];
  iVar5 = piStack_14[0x21];
  puStack_64 = &LAB_009a14b1;
  uStack_68 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_68;
  cStack_3d = '\0';
  UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0c5f;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  iStack_28 = iVar5;
  System__UStrClr(&iStack_10);
  cStack_21 = '\0';
  if (piStack_14[0x12] != 0) {
    UNRECOVERED_JUMPTABLE_02 = (code *)0x0;
    puStack_70 = &uStack_44;
    uStack_74 = 0x9a0c87;
    MFunStr_Piece(piStack_14[0x12],&DAT_009a1534,1);
    uStack_74 = 0x9a0c91;
    Trpcb_TVistaLogin_SetAccessCode(iVar5,uStack_44);
    uStack_74 = 0;
    MFunStr_Piece(piStack_14[0x12],&DAT_009a1534,2,&uStack_48);
    Trpcb_TVistaLogin_SetVerifyCode(piStack_14[0x21],uStack_48);
    Trpcb_TVistaLogin_SetMode(piStack_14[0x21],0);
    (**(code **)(*piStack_14 + 0x60))(piStack_14,0);
  }
  if (((char)piStack_14[0x20] != '\0') && (piStack_14[0x2f] != 0)) {
    UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0d03;
    Trpcb_TRPCBroker_GetCCOWtoken(piStack_14,piStack_14[0x2f],&uStack_4c);
    UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0d10;
    System__UStrAsg(&DAT_01258fb4,uStack_4c);
    iVar5 = 0;
    if (DAT_01258fb4 != 0) {
      iVar5 = *(int *)(DAT_01258fb4 + -4);
    }
    if (0 < iVar5) {
      UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0d34;
      Trpcb_TVistaLogin_SetLogInHandle(piStack_14[0x21],DAT_01258fb4);
      UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0d44;
      Trpcb_TVistaLogin_SetMode(piStack_14[0x21],1);
      UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0d4e;
      (**(code **)(*piStack_14 + 0x60))(piStack_14,0);
    }
  }
  if ((char)piStack_14[0x20] == '\0') {
    if (piStack_14[0x21] != 0) {
      UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0d6e;
      cStack_21 = RpcSLogin_SilentLogIn(piStack_14);
    }
    if (cStack_21 == '\0') {
      UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0d81;
      (**(code **)(*piStack_14 + 0x60))(piStack_14,1);
      UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0d91;
      Trpcb_TVistaLogin_SetMode(piStack_14[0x21],2);
      piStack_14[0x2f] = 0;
    }
    else {
      UNRECOVERED_JUMPTABLE_02 = (code *)0x9a0da6;
      Trpcb_GetBrokerInfo(piStack_14);
    }
  }
  if (((cStack_21 == '\0') && ((char)piStack_14[0x20] == '\x01')) && (piStack_14[0x2a] == 0)) {
    puVar7 = (undefined *)0x0;
    puStack_70 = (undefined4 *)&LAB_009a0ec8;
    uStack_74 = *in_FS_OFFSET;
    *in_FS_OFFSET = &uStack_74;
    puVar1 = PTR_DAT_0124ff44;
    if ((char)piStack_14[0x10] == '\x01') {
      *PTR_DAT_0124ff44 = 1;
      puVar7 = puVar1;
    }
    else {
      cStack_3d = '\x01';
      *PTR_DAT_0124ff44 = 0;
    }
    UNRECOVERED_JUMPTABLE_02 = (code *)((int)register0x00000010 + -4);
    iStack_3c = XWBSSOi_TXWBSSOiToken_Create
                          (XWBSSOi__TXWBSSOiToken.self_vmt_va,CONCAT31((int3)((uint)puVar7 >> 8),1),
                           *(undefined4 *)PTR_DAT_0124f460);
    System__UStrLAsg(&iStack_10,*(undefined4 *)(iStack_3c + 0x40));
    System__UStrAsg(piStack_14 + 0x3f,iStack_10);
    System__UStrAsg(piStack_14 + 0x40,*(undefined4 *)(iStack_3c + 0x4c));
    System__UStrAsg(piStack_14 + 0x41,*(undefined4 *)(iStack_3c + 0x44));
    System__UStrAsg(piStack_14 + 0x42,*(undefined4 *)(iStack_3c + 0x48));
    iVar5 = iStack_3c;
    iStack_3c = 0;
    System_TObject_Free(iVar5);
    pcVar2 = UNRECOVERED_JUMPTABLE_02;
    *in_FS_OFFSET = uStack_74;
    UNRECOVERED_JUMPTABLE_02 = (code *)&LAB_009a0ecf;
    if (iStack_10 != 0) {
      puStack_70 = (undefined4 *)0x9a0ea4;
      Trpcb_TVistaLogin_SetLogInHandle(piStack_14[0x21],piStack_14[0x3f],pcVar2);
      puStack_70 = (undefined4 *)0x9a0eb4;
      Trpcb_TVistaLogin_SetMode(piStack_14[0x21],2);
      puStack_70 = (undefined4 *)0x9a0ebe;
      (**(code **)(*piStack_14 + 0x60))(piStack_14,0);
      *(undefined1 *)(piStack_14 + 0x10) = 0;
    }
                    /* WARNING: Could not recover jumptable at 0x009a0ec6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_02)(UNRECOVERED_JUMPTABLE_02);
    return;
  }
  if (((cStack_3d == '\x01') && (cStack_21 == '\0')) &&
     (((char)piStack_14[0x20] == '\x01' && (piStack_14[0x2a] == 0)))) {
    UNRECOVERED_JUMPTABLE_02 = (code *)0x9a104a;
    System__UStrClr(&iStack_10);
    UNRECOVERED_JUMPTABLE_02 = (code *)0x9a105a;
    Trpcb_TVistaLogin_SetMode(piStack_14[0x21],2);
    puStack_70 = (undefined4 *)&LAB_009a1140;
    uStack_74 = *in_FS_OFFSET;
    *in_FS_OFFSET = &uStack_74;
    *(undefined1 *)(piStack_14 + 0x10) = 1;
    *PTR_DAT_0124ff44 = 1;
    UNRECOVERED_JUMPTABLE_02 = (code *)((int)register0x00000010 + -4);
    iStack_3c = XWBSSOi_TXWBSSOiToken_Create
                          (XWBSSOi__TXWBSSOiToken.self_vmt_va,1,*(undefined4 *)PTR_DAT_0124f460);
    System__UStrLAsg(&iStack_10,*(undefined4 *)(iStack_3c + 0x40));
    System__UStrAsg(piStack_14 + 0x3f,iStack_10);
    System__UStrAsg(piStack_14 + 0x40,*(undefined4 *)(iStack_3c + 0x4c));
    System__UStrAsg(piStack_14 + 0x41,*(undefined4 *)(iStack_3c + 0x44));
    System__UStrAsg(piStack_14 + 0x42,*(undefined4 *)(iStack_3c + 0x48));
    iVar5 = iStack_3c;
    iStack_3c = 0;
    System_TObject_Free(iVar5);
    pcVar2 = UNRECOVERED_JUMPTABLE_02;
    *in_FS_OFFSET = uStack_74;
    UNRECOVERED_JUMPTABLE_02 = (code *)&LAB_009a1147;
    if (iStack_10 != 0) {
      puStack_70 = (undefined4 *)0x9a111c;
      Trpcb_TVistaLogin_SetLogInHandle(piStack_14[0x21],piStack_14[0x3f],pcVar2);
      puStack_70 = (undefined4 *)0x9a112c;
      Trpcb_TVistaLogin_SetMode(piStack_14[0x21],2);
      puStack_70 = (undefined4 *)0x9a1136;
      (**(code **)(*piStack_14 + 0x60))(piStack_14,0);
      *(undefined1 *)(piStack_14 + 0x10) = 0;
    }
                    /* WARNING: Could not recover jumptable at 0x009a113e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_02)(UNRECOVERED_JUMPTABLE_02);
    return;
  }
  if ((cStack_21 != '\0') || ((char)piStack_14[0x20] != '\x01')) {
    *in_FS_OFFSET = uStack_68;
    UNRECOVERED_JUMPTABLE = (code *)&LAB_009a14b8;
    puStack_64 = (undefined1 *)0x9a1447;
    (**(code **)(*piStack_14 + 0x44))(piStack_14,uStack_15);
    puStack_64 = (undefined1 *)0x9a1453;
    (**(code **)(*piStack_14 + 0x48))(piStack_14,uStack_16);
    puStack_64 = (undefined1 *)0x9a1461;
    (**(code **)(*(int *)piStack_14[0x17] + 8))((int *)piStack_14[0x17],piStack_1c);
    piVar3 = piStack_1c;
    piStack_1c = (int *)0x0;
    puStack_64 = (undefined1 *)0x9a146e;
    System_TObject_Free(piVar3);
    puStack_64 = (undefined1 *)0x9a147c;
    System__UStrAsg(piStack_14 + 0x1a,uStack_8);
    puStack_64 = (undefined1 *)0x9a148a;
    System__UStrAsg(piStack_14 + 0x1b,uStack_c);
    puStack_64 = (undefined1 *)0x9a1495;
    (**(code **)(*piStack_14 + 0x50))(piStack_14,iStack_20);
    *(undefined1 *)(piStack_14 + 0x20) = uStack_22;
    piStack_14[0x21] = iStack_28;
                    /* WARNING: Could not recover jumptable at 0x009a14af. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
    return;
  }
  UNRECOVERED_JUMPTABLE_02 = (code *)0x9a12aa;
  System__UStrClr(&DAT_01258fb4);
  if (*(short *)(*(int *)PTR_DAT_0124f460 + 0x10a) == 0) {
    uStack_34 = 0;
    uStack_30 = 0;
  }
  else {
    uStack_34 = *(undefined4 *)(*(int *)PTR_DAT_0124f460 + 0x108);
    uStack_30 = *(undefined4 *)(*(int *)PTR_DAT_0124f460 + 0x10c);
  }
  iVar5 = *(int *)PTR_DAT_0124f460;
  *(dword *)(iVar5 + 0x10c) = fRPCBErrMsg__TfrmErrMsg.self_vmt_va;
  *(code **)(iVar5 + 0x108) = fRPCBErrMsg_TfrmErrMsg_RPCBShowException;
  UNRECOVERED_JUMPTABLE_02 = (code *)0x9a1309;
  uVar6 = Vcl_Forms_TCustomForm_Create(Loginfrm__TfrmSignon.self_vmt_va,1,0);
  *(undefined4 *)PTR_DAT_0124f7f8 = uVar6;
  puStack_70 = (undefined4 *)&LAB_009a13ea;
  uStack_74 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_74;
  UNRECOVERED_JUMPTABLE_02 = (code *)((int)register0x00000010 + -4);
  Trpcb_ShowApplicationAndFocusOK(*(undefined4 *)PTR_DAT_0124f460);
  pHStack_38 = Winapi_Windows_GetForegroundWindow();
  hWnd = (HWND)Vcl_Controls_TWinControl_GetHandle(*(undefined4 *)PTR_DAT_0124f7f8);
  Winapi_Windows_SetForegroundWindow(hWnd);
  Loginfrm_PrepareSignonForm(piStack_14);
  cVar4 = Loginfrm_SetUpSignOn();
  if (cVar4 == '\0') {
    cStack_21 = '\x01';
  }
  else {
    (**(code **)(**(int **)PTR_DAT_0124f7f8 + 0x1b4))();
    if (*(int *)(*(int *)PTR_DAT_0124f7f8 + 0xc) == 1) {
      cStack_21 = '\x01';
    }
  }
  if (cStack_21 != '\0') {
    Trpcb_GetBrokerInfo(piStack_14);
    cVar4 = SelDiv_ChooseDiv(0,piStack_14);
    if (cVar4 == '\0') {
      cStack_21 = '\0';
      Trpcb_TVistaLogin_SetErrorText(piStack_14[0x21],L"Failed to select Division");
    }
  }
  Winapi_Windows_SetForegroundWindow(pHStack_38);
  *in_FS_OFFSET = uStack_74;
  UNRECOVERED_JUMPTABLE_02 = (code *)&LAB_009a13f1;
  uVar6 = *(undefined4 *)PTR_DAT_0124f7f8;
  *(undefined4 *)PTR_DAT_0124f7f8 = 0;
  puStack_70 = (undefined4 *)0x9a13db;
  System_TObject_Free(uVar6);
  puStack_70 = (undefined4 *)0x9a13e7;
  Trpcb_ShowApplicationAndFocusOK(*(undefined4 *)PTR_DAT_0124f460);
                    /* WARNING: Could not recover jumptable at 0x009a13e8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_02)(UNRECOVERED_JUMPTABLE_02);
  return;
}

