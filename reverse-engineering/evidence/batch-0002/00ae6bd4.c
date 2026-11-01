/* Unverified decompiler output; inspect assembly and ABI. */

void uVitals_LoadVitalsDLL(int param_1)

{
  code *pcVar1;
  int iVar2;
  int iVar3;
  undefined4 *in_FS_OFFSET;
  undefined4 uStack_1c;
  undefined1 *puStack_18;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  uStack_8 = 0;
  puStack_18 = &LAB_00ae6c48;
  uStack_1c = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_1c;
  iVar2 = System_TObject_Create(uVitals__LoadVitalsDLL_ActRec.self_vmt_va,1);
  iVar3 = iVar2;
  if (iVar2 != 0) {
    iVar3 = iVar2 + 8;
  }
  System__IntfCopy(&uStack_8,iVar3);
  if (uVitals_VitalsDLLHandle == 0) {
    if (iVar2 != 0) {
      iVar2 = iVar2 + 0xc;
    }
    rMisc_LoadDll(L"GMV_VitalsViewEnter.dll",iVar2,param_1);
    uVitals_VitalsDLLHandle = *(int *)(param_1 + 8);
  }
  pcVar1 = UNRECOVERED_JUMPTABLE;
  *in_FS_OFFSET = uStack_1c;
  UNRECOVERED_JUMPTABLE = (code *)&LAB_00ae6c4f;
  puStack_18 = (undefined1 *)0xae6c45;
  System__IntfClear(&uStack_8,uStack_1c,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x00ae6c46. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

