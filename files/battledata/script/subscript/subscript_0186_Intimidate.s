    .include "macros/btlcmd.inc"

    .data

_000:
    WaitButtonABTime 15
    UpdateVar OPCODE_SET, BSCRIPT_VAR_BATTLER_SPEED_TEMP, 0
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_LAST_BATTLER_ID, BSCRIPT_VAR_BATTLER_ATTACKER
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_BATTLER_ATTACKER, BSCRIPT_VAR_MSG_BATTLER_TEMP

_013:
    GetMonBySpeedOrder BSCRIPT_VAR_BATTLER_STAT_CHANGE
    IfSameSide BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_SIDE_EFFECT_MON, _038
    CheckSubstitute BATTLER_CATEGORY_SIDE_EFFECT_MON, _038
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_SIDE_EFFECT_MON, BMON_DATA_HP, 0, _038
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_PARAM, MOVE_SUBSCRIPT_PTR_ATTACK_DOWN_1_STAGE
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_TYPE, SIDE_EFFECT_TYPE_ABILITY
    Call BATTLE_SUBSCRIPT_UPDATE_STAT_STAGE

_038:
    UpdateVar OPCODE_ADD, BSCRIPT_VAR_BATTLER_SPEED_TEMP, 1
    GoToIfValidMon BSCRIPT_VAR_BATTLER_SPEED_TEMP, _013
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_BATTLER_ATTACKER, BSCRIPT_VAR_LAST_BATTLER_ID
    End 