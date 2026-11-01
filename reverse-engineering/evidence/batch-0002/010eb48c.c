/* Unverified decompiler output; inspect assembly and ABI. */

void rODBase_PutNewOrder(int *param_1,undefined4 *param_2)

{
  code *pcVar1;
  char cVar2;
  short sVar3;
  int iVar4;
  undefined4 unaff_EBX;
  undefined4 uVar5;
  code **ppcVar6;
  undefined4 *in_FS_OFFSET;
  bool bVar7;
  undefined1 uVar8;
  float10 fVar9;
  undefined4 uStack_138;
  undefined4 uStack_134;
  undefined4 uStack_130;
  int iStack_12c;
  undefined4 uStack_128;
  undefined4 uStack_124;
  undefined4 uStack_120;
  undefined4 uStack_11c;
  int iStack_118;
  undefined4 uStack_114;
  undefined1 uStack_110;
  int iStack_10c;
  undefined1 uStack_108;
  undefined4 uStack_104;
  undefined1 uStack_100;
  code *pcStack_fc;
  undefined1 uStack_f8;
  int iStack_f4;
  undefined1 uStack_f0;
  undefined4 uStack_ec;
  undefined1 uStack_e8;
  undefined4 uStack_e4;
  undefined1 uStack_e0;
  undefined4 uStack_dc;
  undefined1 uStack_d8;
  undefined1 uStack_d0;
  undefined4 uStack_cc;
  undefined1 uStack_c8;
  undefined4 uStack_c4;
  undefined1 uStack_c0;
  undefined4 uStack_bc;
  undefined1 uStack_b8;
  undefined1 auStack_b4 [8];
  ushort uStack_ac;
  int *piStack_9c;
  int *piStack_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  int iStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined1 auStack_64 [12];
  undefined4 uStack_58;
  code *UNRECOVERED_JUMPTABLE [12];
  undefined1 *puStack_24;
  code *UNRECOVERED_JUMPTABLE_00;
  char cStack_10;
  undefined1 auStack_f [11];
  
  iVar4 = 0x26;
  do {
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  LOCK();
  UNLOCK();
  UNRECOVERED_JUMPTABLE_00 = (code *)0x0;
  ppcVar6 = UNRECOVERED_JUMPTABLE;
  for (iVar4 = 0x14; iVar4 != 0; iVar4 = iVar4 + -1) {
    *ppcVar6 = (code *)*param_2;
    param_2 = param_2 + 1;
    ppcVar6 = ppcVar6 + 1;
  }
  uStack_7c = UNRECOVERED_JUMPTABLE_00;
  UNRECOVERED_JUMPTABLE_00 = (code *)0x10eb4c7;
  piStack_98 = param_1;
  System__AddRefRecord(UNRECOVERED_JUMPTABLE,PTR_DAT_010e929c);
  UNRECOVERED_JUMPTABLE_00 = (code *)0x10eb4cf;
  System__UStrAddRef(uStack_7c);
  puStack_24 = &LAB_010eba2c;
  UNRECOVERED_JUMPTABLE[0xb] = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = UNRECOVERED_JUMPTABLE + 0xb;
  UNRECOVERED_JUMPTABLE[10] = (code *)0x10eb4e5;
  UNRECOVERED_JUMPTABLE_00 = (code *)(auStack_f + 0xb);
  ORNetIntf_NewORNetMult(&uStack_58);
  if (((code *)*(int *)PTR_DAT_0124e85c != UNRECOVERED_JUMPTABLE[3]) &&
     (bVar7 = UNRECOVERED_JUMPTABLE[3] == (code *)*(int *)PTR_DAT_0124e89c, !bVar7)) {
    UNRECOVERED_JUMPTABLE[10] = (code *)0x10eb509;
    System__UStrEqual(UNRECOVERED_JUMPTABLE[0],L"PSJI OR PAT FLUID OE");
    if (!bVar7) {
      UNRECOVERED_JUMPTABLE[10] = (code *)0x10eb527;
      rODBase_SetupORDIALOG(uStack_58,unaff_EBX,0);
      goto LAB_010eb527;
    }
  }
  UNRECOVERED_JUMPTABLE[10] = (code *)0x10eb518;
  rODBase_SetupORDIALOG(uStack_58,unaff_EBX,1);
LAB_010eb527:
  UNRECOVERED_JUMPTABLE[9] = (code *)0x10eb52d;
  UNRECOVERED_JUMPTABLE[10] = (code *)(auStack_f + 0xb);
  rODBase_setListParam();
  UNRECOVERED_JUMPTABLE[10] = (code *)0x10eb539;
  System__UStrClr(&uStack_8c);
  if (((cStack_10 != '\0') || ((code *)*(int *)PTR_DAT_0124f688 == UNRECOVERED_JUMPTABLE[3])) ||
     ((code *)*(int *)PTR_DAT_0124e89c == UNRECOVERED_JUMPTABLE[3])) {
    fVar9 = (float10)*(double *)(*(int *)PTR_uCore_Encounter_0124e2a0 + 8);
    uStack_ac = (ushort)((unkuint10)fVar9 >> 0x40);
    UNRECOVERED_JUMPTABLE[10] = (code *)(uint)uStack_ac;
    auStack_b4._4_4_ = SUB104((unkuint10)fVar9 >> 0x20,0);
    UNRECOVERED_JUMPTABLE[9] = (code *)auStack_b4._4_4_;
    auStack_b4._0_4_ = SUB104(fVar9,0);
    UNRECOVERED_JUMPTABLE[8] = (code *)auStack_b4._0_4_;
    UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb58c;
    _auStack_b4 = fVar9;
    System_SysUtils_FloatToStr(PTR_DAT_0124f788,&uStack_8c);
  }
  UNRECOVERED_JUMPTABLE[10] = (code *)0x10eb598;
  piStack_9c = (int *)System_Classes_TStringList_Create(System_Classes__TStringList.self_vmt_va,1);
  UNRECOVERED_JUMPTABLE[9] = (code *)&LAB_010eb9d2;
  UNRECOVERED_JUMPTABLE[8] = (code *)*in_FS_OFFSET;
  *in_FS_OFFSET = UNRECOVERED_JUMPTABLE + 8;
  UNRECOVERED_JUMPTABLE[6] = (code *)0x0;
  uStack_114 = *(undefined4 *)(*(int *)PTR_DAT_0124f2e0 + 4);
  uStack_110 = 0x11;
  iStack_10c = *(int *)PTR_uCore_Encounter_0124e2a0 + 0x20;
  uStack_108 = 0x10;
  uStack_104 = *(undefined4 *)(*(int *)PTR_uCore_Encounter_0124e2a0 + 0x10);
  uStack_100 = 0;
  pcStack_fc = UNRECOVERED_JUMPTABLE[0];
  uStack_f8 = 0x11;
  iStack_f4 = (int)UNRECOVERED_JUMPTABLE[3];
  uStack_f0 = 0;
  uStack_ec = UNRECOVERED_JUMPTABLE[4];
  uStack_e8 = 0;
  uStack_e4 = *(undefined4 *)(*piStack_98 + 0x6c);
  uStack_e0 = 0x11;
  uStack_dc = uStack_58;
  uStack_d8 = 0xe;
  uStack_d0 = 0x11;
  uStack_cc = uStack_8c;
  uStack_c8 = 0x11;
  uStack_c4 = uStack_7c;
  uStack_c0 = 0x11;
  uStack_bc = 0;
  uStack_b8 = 0;
  UNRECOVERED_JUMPTABLE[5] = (code *)0x10eb6aa;
  UNRECOVERED_JUMPTABLE[7] = (code *)piStack_9c;
  UNRECOVERED_JUMPTABLE[10] = (code *)(auStack_f + 0xb);
  cVar2 = ORNet_CallVistA(L"ORWDX SAVE",&uStack_114,0xb);
  if (cVar2 != '\0') {
    *PTR_uCore_uAllergyCacheCreated_0124e118 = 0;
  }
  UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb6c1;
  iVar4 = (**(code **)(*piStack_9c + 0x14))();
  if (iVar4 == 0) {
    UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb6ca;
    System__TryFinallyExit();
    pcVar1 = UNRECOVERED_JUMPTABLE_00;
    *in_FS_OFFSET = UNRECOVERED_JUMPTABLE[0xb];
    UNRECOVERED_JUMPTABLE_00 = (code *)&LAB_010eba33;
    puStack_24 = (undefined1 *)0x10eb9f6;
    System__UStrArrayClr(&uStack_138,9,pcVar1);
    puStack_24 = (undefined1 *)0x10eba06;
    System__UStrArrayClr(&uStack_8c,6);
    puStack_24 = (undefined1 *)0x10eba13;
    System__UStrArrayClr(auStack_64,3);
    puStack_24 = (undefined1 *)0x10eba1b;
    System__IntfClear(&uStack_58);
    puStack_24 = (undefined1 *)0x10eba29;
    System__FinalizeRecord(UNRECOVERED_JUMPTABLE,PTR_DAT_010e929c);
                    /* WARNING: Could not recover jumptable at 0x010eba2a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
    return;
  }
  UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb6df;
  (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&uStack_80);
  UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb6ec;
  (**(code **)(*piStack_9c + 0x4c))(piStack_9c,0);
  UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb6f4;
  System__UStrClr(&iStack_84);
  UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb7b2;
  iVar4 = (**(code **)(*piStack_9c + 0x14))();
  if (0 < iVar4) {
    UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb7c9;
    (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&uStack_120);
    UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb7d9;
    sVar3 = ORFn_CharAt(uStack_120,1);
    if (sVar3 != 0x7e) {
      UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb7f2;
      (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&uStack_124);
      UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb802;
      sVar3 = ORFn_CharAt(uStack_124,1);
      if (sVar3 != 0x7c) {
        uStack_90 = 0;
        UNRECOVERED_JUMPTABLE[6] = (code *)&LAB_010eb793;
        UNRECOVERED_JUMPTABLE[5] = (code *)*in_FS_OFFSET;
        *in_FS_OFFSET = UNRECOVERED_JUMPTABLE + 5;
        UNRECOVERED_JUMPTABLE[4] = (code *)0x10eb722;
        UNRECOVERED_JUMPTABLE[7] = (code *)(auStack_f + 0xb);
        (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&uStack_90);
        UNRECOVERED_JUMPTABLE[4] = (code *)0x10eb735;
        (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&iStack_118);
        uVar5 = 0;
        if (iStack_118 != 0) {
          uVar5 = *(undefined4 *)(iStack_118 + -4);
        }
        UNRECOVERED_JUMPTABLE[4] = (code *)iStack_84;
        UNRECOVERED_JUMPTABLE[3] = (code *)&uStack_11c;
        UNRECOVERED_JUMPTABLE[2] = (code *)0x10eb760;
        System__UStrCopy(uStack_90,2,uVar5);
        UNRECOVERED_JUMPTABLE[3] = (code *)uStack_11c;
        UNRECOVERED_JUMPTABLE[2] = (code *)&DAT_010ebaa4;
        UNRECOVERED_JUMPTABLE[1] = (code *)0x10eb778;
        System__UStrCatN(&iStack_84,3);
        pcVar1 = UNRECOVERED_JUMPTABLE[4];
        *in_FS_OFFSET = UNRECOVERED_JUMPTABLE[2];
        UNRECOVERED_JUMPTABLE[4] = (code *)&LAB_010eb79a;
        UNRECOVERED_JUMPTABLE[3] = (code *)0x10eb790;
        System__UStrClr(&uStack_90,UNRECOVERED_JUMPTABLE[2],pcVar1);
                    /* WARNING: Could not recover jumptable at 0x010eb791. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*UNRECOVERED_JUMPTABLE[4])(UNRECOVERED_JUMPTABLE[4]);
        return;
      }
    }
  }
  iVar4 = 0;
  if (iStack_84 != 0) {
    iVar4 = *(int *)(iStack_84 + -4);
  }
  if (0 < iVar4) {
    iVar4 = 0;
    if (iStack_84 != 0) {
      iVar4 = *(int *)(iStack_84 + -4);
    }
    UNRECOVERED_JUMPTABLE[7] = (code *)&iStack_84;
    UNRECOVERED_JUMPTABLE[6] = (code *)0x10eb83b;
    System__UStrCopy(iStack_84,1,iVar4 + -2);
  }
  UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb846;
  System__UStrClr(&uStack_88);
  UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb851;
  iVar4 = (**(code **)(*piStack_9c + 0x14))();
  if (0 < iVar4) {
    uVar8 = 1;
    UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb86c;
    (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&uStack_128);
    UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb87c;
    System__UStrEqual(uStack_128,&DAT_010ebab8);
    if ((bool)uVar8) {
      UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb88f;
      (**(code **)(*piStack_9c + 0x4c))(piStack_9c,0);
      UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb943;
      iVar4 = (**(code **)(*piStack_9c + 0x14))();
      if (0 < iVar4) {
        UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb95a;
        (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&uStack_134);
        UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb96a;
        sVar3 = ORFn_CharAt(uStack_134,1);
        if (sVar3 != 0x7e) {
          UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb983;
          (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&uStack_138);
          UNRECOVERED_JUMPTABLE[7] = (code *)0x10eb993;
          sVar3 = ORFn_CharAt(uStack_138,1);
          if (sVar3 != 0x7c) {
            uStack_94 = 0;
            UNRECOVERED_JUMPTABLE[6] = (code *)&LAB_010eb924;
            UNRECOVERED_JUMPTABLE[5] = (code *)*in_FS_OFFSET;
            *in_FS_OFFSET = UNRECOVERED_JUMPTABLE + 5;
            UNRECOVERED_JUMPTABLE[4] = (code *)0x10eb8bd;
            UNRECOVERED_JUMPTABLE[7] = (code *)(auStack_f + 0xb);
            (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&uStack_94);
            UNRECOVERED_JUMPTABLE[4] = (code *)0x10eb8d0;
            (**(code **)(*piStack_9c + 0xc))(piStack_9c,0,&iStack_12c);
            uVar5 = 0;
            if (iStack_12c != 0) {
              uVar5 = *(undefined4 *)(iStack_12c + -4);
            }
            UNRECOVERED_JUMPTABLE[4] = (code *)&uStack_130;
            UNRECOVERED_JUMPTABLE[3] = (code *)0x10eb8f8;
            System__UStrCopy(uStack_94,2,uVar5);
            UNRECOVERED_JUMPTABLE[4] = (code *)0x10eb909;
            System__UStrCat(&uStack_88,uStack_130);
            pcVar1 = UNRECOVERED_JUMPTABLE[7];
            *in_FS_OFFSET = UNRECOVERED_JUMPTABLE[5];
            UNRECOVERED_JUMPTABLE[7] = (code *)&LAB_010eb92b;
            UNRECOVERED_JUMPTABLE[6] = (code *)0x10eb921;
            System__UStrClr(&uStack_94,UNRECOVERED_JUMPTABLE[5],pcVar1);
                    /* WARNING: Could not recover jumptable at 0x010eb922. Too many branches */
                    /* WARNING: Treating indirect jump as call */
            (*UNRECOVERED_JUMPTABLE[7])(UNRECOVERED_JUMPTABLE[7]);
            return;
          }
        }
      }
    }
  }
  UNRECOVERED_JUMPTABLE[7] = (code *)uStack_88;
  UNRECOVERED_JUMPTABLE[6] = (code *)0x10eb9b7;
  rOrders_SetOrderFields(*piStack_98,uStack_80,iStack_84);
  pcVar1 = UNRECOVERED_JUMPTABLE[9];
  *in_FS_OFFSET = UNRECOVERED_JUMPTABLE[7];
  UNRECOVERED_JUMPTABLE[9] = (code *)0x10eb9d9;
  UNRECOVERED_JUMPTABLE[8] = (code *)0x10eb9cf;
  System_TObject_Free(piStack_9c,UNRECOVERED_JUMPTABLE[7],pcVar1);
                    /* WARNING: Could not recover jumptable at 0x010eb9d0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE[9])(UNRECOVERED_JUMPTABLE[9]);
  return;
}

