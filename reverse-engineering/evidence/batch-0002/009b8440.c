/* Unverified decompiler output; inspect assembly and ABI. */

void ORSystem_BorlandDLLVersionOK(void)

{
  code *pcVar1;
  int iVar2;
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined4 *in_FS_OFFSET;
  wchar_t *pwVar3;
  undefined *puVar4;
  undefined4 uVar5;
  wchar_t *pwVar6;
  undefined4 uVar7;
  undefined4 uStack_238;
  undefined1 *puStack_234;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_22c;
  undefined4 uStack_228;
  undefined4 uStack_224;
  undefined4 uStack_220;
  WCHAR aWStack_21c [262];
  undefined4 uStack_10;
  HMODULE pHStack_c;
  WCHAR WStack_8;
  undefined1 uStack_5;
  
  UNRECOVERED_JUMPTABLE = (code *)(aWStack_21c + 0x10c);
  uStack_228 = 0;
  uStack_22c = 0;
  uStack_224 = 0;
  uStack_220 = 0;
  uStack_10 = 0;
  puStack_234 = &LAB_009b858d;
  uStack_238 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_238;
  uStack_5 = 1;
  pHStack_c = Winapi_Windows_GetModuleHandle(L"BORLNDMM.DLL");
  if (pHStack_c == (HMODULE)0x0) {
    ORFn_InfoBox(L"This version of CPRS is unable to run because\r\nno copy of BORLNDMM.DLL can be found\r\nin your workstation\'s current PATH.\r\n\r\nPlease contact IRM for assistance."
                 ,L"ERROR - BORLNDMM.DLL",CONCAT22(extraout_var,0x10));
    uStack_5 = 0;
  }
  else {
    Winapi_Windows_GetModuleFileName(pHStack_c,aWStack_21c,0x105);
    System__UStrFromWArray(&uStack_220,aWStack_21c,0x106);
    ORSystem_ClientVersion(uStack_220,&uStack_10);
    ORFn_Piece(uStack_10,CONCAT22(extraout_var_01,0x2e),1,&uStack_224);
    iVar2 = System_SysUtils_StrToIntDef(uStack_224,0);
    if (iVar2 < 10) {
      System__UStrFromWArray
                (&uStack_22c,aWStack_21c,0x106,
                 L"This version of CPRS is unable to run because\r\nthe copy of BORLNDMM.DLL located at:\r\n\r\n   "
                );
      pwVar6 = L"\r\n\r\nis out of date  (Version ";
      puVar4 = &DAT_009b8854;
      pwVar3 = L"\r\n\r\nPlease contact IRM for assistance.";
      uVar5 = uStack_10;
      uVar7 = uStack_22c;
      System__UStrCatN(&uStack_228,6);
      ORFn_InfoBox(uStack_228,L"ERROR - BORLNDMM.DLL",CONCAT22(extraout_var_00,0x10),pwVar3,puVar4,
                   uVar5,pwVar6,uVar7);
      uStack_5 = 0;
    }
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_238;
  UNRECOVERED_JUMPTABLE = (code *)&LAB_009b8594;
  puStack_234 = (undefined1 *)0x9b8582;
  System__UStrArrayClr(&uStack_22c,4,pcVar1);
  puStack_234 = (undefined1 *)0x9b858a;
  System__UStrClr(&uStack_10);
                    /* WARNING: Could not recover jumptable at 0x009b858b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

