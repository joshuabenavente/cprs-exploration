/* Unverified decompiler output; inspect assembly and ABI. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void Trpcb_TRPCBroker_SetConnected(undefined4 param_1,char param_2)

{
  code *pcVar1;
  char cVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  undefined4 unaff_EBX;
  undefined4 unaff_ESI;
  int *in_FS_OFFSET;
  bool bVar6;
  undefined1 uStack00000098;
  int iStack_48;
  undefined *puStack_44;
  undefined1 *puStack_40;
  int iStack_3c;
  int *piStack_38;
  int iStack_34;
  code *UNRECOVERED_JUMPTABLE;
  undefined1 *puStack_2c;
  int iStack_28;
  undefined *puStack_24;
  undefined4 UNRECOVERED_JUMPTABLE_00;
  undefined4 uStack_10;
  int iStack_c;
  undefined4 uStack_8;
  
  UNRECOVERED_JUMPTABLE_00 = (code *)((int)register0x00000010 + -4);
  uStack_10 = (undefined1 *)0x8;
  do {
    uStack_8 = (int *)0x0;
    uStack_10 = uStack_10 + -1;
  } while (uStack_10 != (undefined1 *)0x0);
  puStack_24 = &UNK_009a0005;
  iStack_28 = *in_FS_OFFSET;
  *in_FS_OFFSET = (int)&iStack_28;
  puStack_2c = (undefined1 *)0x99f96b;
  func_0x0040afd4(&uStack00000098);
  puStack_2c = (undefined1 *)0x99f97b;
  func_0x009a1a80(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x84),0);
  if ((param_2 != *(char *)((int)UNRECOVERED_JUMPTABLE_00 + 0x4e)) &&
     ((*(byte *)((int)UNRECOVERED_JUMPTABLE_00 + 0x1c) & 2) == 0)) {
    if ((param_2 == '\0') || (param_2 == *(char *)((int)UNRECOVERED_JUMPTABLE_00 + 0x4f))) {
      if (param_2 == '\0') {
        *(undefined1 *)((int)UNRECOVERED_JUMPTABLE_00 + 0x4e) = 0;
        puStack_2c = (undefined1 *)0x99feba;
        func_0x006b860c(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x7c),0);
        puStack_2c = (undefined1 *)0x99fec2;
        cVar2 = func_0x009a0aa8(UNRECOVERED_JUMPTABLE_00);
        if (cVar2 == Trpcb_NoMore) {
          if (*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x74) < 0) {
            puStack_2c = (undefined1 *)0x99fedd;
            func_0x00408cc8();
          }
          puStack_2c = (undefined1 *)0x99feeb;
          func_0x00990a00(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x114));
          *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x74) = 0;
          if (_DAT_01258fa8 != (code *)0x0) {
            puStack_2c = (undefined1 *)0xa;
            UNRECOVERED_JUMPTABLE = _DAT_01258fa8;
            iStack_34 = 0x99ff0d;
            func_0x0041b3c8();
            iVar3 = *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 4);
            iStack_34 = 0x99ff22;
            cVar2 = func_0x004093a4(iVar3,Vcl_Forms__TForm.self_vmt_va);
            if (cVar2 != '\0') {
              puStack_2c = (undefined1 *)0x99ff34;
              func_0x006026ac(iVar3,&puStack_40);
              puStack_2c = (undefined1 *)0x99ff48;
              iVar5 = func_0x0040c4b0(&UNK_009a0434,puStack_40,1);
              if (0 < iVar5) {
                UNRECOVERED_JUMPTABLE = (code *)&UNK_0099ffb7;
                iStack_34 = *in_FS_OFFSET;
                *in_FS_OFFSET = (int)&iStack_34;
                piStack_38 = (int *)0x99ff69;
                puStack_2c = (undefined1 *)((int)register0x00000010 + -4);
                func_0x006026ac(iVar3,(int)register0x00000010 + -0x1c);
                piStack_38 = (int *)0x99ff73;
                func_0x006026ac(iVar3,&puStack_44);
                iVar5 = 0;
                if (puStack_44 != (undefined *)0x0) {
                  iVar5 = *(int *)(puStack_44 + -4);
                }
                piStack_38 = &iStack_48;
                iStack_3c = 0x99ff95;
                func_0x0040c35c(0,1,iVar5 + -0x18);
                iStack_3c = 0x99ff9f;
                func_0x006026fc(iVar3,iStack_48);
                pcVar1 = UNRECOVERED_JUMPTABLE;
                *in_FS_OFFSET = (int)piStack_38;
                UNRECOVERED_JUMPTABLE = (code *)0x99ffbe;
                iStack_34 = 0x99ffb4;
                func_0x0040afd4((int)register0x00000010 + -0x1c,piStack_38,pcVar1);
                    /* WARNING: Could not recover jumptable at 0x0099ffb5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
                (*UNRECOVERED_JUMPTABLE)(UNRECOVERED_JUMPTABLE);
                return;
              }
            }
          }
        }
      }
    }
    else {
      bVar6 = *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xf4) == 0;
      if (!bVar6) {
        puStack_2c = (undefined1 *)0x99f9c8;
        func_0x0040c324(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xf4),
                        *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x70));
        if ((!bVar6) ||
           (*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xf8) !=
            *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x58))) {
          puStack_2c = (undefined1 *)0x99f9e8;
          func_0x0040afd4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xfc));
          puStack_2c = (undefined1 *)0x99f9f5;
          func_0x0040afd4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x100));
          puStack_2c = (undefined1 *)0x99fa02;
          func_0x0040afd4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x104));
          puStack_2c = (undefined1 *)0x99fa0f;
          func_0x0040afd4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x108));
          *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x10c) = 0;
          *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x110) = 0;
        }
      }
      puStack_2c = (undefined1 *)0x99fa38;
      func_0x0040b3c4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xf4),
                      *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x70));
      *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xf8) =
           *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x58);
      puStack_2c = (undefined1 *)0x99fa4f;
      iVar3 = func_0x009a0b90(UNRECOVERED_JUMPTABLE_00);
      *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x74) = iVar3;
      *(undefined1 *)((int)UNRECOVERED_JUMPTABLE_00 + 0x4f) = 1;
      UNRECOVERED_JUMPTABLE = (code *)&UNK_0099fdb8;
      iStack_34 = *in_FS_OFFSET;
      *in_FS_OFFSET = (int)&iStack_34;
      if (*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x74) == 0) {
        puStack_2c = (undefined1 *)((int)register0x00000010 + -4);
        if ((char)*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x54) != '\0') {
          piStack_38 = (int *)0x99fa8d;
          puStack_2c = (undefined1 *)((int)register0x00000010 + -4);
          func_0x0040b40c(&uStack_8,&UNK_009a0020);
          piStack_38 = (int *)0x99fa9a;
          func_0x0040b40c(&iStack_c,&UNK_009a0114);
          piStack_38 = (int *)0x99faa7;
          func_0x0040b40c(&uStack_10,&UNK_009a0268);
          piStack_38 = uStack_8;
          iStack_3c = iStack_c;
          puStack_40 = uStack_10;
          puStack_44 = (undefined *)0x99fabd;
          func_0x0040c214(&iStack_28,3);
          puStack_44 = (undefined *)0x99facb;
          func_0x006aa85c(iStack_28,0xffffffff,0xffffffff);
        }
        piStack_38 = (int *)0x99fad3;
        func_0x009a2b7c(UNRECOVERED_JUMPTABLE_00);
        if ((char)*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xe0) == '\0') {
          piVar4 = *(int **)((int)UNRECOVERED_JUMPTABLE_00 + 0x58);
          piStack_38 = (int *)0x99fb1e;
          func_0x0040b40c((int)register0x00000010 + -0x14,
                          *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x70));
        }
        else {
          piStack_38 = (int *)0x99faed;
          cVar2 = Trpcb_TRPCBroker_StartSecureConnection
                            (UNRECOVERED_JUMPTABLE_00,(int)register0x00000010 + -0x14,
                             (int)register0x00000010 + -0x18);
          if (cVar2 == '\0') {
            *in_FS_OFFSET = iStack_34;
            goto LAB_0099ffbe;
          }
          piStack_38 = (int *)0x99fb06;
          piVar4 = (int *)func_0x0042d1fc(unaff_ESI);
        }
        iStack_3c = *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x78);
        puStack_40 = (undefined1 *)0x99fb3e;
        piStack_38 = piVar4;
        iVar3 = func_0x0099094c(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x114),
                                (char)*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x54),unaff_EBX);
        *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x74) = iVar3;
        puStack_40 = (undefined1 *)0x99fb4c;
        func_0x009a0b94(UNRECOVERED_JUMPTABLE_00);
        puStack_40 = (undefined1 *)0x99fb54;
        func_0x009a0934(UNRECOVERED_JUMPTABLE_00);
        puStack_40 = (undefined1 *)0x99fb61;
        func_0x0040afd4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xfc));
        if (*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xbc) != 0) {
          iVar3 = 0;
          if (_DAT_01258fb4 != 0) {
            iVar3 = *(int *)(_DAT_01258fb4 + -4);
          }
          if (iVar3 == 0) {
            puStack_40 = (undefined1 *)0x99fb93;
            func_0x009a1e10(UNRECOVERED_JUMPTABLE_00,UNRECOVERED_JUMPTABLE_00,&puStack_2c);
            puStack_40 = (undefined1 *)0x99fba0;
            func_0x0040b3c4(&DAT_01258fb4,puStack_2c);
            iVar3 = 0;
            if (_DAT_01258fb4 != 0) {
              iVar3 = *(int *)(_DAT_01258fb4 + -4);
            }
            if (0 < iVar3) {
              puStack_44 = &UNK_0099fce3;
              iStack_48 = *in_FS_OFFSET;
              *in_FS_OFFSET = (int)&iStack_48;
              puStack_40 = (undefined1 *)((int)register0x00000010 + -4);
              puStack_24 = (undefined *)
                           Vcl_OleCtrls_TOleControl_Create
                                     (VERGENCECONTEXTORLib_TLB__TContextorControl.self_vmt_va,1,
                                      *_DAT_0124f460);
              func_0x0040c18c(&iStack_34,_DAT_01258fbc,_DAT_01258fc0,&UNK_009a0304,0xffffffff);
              func_0x0040c028(&UNRECOVERED_JUMPTABLE,iStack_34);
              func_0x008638a8(puStack_24,&UNK_009a030c,UNRECOVERED_JUMPTABLE);
              func_0x009a1f84(UNRECOVERED_JUMPTABLE_00,
                              *(undefined4 *)(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x88) + 8),
                              _DAT_01258fb4,puStack_24,
                              *(undefined4 *)(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x88) + 0x28)
                              ,_DAT_01258fb8);
              func_0x0040b3c4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xac),&UNK_009a0340);
              func_0x0040b3c4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xb0),_DAT_01258fb8);
              func_0x0040b3c4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xb4),&UNK_009a0380);
              func_0x0040b3c4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xb8),
                              *(undefined4 *)(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x88) + 8));
              if (*(int *)(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x88) + 8) != 0) {
                *(undefined1 *)((int)UNRECOVERED_JUMPTABLE_00 + 0xd0) = 1;
              }
              func_0x0040b3c4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 200),&UNK_009a03bc);
              func_0x0040b3c4((int *)((int)UNRECOVERED_JUMPTABLE_00 + 0xcc),
                              *(undefined4 *)(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x88) + 0x28)
                             );
              func_0x004090bc(puStack_24);
              puStack_24 = (undefined *)0x0;
              *in_FS_OFFSET = iStack_48;
            }
          }
        }
        puStack_40 = (undefined1 *)0x99fd17;
        func_0x006b860c(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x7c),1);
        puStack_40 = (undefined1 *)0x99fd21;
        (**(code **)(*(int *)UNRECOVERED_JUMPTABLE_00 + 0x78))(UNRECOVERED_JUMPTABLE_00,0);
      }
      else {
        piStack_38 = (int *)0x99fd2b;
        puStack_2c = (undefined1 *)((int)register0x00000010 + -4);
        func_0x009a0934(UNRECOVERED_JUMPTABLE_00);
        piStack_38 = (int *)0x99fd38;
        func_0x006b860c(*(int *)((int)UNRECOVERED_JUMPTABLE_00 + 0x7c),1);
      }
      *(undefined1 *)((int)UNRECOVERED_JUMPTABLE_00 + 0x4e) = 1;
      *(undefined1 *)((int)UNRECOVERED_JUMPTABLE_00 + 0x4f) = 0;
      if (_DAT_01258fa8 != (code *)0x0) {
        iVar3 = *(int *)((int)UNRECOVERED_JUMPTABLE_00 + 4);
        piStack_38 = (int *)0x99fd64;
        cVar2 = func_0x004093a4(iVar3,Vcl_Forms__TForm.self_vmt_va);
        if (cVar2 != '\0') {
          piStack_38 = (int *)0x99fd72;
          func_0x006026ac(iVar3,&piStack_38);
          piVar4 = piStack_38;
          piStack_38 = (int *)0x99fd86;
          iVar5 = func_0x0040c4b0(&UNK_009a0434,piVar4,1);
          if (iVar5 < 1) {
            piStack_38 = (int *)0x99fd94;
            func_0x006026ac(iVar3,&iStack_3c);
            piStack_38 = (int *)0x99fda1;
            func_0x0040c134(&iStack_3c,&UNK_009a0470);
            piStack_38 = (int *)0x99fdab;
            func_0x006026fc(iVar3,iStack_3c);
          }
        }
      }
      *in_FS_OFFSET = iStack_34;
    }
  }
LAB_0099ffbe:
  piVar4 = (int *)UNRECOVERED_JUMPTABLE_00;
  *in_FS_OFFSET = iStack_28;
  UNRECOVERED_JUMPTABLE_00 = (code *)&UNK_009a000c;
  puStack_24 = (undefined *)0x99ffd8;
  func_0x0040b034(&iStack_48,5,piVar4);
  puStack_24 = (undefined *)0x99ffe0;
  func_0x0040afd4(&iStack_34);
  puStack_24 = (undefined *)0x99ffe8;
  func_0x0040b01c(&UNRECOVERED_JUMPTABLE);
  puStack_24 = (undefined *)0x99fff5;
  func_0x0040b034(&puStack_2c,2);
  puStack_24 = (undefined *)0x9a0002;
  func_0x0040b034((int)register0x00000010 + -0x18,5);
                    /* WARNING: Could not recover jumptable at 0x009a0003. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE_00)(UNRECOVERED_JUMPTABLE_00);
  return;
}

