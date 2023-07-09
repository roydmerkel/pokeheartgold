#include "constants/pokemon.h"
#include "constants/sndseq.h"
#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "overlay_12_0224E4FC.inc"
	.include "global.inc"

	.text
    .public AddBattlerVar
    .public sTypeEffectiveness
    .public ov12_02251C74
    .public CheckMoveEffectOnField
    .public GetHeldItemStealBerryEffect
    .public GetHeldItemFlingEffect
    .public GetHeldItemFlingPower
    .public ov12_02256F28

	thumb_func_start CheckItemEffectOnUTurn
CheckItemEffectOnUTurn: ; 0x02257FA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	ldr r1, [r5, #0x64]
	str r0, [sp]
	add r0, r5, #0
	add r4, r2, #0
	mov r6, #0
	bl GetBattlerHeldItemEffect
	str r0, [sp, #0xc]
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r6, #0
	bl GetHeldItemModifier
	str r0, [sp, #0x10]
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	bl GetBattlerHeldItemEffect
	add r7, r0, #0
	ldr r1, [r5, #0x6c]
	add r0, r5, #0
	add r2, r6, #0
	bl GetHeldItemModifier
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r1, [r5, #0x64]
	bl BattleSystem_GetFieldSide
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	cmp r0, #0x58
	bne _0225803C
	ldr r0, _02258164 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0225803C
	ldr r0, [r5, #0x64]
	mov r1, #0x1c
	mul r1, r0
	add r2, r5, r1
	mov r1, #0xbb
	lsl r1, r1, #2
	ldr r2, [r2, r1]
	cmp r2, #0
	beq _0225803C
	ldr r1, [r5, #0x6c]
	cmp r0, r1
	beq _0225803C
	mov r1, #0xc0
	mul r1, r0
	ldr r3, _02258168 ; =0x00002D8C
	add r1, r5, r1
	ldr r0, [r1, r3]
	add r3, r3, #4
	ldr r1, [r1, r3]
	cmp r0, r1
	bhs _0225803C
	cmp r0, #0
	beq _0225803C
	ldr r1, [sp, #0x10]
	neg r0, r2
	bl DamageDivide
	ldr r1, _0225816C ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	mov r0, #0x46
	ldr r1, [r5, #0x64]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0xd5
	str r0, [r4]
_0225803C:
	ldr r0, [sp, #0xc]
	cmp r0, #0x62
	bne _0225809E
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x62
	beq _0225809E
	ldr r0, _02258164 ; =0x0000213C
	ldr r1, [r5, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0225809E
	ldr r0, _02258170 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	mov r0, #0x3e
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #2
	beq _0225809E
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldr r3, _02258168 ; =0x00002D8C
	add r2, r5, r2
	ldr r1, [r2, r3]
	cmp r1, #0
	beq _0225809E
	add r1, r3, #4
	ldr r1, [r2, r1]
	sub r0, #0xc1
	mul r0, r1
	mov r1, #0xa
	bl DamageDivide
	ldr r1, _0225816C ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	mov r0, #0x46
	ldr r1, [r5, #0x64]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0xd6
	str r0, [r4]
_0225809E:
	cmp r7, #0x2e
	bne _022580F2
	ldr r1, [r5, #0x64]
	mov r0, #0xc0
	mul r0, r1
	add r2, r5, r0
	ldr r0, _02258168 ; =0x00002D8C
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _022580F2
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x62
	beq _022580F2
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r1, r5, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022580F2
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02258174 ; =0x00002D90
	add r2, r5, r2
	ldr r2, [r2, r0]
	sub r1, #0xc1
	add r0, r2, #0
	mul r0, r1
	ldr r1, [sp, #8]
	bl DamageDivide
	ldr r1, _0225816C ; =0x0000215C
	mov r6, #1
	str r0, [r5, r1]
	lsr r0, r1, #5
	str r0, [r4]
_022580F2:
	cmp r7, #0x74
	bne _0225815E
	ldr r0, [r5, #0x64]
	mov r1, #0xc0
	mul r1, r0
	add r3, r5, r1
	ldr r1, _02258168 ; =0x00002D8C
	ldr r2, [r3, r1]
	cmp r2, #0
	beq _0225815E
	add r1, #0x2c
	ldrh r1, [r3, r1]
	cmp r1, #0
	bne _0225815E
	add r1, r5, r0
	ldr r0, _02258178 ; =0x0000219C
	ldrb r0, [r1, r0]
	bl MaskOfFlagNo
	ldr r1, [sp, #4]
	lsl r1, r1, #3
	add r2, r5, r1
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #3
	lsr r1, r1, #0x1a
	tst r0, r1
	bne _0225815E
	ldr r1, [r5, #0x6c]
	mov r0, #0x1c
	mul r0, r1
	add r2, r5, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _02258146
	add r0, #8
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225815E
_02258146:
	ldr r0, _02258170 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0225817C ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #1
	tst r1, r0
	beq _0225815E
	mov r1, #0xd8
	str r1, [r4]
	add r6, r0, #0
_0225815E:
	add r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02258164: .word 0x0000213C
_02258168: .word 0x00002D8C
_0225816C: .word 0x0000215C
_02258170: .word 0x00003044
_02258174: .word 0x00002D90
_02258178: .word 0x0000219C
_0225817C: .word 0x000003E9
	thumb_func_end CheckItemEffectOnUTurn

	thumb_func_start CheckIgnorePressure
CheckIgnorePressure: ; 0x02258180
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #0xff
	beq _022581B0
	add r1, r2, #0
	bl GetBattlerAbility
	cmp r0, #0x2e
	bne _022581B0
	ldr r0, _022581B4 ; =0x00002D6C
	add r1, r5, r0
	mov r0, #0xc0
	mul r0, r4
	add r0, r1, r0
	lsl r1, r4, #1
	add r2, r5, r1
	ldr r1, _022581B8 ; =0x000030BC
	ldrh r2, [r2, r1]
	ldrb r1, [r0, r2]
	cmp r1, #0
	beq _022581B0
	sub r1, r1, #1
	strb r1, [r0, r2]
_022581B0:
	pop {r3, r4, r5, pc}
	nop
_022581B4: .word 0x00002D6C
_022581B8: .word 0x000030BC
	thumb_func_end CheckIgnorePressure

	thumb_func_start ov12_022581BC
ov12_022581BC: ; 0x022581BC
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0223BFEC
	cmp r0, #0
	beq _022581D0
	mov r0, #0x2b
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_022581D0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov12_022581BC

	thumb_func_start ov12_022581D4
ov12_022581D4: ; 0x022581D4
	push {r4, lr}
	add r4, r1, #0
	cmp r2, #0xe
	bhi _02258294
	add r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022581E8: ; jump table
	.short _02258206 - _022581E8 - 2 ; case 0
	.short _02258218 - _022581E8 - 2 ; case 1
	.short _0225822E - _022581E8 - 2 ; case 2
	.short _02258236 - _022581E8 - 2 ; case 3
	.short _0225823E - _022581E8 - 2 ; case 4
	.short _02258244 - _022581E8 - 2 ; case 5
	.short _0225824A - _022581E8 - 2 ; case 6
	.short _02258256 - _022581E8 - 2 ; case 7
	.short _02258262 - _022581E8 - 2 ; case 8
	.short _0225826C - _022581E8 - 2 ; case 9
	.short _02258274 - _022581E8 - 2 ; case 10
	.short _0225827A - _022581E8 - 2 ; case 11
	.short _02258282 - _022581E8 - 2 ; case 12
	.short _0225828C - _022581E8 - 2 ; case 13
	.short _02258290 - _022581E8 - 2 ; case 14
_02258206:
	add r1, r3, #0
	bl BattleSystem_GetFieldSide
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
_02258218:
	add r1, r3, #0
	bl BattleSystem_GetFieldSide
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1d
	pop {r4, pc}
_0225822E:
	ldr r0, _0225829C ; =0x0000219C
	add r1, r4, r3
	ldrb r0, [r1, r0]
	pop {r4, pc}
_02258236:
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	pop {r4, pc}
_0225823E:
	ldr r0, _022582A0 ; =0x00003109
	ldrb r0, [r4, r0]
	pop {r4, pc}
_02258244:
	ldr r0, _022582A4 ; =0x0000311D
	ldrb r0, [r4, r0]
	pop {r4, pc}
_0225824A:
	lsl r0, r3, #2
	add r1, r4, r0
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
_02258256:
	lsl r0, r3, #2
	add r1, r4, r0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
_02258262:
	lsl r0, r3, #4
	add r1, r4, r0
	ldr r0, _022582A8 ; =0x000021A8
	ldr r0, [r1, r0]
	pop {r4, pc}
_0225826C:
	mov r0, #0x3d
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	pop {r4, pc}
_02258274:
	ldr r0, _022582AC ; =0x00003108
	ldrb r0, [r4, r0]
	pop {r4, pc}
_0225827A:
	ldr r0, _022582B0 ; =0x000003DA
	add r1, r4, r3
	ldrb r0, [r1, r0]
	pop {r4, pc}
_02258282:
	lsl r0, r3, #4
	add r1, r4, r0
	ldr r0, _022582B4 ; =0x000021B0
	ldr r0, [r1, r0]
	pop {r4, pc}
_0225828C:
	ldr r0, [r4, #8]
	pop {r4, pc}
_02258290:
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_02258294:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0225829C: .word 0x0000219C
_022582A0: .word 0x00003109
_022582A4: .word 0x0000311D
_022582A8: .word 0x000021A8
_022582AC: .word 0x00003108
_022582B0: .word 0x000003DA
_022582B4: .word 0x000021B0
	thumb_func_end ov12_022581D4

	thumb_func_start ov12_022582B8
ov12_022582B8: ; 0x022582B8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r4, [sp, #0x10]
	cmp r2, #0xb
	bhi _02258336
	add r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022582CE: ; jump table
	.short _022582E6 - _022582CE - 2 ; case 0
	.short _022582F8 - _022582CE - 2 ; case 1
	.short _02258316 - _022582CE - 2 ; case 2
	.short _0225831E - _022582CE - 2 ; case 3
	.short _02258336 - _022582CE - 2 ; case 4
	.short _02258336 - _022582CE - 2 ; case 5
	.short _02258336 - _022582CE - 2 ; case 6
	.short _02258336 - _022582CE - 2 ; case 7
	.short _02258336 - _022582CE - 2 ; case 8
	.short _02258326 - _022582CE - 2 ; case 9
	.short _02258336 - _022582CE - 2 ; case 10
	.short _0225832E - _022582CE - 2 ; case 11
_022582E6:
	add r1, r3, #0
	bl BattleSystem_GetFieldSide
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x6f
	lsl r0, r0, #2
	str r4, [r1, r0]
	pop {r3, r4, r5, pc}
_022582F8:
	add r1, r3, #0
	bl BattleSystem_GetFieldSide
	mov r1, #0x71
	lsl r1, r1, #2
	add r1, r5, r1
	lsl r0, r0, #3
	ldr r3, [r1, r0]
	ldr r2, _0225833C ; =0xFFFF8FFF
	and r3, r2
	lsl r2, r4, #0x1d
	lsr r2, r2, #0x11
	orr r2, r3
	str r2, [r1, r0]
	pop {r3, r4, r5, pc}
_02258316:
	ldr r0, _02258340 ; =0x0000219C
	add r1, r5, r3
	strb r4, [r1, r0]
	pop {r3, r4, r5, pc}
_0225831E:
	mov r0, #0x15
	lsl r0, r0, #4
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
_02258326:
	mov r0, #0x3d
	lsl r0, r0, #4
	strb r4, [r5, r0]
	pop {r3, r4, r5, pc}
_0225832E:
	ldr r0, _02258344 ; =0x000003DA
	add r1, r5, r3
	strb r4, [r1, r0]
	pop {r3, r4, r5, pc}
_02258336:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225833C: .word 0xFFFF8FFF
_02258340: .word 0x0000219C
_02258344: .word 0x000003DA
	thumb_func_end ov12_022582B8

	thumb_func_start ov12_02258348
ov12_02258348: ; 0x02258348
	push {r4, lr}
	add r3, r0, #0
	add r3, #0x88
	str r1, [r3]
	add r3, r0, #0
	ldr r1, _022583AC ; =0x007FFFFF
	add r4, r2, #0
	and r4, r1
	add r3, #0x8c
	str r4, [r3]
	lsl r1, r1, #0x17
	add r3, r2, #0
	and r3, r1
	add r1, r0, #0
	add r1, #0x90
	str r3, [r1]
	mov r3, #1
	lsl r3, r3, #0x1e
	add r1, r2, #0
	tst r1, r3
	beq _0225837A
	ldr r1, [r0, #0x64]
	add r0, #0x94
	str r1, [r0]
	b _0225839A
_0225837A:
	lsl r1, r3, #1
	tst r1, r2
	beq _02258388
	ldr r1, [r0, #0x6c]
	add r0, #0x94
	str r1, [r0]
	b _0225839A
_02258388:
	lsr r1, r3, #1
	tst r1, r2
	bne _02258394
	lsr r1, r3, #2
	tst r1, r2
	beq _0225839A
_02258394:
	mov r1, #0
	add r0, #0x94
	str r1, [r0]
_0225839A:
	cmp r4, #0x91
	blo _022583A2
	bl GF_AssertFail
_022583A2:
	ldr r0, _022583B0 ; =ov12_0226CDCC
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	nop
_022583AC: .word 0x007FFFFF
_022583B0: .word ov12_0226CDCC
	thumb_func_end ov12_02258348

	thumb_func_start ov12_022583B4
ov12_022583B4: ; 0x022583B4
	push {r3, r4, r5, lr}
	ldr r1, _0225843C ; =0x0000213C
	add r5, r2, #0
	ldr r2, [r0, r1]
	mov r0, #2
	lsl r0, r0, #0xa
	add r1, r2, #0
	ldr r4, [sp, #0x14]
	tst r1, r0
	bne _022583DE
	lsl r0, r0, #4
	tst r0, r2
	bne _022583DE
	cmp r3, #0
	beq _022583DE
	add r0, r3, #0
	mul r0, r5
	mov r1, #0xa
	bl DamageDivide
	add r3, r0, #0
_022583DE:
	cmp r5, #0
	beq _022583EC
	cmp r5, #5
	beq _022583FE
	cmp r5, #0x14
	beq _0225841C
	b _02258438
_022583EC:
	ldr r1, [r4]
	mov r0, #8
	orr r1, r0
	mov r0, #4
	bic r1, r0
	mov r0, #2
	bic r1, r0
	str r1, [r4]
	b _02258438
_022583FE:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02258438
	ldr r1, [r4]
	mov r0, #2
	tst r0, r1
	beq _02258414
	mov r0, #2
	bic r1, r0
	str r1, [r4]
	b _02258438
_02258414:
	mov r0, #4
	orr r0, r1
	str r0, [r4]
	b _02258438
_0225841C:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02258438
	ldr r1, [r4]
	mov r0, #4
	tst r0, r1
	beq _02258432
	mov r0, #4
	bic r1, r0
	str r1, [r4]
	b _02258438
_02258432:
	mov r0, #2
	orr r0, r1
	str r0, [r4]
_02258438:
	add r0, r3, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225843C: .word 0x0000213C
	thumb_func_end ov12_022583B4

	thumb_func_start ov12_02258440
ov12_02258440: ; 0x02258440
	lsl r1, r1, #4
	add r2, r0, r1
	ldr r1, _022584A4 ; =0x000003DE
	ldrh r3, [r2, r1]
	cmp r3, #0x9b
	bgt _02258472
	cmp r3, #0x97
	blt _02258458
	beq _02258492
	cmp r3, #0x9b
	beq _02258492
	b _0225849E
_02258458:
	cmp r3, #0x27
	bgt _02258464
	bge _02258492
	cmp r3, #0x1a
	beq _02258492
	b _0225849E
_02258464:
	cmp r3, #0x4b
	bgt _0225846C
	beq _02258492
	b _0225849E
_0225846C:
	cmp r3, #0x91
	beq _02258492
	b _0225849E
_02258472:
	mov r2, #1
	lsl r2, r2, #8
	cmp r3, r2
	bgt _02258482
	bge _02258492
	cmp r3, #0xff
	beq _02258492
	b _0225849E
_02258482:
	add r1, r2, #7
	cmp r3, r1
	bgt _0225848C
	beq _02258492
	b _0225849E
_0225848C:
	add r2, #0x11
	cmp r3, r2
	bne _0225849E
_02258492:
	ldr r1, _022584A8 ; =0x0000213C
	ldr r1, [r0, r1]
	mov r0, #2
	lsl r0, r0, #8
	and r0, r1
	bx lr
_0225849E:
	mov r0, #1
	bx lr
	nop
_022584A4: .word 0x000003DE
_022584A8: .word 0x0000213C
	thumb_func_end ov12_02258440

	thumb_func_start ov12_022584AC
ov12_022584AC: ; 0x022584AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	cmp r2, #0x1b
	bne _022584C2
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	ldr r0, _02258578 ; =0x00002D64
	ldrb r4, [r1, r0]
	b _022584D6
_022584C2:
	cmp r2, #0x1c
	bne _022584D2
	mov r0, #0xc0
	mul r0, r6
	add r1, r5, r0
	ldr r0, _0225857C ; =0x00002D65
	ldrb r4, [r1, r0]
	b _022584D6
_022584D2:
	bl GF_AssertFail
_022584D6:
	mov r0, #0xc0
	mul r0, r6
	mov r2, #0xb5
	add r1, r5, r0
	lsl r2, r2, #6
	ldrh r3, [r1, r2]
	ldr r0, _02258580 ; =0x000001ED
	cmp r3, r0
	bne _02258572
	add r0, r2, #0
	add r0, #0x27
	ldrb r0, [r1, r0]
	cmp r0, #0x79
	bne _02258572
	add r2, #0x78
	ldrh r1, [r1, r2]
	add r0, r5, #0
	mov r2, #1
	bl GetItemVar
	sub r0, #0x7e
	cmp r0, #0xf
	bhi _02258570
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02258510: ; jump table
	.short _02258530 - _02258510 - 2 ; case 0
	.short _02258534 - _02258510 - 2 ; case 1
	.short _02258538 - _02258510 - 2 ; case 2
	.short _0225853C - _02258510 - 2 ; case 3
	.short _02258540 - _02258510 - 2 ; case 4
	.short _02258544 - _02258510 - 2 ; case 5
	.short _02258548 - _02258510 - 2 ; case 6
	.short _0225854C - _02258510 - 2 ; case 7
	.short _02258550 - _02258510 - 2 ; case 8
	.short _02258554 - _02258510 - 2 ; case 9
	.short _02258558 - _02258510 - 2 ; case 10
	.short _0225855C - _02258510 - 2 ; case 11
	.short _02258560 - _02258510 - 2 ; case 12
	.short _02258564 - _02258510 - 2 ; case 13
	.short _02258568 - _02258510 - 2 ; case 14
	.short _0225856C - _02258510 - 2 ; case 15
_02258530:
	mov r4, #0xa
	b _02258572
_02258534:
	mov r4, #0xb
	b _02258572
_02258538:
	mov r4, #0xd
	b _02258572
_0225853C:
	mov r4, #0xc
	b _02258572
_02258540:
	mov r4, #0xf
	b _02258572
_02258544:
	mov r4, #1
	b _02258572
_02258548:
	mov r4, #3
	b _02258572
_0225854C:
	mov r4, #4
	b _02258572
_02258550:
	mov r4, #2
	b _02258572
_02258554:
	mov r4, #0xe
	b _02258572
_02258558:
	mov r4, #6
	b _02258572
_0225855C:
	mov r4, #5
	b _02258572
_02258560:
	mov r4, #7
	b _02258572
_02258564:
	mov r4, #0x10
	b _02258572
_02258568:
	mov r4, #0x11
	b _02258572
_0225856C:
	mov r4, #8
	b _02258572
_02258570:
	mov r4, #0
_02258572:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02258578: .word 0x00002D64
_0225857C: .word 0x00002D65
_02258580: .word 0x000001ED
	thumb_func_end ov12_022584AC

	thumb_func_start ov12_02258584
ov12_02258584: ; 0x02258584
	lsl r1, r1, #3
	add r3, r0, r1
	mov r2, #0
	mov r0, #0x37
	add r1, r2, #0
	lsl r0, r0, #4
_02258590:
	add r2, r2, #1
	strh r1, [r3, r0]
	add r3, r3, #2
	cmp r2, #4
	blt _02258590
	bx lr
	thumb_func_end ov12_02258584

	thumb_func_start ov12_0225859C
ov12_0225859C: ; 0x0225859C
	add r1, r0, r1
	mov r0, #0x39
	mov r2, #0
	lsl r0, r0, #4
	strb r2, [r1, r0]
	bx lr
	thumb_func_end ov12_0225859C

	thumb_func_start ov12_022585A8
ov12_022585A8: ; 0x022585A8
	lsl r1, r1, #1
	add r1, r0, r1
	mov r0, #0xe5
	mov r2, #0
	lsl r0, r0, #2
	strh r2, [r1, r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov12_022585A8

	thumb_func_start ov12_022585B8
ov12_022585B8: ; 0x022585B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	mov r2, #0xff
	mov ip, r2
	mov r2, #0xc0
	add r7, r5, #0
	mul r7, r2
	ldr r2, _02258654 ; =0x00002D67
	add r6, r1, r7
	add r4, r3, #0
	ldrb r3, [r6, r2]
	cmp r3, #0x3b
	beq _02258614
	cmp r3, #0x24
	beq _02258614
	cmp r3, #0x79
	beq _02258614
	add r2, #0x25
	ldr r2, [r6, r2]
	cmp r2, #0
	beq _02258614
	mov r2, #0xc0
	mul r2, r4
	add r6, r1, r2
	ldr r2, _02258654 ; =0x00002D67
	add r2, #0x25
	ldr r2, [r6, r2]
	cmp r2, #0
	beq _02258614
	ldr r2, _02258654 ; =0x00002D67
	ldrb r2, [r6, r2]
	cmp r2, #0x3b
	beq _02258614
	cmp r2, #0x24
	beq _02258614
	cmp r2, #0x79
	beq _02258614
	bl BattleSystem_Random
	mov r1, #1
	tst r0, r1
	beq _02258610
	mov ip, r4
	b _0225864E
_02258610:
	mov ip, r5
	b _0225864E
_02258614:
	cmp r3, #0x3b
	beq _0225862E
	cmp r3, #0x24
	beq _0225862E
	ldr r0, _02258658 ; =0x00002D8C
	add r2, r1, r7
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225862E
	cmp r3, #0x79
	beq _0225862E
	mov ip, r5
	b _0225864E
_0225862E:
	mov r0, #0xc0
	mul r0, r4
	add r2, r1, r0
	ldr r0, _02258654 ; =0x00002D67
	ldrb r1, [r2, r0]
	cmp r1, #0x3b
	beq _0225864E
	cmp r1, #0x24
	beq _0225864E
	add r0, #0x25
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225864E
	cmp r1, #0x79
	beq _0225864E
	mov ip, r4
_0225864E:
	mov r0, ip
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02258654: .word 0x00002D67
_02258658: .word 0x00002D8C
	thumb_func_end ov12_022585B8

	thumb_func_start ov12_0225865C
ov12_0225865C: ; 0x0225865C
	lsl r1, r1, #4
	add r1, r0, r1
	ldr r0, _02258680 ; =0x000003DE
	ldr r3, _02258684 ; =ov12_0226CB64
	ldrh r1, [r1, r0]
	mov r2, #0
_02258668:
	ldrh r0, [r3]
	cmp r0, r1
	bne _02258672
	mov r0, #1
	bx lr
_02258672:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #6
	blo _02258668
	mov r0, #0
	bx lr
	nop
_02258680: .word 0x000003DE
_02258684: .word ov12_0226CB64
	thumb_func_end ov12_0225865C

	thumb_func_start BattleSystem_GetMoveType
BattleSystem_GetMoveType: ; 0x02258688
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	ldr r2, _022587F4 ; =0x00000137
	add r7, r0, #0
	add r4, r1, #0
	cmp r3, r2
	bgt _022586A0
	blt _0225869A
	b _0225879C
_0225869A:
	cmp r3, #0xed
	beq _02258742
	b _022587EE
_022586A0:
	add r0, r2, #0
	add r0, #0x34
	cmp r3, r0
	bgt _022586B0
	add r2, #0x34
	cmp r3, r2
	beq _022586B8
	b _022587EE
_022586B0:
	add r2, #0x8a
	cmp r3, r2
	beq _022586C4
	b _022587EE
_022586B8:
	add r0, r4, #0
	add r1, r6, #0
	bl GetNaturalGiftType
	add r5, r0, #0
	b _022587F0
_022586C4:
	add r0, r4, #0
	add r1, r6, #0
	bl GetBattlerHeldItemEffect
	sub r0, #0x7e
	cmp r0, #0xf
	bhi _0225873E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022586DE: ; jump table
	.short _0225871E - _022586DE - 2 ; case 0
	.short _02258722 - _022586DE - 2 ; case 1
	.short _0225872A - _022586DE - 2 ; case 2
	.short _02258726 - _022586DE - 2 ; case 3
	.short _02258732 - _022586DE - 2 ; case 4
	.short _022586FE - _022586DE - 2 ; case 5
	.short _02258706 - _022586DE - 2 ; case 6
	.short _0225870A - _022586DE - 2 ; case 7
	.short _02258702 - _022586DE - 2 ; case 8
	.short _0225872E - _022586DE - 2 ; case 9
	.short _02258712 - _022586DE - 2 ; case 10
	.short _0225870E - _022586DE - 2 ; case 11
	.short _02258716 - _022586DE - 2 ; case 12
	.short _02258736 - _022586DE - 2 ; case 13
	.short _0225873A - _022586DE - 2 ; case 14
	.short _0225871A - _022586DE - 2 ; case 15
_022586FE:
	mov r5, #1
	b _022587F0
_02258702:
	mov r5, #2
	b _022587F0
_02258706:
	mov r5, #3
	b _022587F0
_0225870A:
	mov r5, #4
	b _022587F0
_0225870E:
	mov r5, #5
	b _022587F0
_02258712:
	mov r5, #6
	b _022587F0
_02258716:
	mov r5, #7
	b _022587F0
_0225871A:
	mov r5, #8
	b _022587F0
_0225871E:
	mov r5, #0xa
	b _022587F0
_02258722:
	mov r5, #0xb
	b _022587F0
_02258726:
	mov r5, #0xc
	b _022587F0
_0225872A:
	mov r5, #0xd
	b _022587F0
_0225872E:
	mov r5, #0xe
	b _022587F0
_02258732:
	mov r5, #0xf
	b _022587F0
_02258736:
	mov r5, #0x10
	b _022587F0
_0225873A:
	mov r5, #0x11
	b _022587F0
_0225873E:
	mov r5, #0
	b _022587F0
_02258742:
	ldr r0, _022587F8 ; =0x00002D54
	add r1, r4, r0
	mov r0, #0xc0
	mul r0, r6
	ldr r4, [r1, r0]
	lsl r0, r4, #2
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r5, r0, #0x1a
	lsl r0, r4, #7
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r3, r0, #0x1b
	lsl r0, r4, #0xc
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r2, r0, #0x1c
	lsl r0, r4, #0x11
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1d
	lsl r0, r4, #0x1b
	lsl r4, r4, #0x16
	lsr r4, r4, #0x1b
	lsr r6, r0, #0x1b
	mov r0, #1
	lsl r4, r4, #0x1f
	and r0, r6
	lsr r4, r4, #0x1e
	orr r0, r4
	orr r0, r1
	orr r0, r2
	orr r0, r3
	add r1, r5, #0
	orr r1, r0
	mov r0, #0xf
	mul r0, r1
	mov r1, #0x3f
	bl _s32_div_f
	add r5, r0, #1
	cmp r5, #9
	blt _022587F0
	add r5, r5, #1
	b _022587F0
_0225879C:
	mov r2, #0xd
	str r2, [sp]
	mov r2, #8
	mov r3, #0
	bl CheckAbilityActive
	cmp r0, #0
	bne _022587F0
	mov r0, #0x4c
	str r0, [sp]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #8
	mov r3, #0
	bl CheckAbilityActive
	cmp r0, #0
	bne _022587F0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	ldr r1, _022587FC ; =0x000080FF
	tst r1, r0
	beq _022587F0
	mov r1, #3
	tst r1, r0
	beq _022587D4
	mov r5, #0xb
_022587D4:
	mov r1, #0xc
	tst r1, r0
	beq _022587DC
	mov r5, #5
_022587DC:
	mov r1, #0x30
	tst r1, r0
	beq _022587E4
	mov r5, #0xa
_022587E4:
	mov r1, #0xc0
	tst r0, r1
	beq _022587F0
	mov r5, #0xf
	b _022587F0
_022587EE:
	mov r5, #0
_022587F0:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022587F4: .word 0x00000137
_022587F8: .word 0x00002D54
_022587FC: .word 0x000080FF
	thumb_func_end BattleSystem_GetMoveType

    .rodata

.public sCritChance
sCritChance: ; 0x0226CB48
	.byte 0x10, 0x08, 0x04, 0x03, 0x02, 0x00, 0x00, 0x00

.public sSpeedHalvingItemEffects
sSpeedHalvingItemEffects: ; 0x0226CB50
	.byte HOLD_EFFECT_EXP_UP_SPEED_DOWN, HOLD_EFFECT_SPEED_DOWN_GROUNDED, HOLD_EFFECT_LVLUP_HP_EV_UP, HOLD_EFFECT_LVLUP_ATK_EV_UP, HOLD_EFFECT_LVLUP_DEF_EV_UP, HOLD_EFFECT_LVLUP_SPEED_EV_UP, HOLD_EFFECT_LVLUP_SPATK_EV_UP, HOLD_EFFECT_LVLUP_SPDEF_EV_UP

.public sEncoreFailMoves
sEncoreFailMoves: ; 0x0226CB58
	.short MOVE_TRANSFORM, MOVE_MIMIC, MOVE_SKETCH, MOVE_MIRROR_MOVE
	.short MOVE_ENCORE, MOVE_STRUGGLE

ov12_0226CB64: ; 0x0226CB64
	.byte 0x29, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x90, 0x00, 0xE3, 0x00

.public sMeFirstUnuseableMoves
sMeFirstUnuseableMoves: ; 0x0226CB70
	.short MOVE_COUNTER, MOVE_MIRROR_COAT, MOVE_THIEF, MOVE_COVET, MOVE_FOCUS_PUNCH, MOVE_CHATTER

.public sGravityUnusableMoves
sGravityUnusableMoves: ; 0x0226CB7C
	.short MOVE_FLY, MOVE_BOUNCE
	.short MOVE_JUMP_KICK, MOVE_HIGH_JUMP_KICK, MOVE_SPLASH, MOVE_MAGNET_RISE

.public sStatChangeTable
sStatChangeTable: ; 0x0226CB88
	.byte 0x0A

ov12_0226CB89: ; 0x0226CB89
	.byte 0x28, 0x0A, 0x23, 0x0A, 0x1E, 0x0A, 0x19
	.byte 0x0A, 0x14, 0x0A, 0x0F, 0x0A, 0x0A, 0x0F, 0x0A, 0x14, 0x0A, 0x19, 0x0A, 0x1E, 0x0A, 0x23, 0x0A
	.byte 0x28, 0x0A

.public sHealBlockUnusableMoves
sHealBlockUnusableMoves: ; 0x0226CBA2
	.short MOVE_RECOVER, MOVE_SOFT_BOILED, MOVE_REST, MOVE_MILK_DRINK, MOVE_MORNING_SUN, MOVE_SYNTHESIS, MOVE_MOONLIGHT
	.short MOVE_SWALLOW, MOVE_HEAL_ORDER, MOVE_SLACK_OFF, MOVE_ROOST, MOVE_LUNAR_DANCE, MOVE_HEALING_WISH, MOVE_WISH

.public sPunchingMoves
sPunchingMoves: ; 0x0226CBBE
	.short MOVE_ICE_PUNCH
	.short MOVE_FIRE_PUNCH, MOVE_THUNDER_PUNCH, MOVE_MACH_PUNCH, MOVE_FOCUS_PUNCH, MOVE_DIZZY_PUNCH, MOVE_DYNAMIC_PUNCH, MOVE_HAMMER_ARM, MOVE_MEGA_PUNCH
	.short MOVE_COMET_PUNCH, MOVE_METEOR_MASH, MOVE_SHADOW_PUNCH, MOVE_DRAIN_PUNCH, MOVE_BULLET_PUNCH, MOVE_SKY_UPPERCUT

.public ov12_0226CBDC
ov12_0226CBDC: ; 0x0226CBDC
	.byte 0x0F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00

.public sMetronomeUnuseableMoves
sMetronomeUnuseableMoves: ; 0x0226CC04
	.short MOVE_METRONOME, MOVE_STRUGGLE, MOVE_SKETCH, MOVE_MIMIC, MOVE_CHATTER, 0xFFFE
	.short MOVE_SLEEP_TALK, MOVE_ASSIST, MOVE_MIRROR_MOVE, MOVE_COUNTER, MOVE_MIRROR_COAT, MOVE_PROTECT, MOVE_DETECT, MOVE_ENDURE
	.short MOVE_DESTINY_BOND, MOVE_THIEF, MOVE_FOLLOW_ME, MOVE_SNATCH, MOVE_HELPING_HAND, MOVE_COVET, MOVE_TRICK, MOVE_FOCUS_PUNCH
	.short MOVE_FEINT, MOVE_COPYCAT, MOVE_ME_FIRST, MOVE_SWITCHEROO, 0xFFFF

.public sTypeEnhancingItems
sTypeEnhancingItems: ; 0x0226CC3A
	.byte HOLD_EFFECT_STRENGTHEN_BUG, TYPE_BUG
    .byte HOLD_EFFECT_STRENGTHEN_STEEL, TYPE_STEEL
    .byte HOLD_EFFECT_STRENGTHEN_GROUND, TYPE_GROUND
	.byte HOLD_EFFECT_STRENGTHEN_ROCK, TYPE_ROCK
    .byte HOLD_EFFECT_STRENGTHEN_GRASS, TYPE_GRASS
    .byte HOLD_EFFECT_STRENGTHEN_DARK, TYPE_DARK
    .byte HOLD_EFFECT_STRENGTHEN_FIGHT, TYPE_FIGHTING
    .byte HOLD_EFFECT_STRENGTHEN_ELECTRIC, TYPE_ELECTRIC
    .byte HOLD_EFFECT_STRENGTHEN_WATER, TYPE_WATER
    .byte HOLD_EFFECT_STRENGTHEN_FLYING, TYPE_FLYING
    .byte HOLD_EFFECT_STRENGTHEN_POISON, TYPE_POISON
	.byte HOLD_EFFECT_STRENGTHEN_ICE, TYPE_ICE
    .byte HOLD_EFFECT_STRENGTHEN_GHOST, TYPE_GHOST
    .byte HOLD_EFFECT_STRENGTHEN_PSYCHIC, TYPE_PSYCHIC
    .byte HOLD_EFFECT_STRENGTHEN_FIRE, TYPE_FIRE
    .byte HOLD_EFFECT_STRENGTHEN_DRAGON, TYPE_DRAGON
    .byte HOLD_EFFECT_STRENGTHEN_NORMAL, TYPE_NORMAL
    .byte HOLD_EFFECT_ARCEUS_FIRE, TYPE_FIRE
    .byte HOLD_EFFECT_ARCEUS_WATER, TYPE_WATER
	.byte HOLD_EFFECT_ARCEUS_ELECTRIC, TYPE_ELECTRIC
    .byte HOLD_EFFECT_ARCEUS_GRASS, TYPE_GRASS
    .byte HOLD_EFFECT_ARCEUS_ICE, TYPE_ICE
    .byte HOLD_EFFECT_ARCEUS_FIGHT, TYPE_FIGHTING
    .byte HOLD_EFFECT_ARCEUS_POISON, TYPE_POISON
    .byte HOLD_EFFECT_ARCEUS_GROUND, TYPE_GROUND
    .byte HOLD_EFFECT_ARCEUS_FLYING, TYPE_FLYING
    .byte HOLD_EFFECT_ARCEUS_PSYCHIC, TYPE_PSYCHIC
	.byte HOLD_EFFECT_ARCEUS_BUG, TYPE_BUG
    .byte HOLD_EFFECT_ARCEUS_ROCK, TYPE_ROCK
    .byte HOLD_EFFECT_ARCEUS_GHOST, TYPE_GHOST
    .byte HOLD_EFFECT_ARCEUS_DRAGON, TYPE_DRAGON
    .byte HOLD_EFFECT_ARCEUS_DARK, TYPE_DARK
    .byte HOLD_EFFECT_ARCEUS_STEEL, TYPE_STEEL

; format: attacking type, defending type, damage multiplier
sTypeEffectiveness: ; 0x0226CC7C
	.byte TYPE_NORMAL, TYPE_ROCK, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_NORMAL, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIRE, TYPE_FIRE, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIRE, TYPE_WATER, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIRE, TYPE_GRASS, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FIRE, TYPE_ICE, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FIRE, TYPE_BUG, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FIRE, TYPE_ROCK, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIRE, TYPE_DRAGON, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIRE, TYPE_STEEL, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_WATER, TYPE_FIRE, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_WATER, TYPE_WATER, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_WATER, TYPE_GRASS, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_WATER, TYPE_GROUND, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_WATER, TYPE_ROCK, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_WATER, TYPE_DRAGON, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ELECTRIC, TYPE_WATER, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ELECTRIC, TYPE_ELECTRIC, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ELECTRIC, TYPE_GRASS, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ELECTRIC, TYPE_GROUND, TYPE_MUL_NO_EFFECT
	.byte TYPE_ELECTRIC, TYPE_FLYING, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ELECTRIC, TYPE_DRAGON, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GRASS, TYPE_FIRE, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GRASS, TYPE_WATER, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_GRASS, TYPE_GRASS, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GRASS, TYPE_POISON, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GRASS, TYPE_GROUND, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_GRASS, TYPE_FLYING, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GRASS, TYPE_BUG, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GRASS, TYPE_ROCK, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_GRASS, TYPE_DRAGON, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GRASS, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ICE, TYPE_WATER, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ICE, TYPE_GRASS, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ICE, TYPE_ICE, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ICE, TYPE_GROUND, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ICE, TYPE_FLYING, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ICE, TYPE_DRAGON, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ICE, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ICE, TYPE_FIRE, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_NORMAL, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_ICE, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_POISON, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_FLYING, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_PSYCHIC, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_BUG, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_ROCK, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_DARK, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FIGHTING, TYPE_STEEL, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_POISON, TYPE_GRASS, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_POISON, TYPE_POISON, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_POISON, TYPE_GROUND, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_POISON, TYPE_ROCK, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_POISON, TYPE_GHOST, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_POISON, TYPE_STEEL, TYPE_MUL_NO_EFFECT
	.byte TYPE_GROUND, TYPE_FIRE, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_GROUND, TYPE_ELECTRIC, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_GROUND, TYPE_GRASS, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GROUND, TYPE_POISON, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_GROUND, TYPE_FLYING, TYPE_MUL_NO_EFFECT
	.byte TYPE_GROUND, TYPE_BUG, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GROUND, TYPE_ROCK, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_GROUND, TYPE_STEEL, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FLYING, TYPE_ELECTRIC, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FLYING, TYPE_GRASS, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FLYING, TYPE_FIGHTING, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FLYING, TYPE_BUG, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_FLYING, TYPE_ROCK, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FLYING, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_PSYCHIC, TYPE_FIGHTING, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_PSYCHIC, TYPE_POISON, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_PSYCHIC, TYPE_PSYCHIC, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_PSYCHIC, TYPE_DARK, TYPE_MUL_NO_EFFECT
	.byte TYPE_PSYCHIC, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_BUG, TYPE_FIRE, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_BUG, TYPE_GRASS, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_BUG, TYPE_FIGHTING, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_BUG, TYPE_POISON, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_BUG, TYPE_FLYING, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_BUG, TYPE_PSYCHIC, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_BUG, TYPE_GHOST, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_BUG, TYPE_DARK, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_BUG, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ROCK, TYPE_FIRE, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ROCK, TYPE_ICE, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ROCK, TYPE_FIGHTING, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ROCK, TYPE_GROUND, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_ROCK, TYPE_FLYING, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ROCK, TYPE_BUG, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_ROCK, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GHOST, TYPE_NORMAL, TYPE_MUL_NO_EFFECT
	.byte TYPE_GHOST, TYPE_PSYCHIC, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_GHOST, TYPE_DARK, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GHOST, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_GHOST, TYPE_GHOST, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_DRAGON, TYPE_DRAGON, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_DRAGON, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_DARK, TYPE_FIGHTING, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_DARK, TYPE_PSYCHIC, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_DARK, TYPE_GHOST, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_DARK, TYPE_DARK, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_DARK, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_STEEL, TYPE_FIRE, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_STEEL, TYPE_WATER, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_STEEL, TYPE_ELECTRIC, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_STEEL, TYPE_ICE, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_STEEL, TYPE_ROCK, TYPE_MUL_SUPER_EFFECTIVE
	.byte TYPE_STEEL, TYPE_STEEL, TYPE_MUL_NOT_EFFECTIVE
	.byte TYPE_FORESIGHT, TYPE_FORESIGHT, TYPE_MUL_NO_EFFECT
	.byte TYPE_NORMAL, TYPE_GHOST, TYPE_MUL_NO_EFFECT
	.byte TYPE_FIGHTING, TYPE_GHOST, TYPE_MUL_NO_EFFECT
	.byte TYPE_ENDTABLE, TYPE_ENDTABLE, TYPE_MUL_NO_EFFECT

ov12_0226CDCC: ; 0x0226CDCC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x3A, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00
	.byte 0x8A, 0x00, 0x00, 0x00, 0x93, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x00, 0x00, 0x95, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00
	.byte 0x94, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
	.byte 0x36, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00
	.byte 0x54, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
	.byte 0x5B, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x61, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00
	.byte 0x67, 0x00, 0x00, 0x00, 0x69, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x00, 0x00, 0x71, 0x00, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x7A, 0x00, 0x00, 0x00, 0x7B, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00
	.byte 0x7F, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00
	.byte 0x84, 0x00, 0x00, 0x00, 0x86, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00
	.byte 0x8D, 0x00, 0x00, 0x00, 0x8F, 0x00, 0x00, 0x00, 0x91, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00
	.byte 0x9B, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00, 0xA1, 0x00, 0x00, 0x00, 0xA2, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00
	.byte 0xA4, 0x00, 0x00, 0x00, 0xA5, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00
	.byte 0xA8, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x00, 0xAB, 0x00, 0x00, 0x00, 0xAD, 0x00, 0x00, 0x00
	.byte 0xAF, 0x00, 0x00, 0x00, 0xDA, 0x00, 0x00, 0x00, 0xDB, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x00, 0x00
	.byte 0xE2, 0x00, 0x00, 0x00, 0xF6, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x00, 0xF8, 0x00, 0x00, 0x00
	.byte 0xF9, 0x00, 0x00, 0x00, 0x04, 0x01, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00

	.data

.public sSoundMoves
sSoundMoves: ; 0x0226EC20
	.short MOVE_GROWL, MOVE_ROAR, MOVE_SING, MOVE_SUPERSONIC, MOVE_SCREECH, MOVE_SNORE, MOVE_UPROAR, MOVE_METAL_SOUND
	.short MOVE_GRASS_WHISTLE, MOVE_HYPER_VOICE, MOVE_BUG_BUZZ, MOVE_CHATTER
	; 0x0226EC40
    