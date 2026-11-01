/* Unverified decompiler output; inspect assembly and ABI. */

void ORNet_UpdateContext(undefined4 param_1)

{
  undefined1 uVar1;
  int iVar2;
  code *pcVar3;
  int *piVar4;
  int iVar5;
  undefined4 *in_FS_OFFSET;
  bool bVar6;
  undefined1 uVar7;
  undefined4 uStack_34;
  undefined1 *puStack_30;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_28;
  undefined1 *puStack_24;
  code *UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  uStack_c = 0;
  uStack_10 = 0;
  UNRECOVERED_JUMPTABLE_00 = (code *)0x9ae18a;
  uStack_8 = param_1;
  System__UStrAddRef(param_1);
  bVar6 = true;
  puStack_24 = &LAB_009ae2d6;
  uStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_28;
  UNRECOVERED_JUMPTABLE = (code *)0x9ae1a9;
  UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
  System__UStrEqual(uStack_8,DAT_01258fcc[0x14]);
  pcVar3 = UNRECOVERED_JUMPTABLE_00;
  if (bVar6) {
    *in_FS_OFFSET = uStack_28;
    UNRECOVERED_JUMPTABLE_00 = (code *)&LAB_009ae2dd;
    puStack_24 = (undefined1 *)0x9ae2d3;
    System__UStrArrayClr(&uStack_10,3,pcVar3);
                    /* WARNING: Could not recover jumptable at 0x009ae2d4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
    return;
  }
  UNRECOVERED_JUMPTABLE = (code *)0x9ae1c5;
  System__UStrLAsg(&uStack_c,DAT_01258fcc[0x1b]);
  UNRECOVERED_JUMPTABLE = (code *)0x9ae1d6;
  System__UStrLAsg(&uStack_10,DAT_01258fcc[0x1a]);
  iVar2 = DAT_01258fcc[0x13];
  uVar1 = *(undefined1 *)((int)DAT_01258fcc + 0x4d);
  UNRECOVERED_JUMPTABLE = (code *)0x9ae1fc;
  piVar4 = (int *)Trpcb_TParams_Create(Trpcb__TParams.self_vmt_va,1,0);
  UNRECOVERED_JUMPTABLE = (code *)0x9ae20f;
  (**(code **)(*piVar4 + 8))(piVar4,DAT_01258fcc[0x17]);
  puStack_30 = &LAB_009ae2b2;
  uStack_34 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_34;
  iVar5 = 0;
  uVar7 = true;
  UNRECOVERED_JUMPTABLE = (code *)((int)register0x00000010 + -4);
  do {
    (**(code **)(*DAT_01258fcc + 0x78))(DAT_01258fcc,uStack_8);
    System__UStrEqual(DAT_01258fcc[0x14],uStack_8);
    pcVar3 = UNRECOVERED_JUMPTABLE;
    if ((bool)uVar7) {
      iVar5 = 5;
    }
    else {
      iVar5 = iVar5 + 1;
    }
    uVar7 = iVar5 == 5;
  } while (iVar5 < 5);
  *in_FS_OFFSET = uStack_34;
  UNRECOVERED_JUMPTABLE = (code *)0x9ae2b9;
  puStack_30 = (undefined1 *)0x9ae26b;
  System__UStrAsg(DAT_01258fcc + 0x1b,uStack_c,pcVar3);
  puStack_30 = (undefined1 *)0x9ae27b;
  System__UStrAsg(DAT_01258fcc + 0x1a,uStack_10);
  puStack_30 = (undefined1 *)0x9ae289;
  (**(code **)(*DAT_01258fcc + 0x44))(DAT_01258fcc,(char)iVar2);
  puStack_30 = (undefined1 *)0x9ae297;
  (**(code **)(*DAT_01258fcc + 0x48))(DAT_01258fcc,uVar1);
  puStack_30 = (undefined1 *)0x9ae2a7;
  (**(code **)(*(int *)DAT_01258fcc[0x17] + 8))((int *)DAT_01258fcc[0x17],piVar4);
  puStack_30 = (undefined1 *)0x9ae2af;
  System_TObject_Free(piVar4);
                    /* WARNING: Could not recover jumptable at 0x009ae2b0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
  return;
}

