    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_IGNORE_TYPE_EFFECTIVENESS|BATTLE_STATUS_IGNORE_TYPE_IMMUNITY, _262
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_ONE_HIT_KO, _262
    CheckAbility CHECK_OPCODE_NOT_HAVE, BATTLER_CATEGORY_ATTACKER, ABILITY_NORMALIZE, _020
    UpdateVar OPCODE_SET, BSCRIPT_VAR_CALC_TEMP, 0x00000000
    GoTo _033

_020:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_TYPE, TYPE_NORMAL, _031
    UpdateVarFromVar OPCODE_GET, BSCRIPT_VAR_MOVE_TYPE, BSCRIPT_VAR_CALC_TEMP
    GoTo _033

_031:
    GetCurrentMoveData MOVEATTRIBUTE_TYPE

_033:
    GetItemHoldEffect BATTLER_CATEGORY_MSG_TEMP, BSCRIPT_VAR_TEMP_DATA
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_NORMAL, _128
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_SUPER_EFFECTIVE, _262
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_FIRE, _135
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_WATER, _142
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_ELECTRIC, _149
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_GRASS, _156
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_ICE, _163
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_FIGHT, _170
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_POISON, _177
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_GROUND, _184
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_FLYING, _191
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_PSYCHIC, _198
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_BUG, _205
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_ROCK, _212
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_GHOST, _219
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_DRAGON, _226
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_DARK, _233
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_TEMP_DATA, HOLD_EFFECT_WEAKEN_SE_STEEL, _240
    GoTo _262

_128:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000000, _245
    GoTo _262

_135:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x0000000A, _245
    GoTo _262

_142:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x0000000B, _245
    GoTo _262

_149:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x0000000D, _245
    GoTo _262

_156:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x0000000C, _245
    GoTo _262

_163:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x0000000F, _245
    GoTo _262

_170:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000001, _245
    GoTo _262

_177:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000003, _245
    GoTo _262

_184:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000004, _245
    GoTo _262

_191:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000002, _245
    GoTo _262

_198:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x0000000E, _245
    GoTo _262

_205:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000006, _245
    GoTo _262

_212:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000005, _245
    GoTo _262

_219:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000007, _245
    GoTo _262

_226:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000010, _245
    GoTo _262

_233:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_CALC_TEMP, 0x00000011, _245
    GoTo _262

_240:
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_CALC_TEMP, 0x00000008, _262

_245:
    PlayBattleAnimation BATTLER_CATEGORY_MSG_TEMP, BATTLE_ANIMATION_HELD_ITEM
    Wait 
    DivideVarByValue BSCRIPT_VAR_HP_CALC, 2
    // The {0} weakened {1}’s power!
    PrintMessage msg_0197_01131, TAG_ITEM_MOVE, BATTLER_CATEGORY_MSG_BATTLER_TEMP, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    RemoveItem BATTLER_CATEGORY_MSG_TEMP

_262:
    End 