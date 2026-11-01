/* Unverified decompiler output; inspect assembly and ABI. */

void rTIU_SignDocument(undefined1 *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined2 extraout_var;
  undefined2 extraout_var_00;
  undefined4 *in_FS_OFFSET;
  undefined1 uVar1;
  undefined4 uVar2;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined1 *puStack_30;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined1 uStack_14;
  undefined4 uStack_10;
  undefined1 uStack_c;
  undefined4 uStack_8;
  
  puStack_30 = (undefined1 *)((int)register0x00000010 + -4);
  uStack_20 = 0;
  uStack_1c = 0;
  uStack_8 = 0;
  uVar1 = 1;
  uStack_34 = 0xa0c7b8;
  uStack_38 = *in_FS_OFFSET;
  *in_FS_OFFSET = &uStack_38;
  uVar2 = 0;
  uStack_14 = 0;
  uStack_c = 0x11;
  uStack_18 = param_2;
  uStack_10 = param_3;
  ORNet_CallVistA(L"TIU SIGN RECORD",&uStack_18,1,0,0);
  ORFn_Piece(uStack_8,CONCAT22(extraout_var,0x5e),1,&uStack_1c);
  System__UStrEqual(uStack_1c,&DAT_00a0c800);
  *param_1 = uVar1;
  ORFn_Piece(uStack_8,CONCAT22(extraout_var_00,0x5e),2,&uStack_20);
  System__UStrAsg(param_1 + 4,uStack_20);
  *in_FS_OFFSET = uVar2;
  System__UStrArrayClr(&uStack_20,2,&uStack_8);
  System__UStrClr(&uStack_8);
                    /* WARNING: Could not recover jumptable at 0x00a0c7b6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)0xa0c7bf)(0xa0c7bf);
  return;
}

