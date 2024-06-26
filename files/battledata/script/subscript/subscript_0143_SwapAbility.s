    .include "macros/btlcmd.inc"

    .data

_000:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_MISSED|MOVE_STATUS_SEMI_INVULNERABLE, _SWAP_ABILITY_FAILED
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_ATTACKER, BMON_DATA_ABILITY, ABILITY_WONDER_GUARD, _SWAP_ABILITY_FAILED
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_DEFENDER, BMON_DATA_ABILITY, ABILITY_WONDER_GUARD, _SWAP_ABILITY_FAILED
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_ATTACKER, BMON_DATA_ABILITY, ABILITY_MULTITYPE, _SWAP_ABILITY_FAILED
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_DEFENDER, BMON_DATA_ABILITY, ABILITY_MULTITYPE, _SWAP_ABILITY_FAILED
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_ATTACKER, BMON_DATA_HELD_ITEM, ITEM_GRISEOUS_ORB, _SWAP_ABILITY_FAILED
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_DEFENDER, BMON_DATA_HELD_ITEM, ITEM_GRISEOUS_ORB, _SWAP_ABILITY_FAILED
    CompareMonDataToValue OPCODE_NEQ, BATTLER_CATEGORY_ATTACKER, BMON_DATA_ABILITY, ABILITY_NONE, _052
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_DEFENDER, BMON_DATA_ABILITY, ABILITY_NONE, _SWAP_ABILITY_FAILED

_052:
    Call BATTLE_SUBSCRIPT_ATTACK_MESSAGE_AND_ANIMATION
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_TEMP_DATA, BSCRIPT_VAR_TOTAL_TURNS
    UpdateVar OPCODE_BITWISE_AND, BSCRIPT_VAR_TEMP_DATA, 1
    UpdateMonDataFromVar OPCODE_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_TRUANT, BSCRIPT_VAR_TEMP_DATA
    UpdateMonDataFromVar OPCODE_SET, BATTLER_CATEGORY_DEFENDER, BMON_DATA_TRUANT, BSCRIPT_VAR_TEMP_DATA
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_ABILITY, BSCRIPT_VAR_CALC_TEMP
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_DEFENDER, BMON_DATA_ABILITY, BSCRIPT_VAR_TEMP_DATA
    UpdateMonDataFromVar OPCODE_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_ABILITY, BSCRIPT_VAR_TEMP_DATA
    UpdateMonDataFromVar OPCODE_SET, BATTLER_CATEGORY_DEFENDER, BMON_DATA_ABILITY, BSCRIPT_VAR_CALC_TEMP
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_TEMP_DATA, ABILITY_SLOW_START, _120
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_TEMP_DATA, BSCRIPT_VAR_TOTAL_TURNS
    UpdateVar OPCODE_ADD, BSCRIPT_VAR_TEMP_DATA, 1
    UpdateMonDataFromVar OPCODE_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_SLOW_START_TURN_NUMBER, BSCRIPT_VAR_TEMP_DATA
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_SLOW_START_FLAG, 0
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_SLOW_START_END, 0

_120:
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_CALC_TEMP, 0x00000070, _SWAP_ABILITY_SUCCESS
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_TEMP_DATA, BSCRIPT_VAR_TOTAL_TURNS
    UpdateVar OPCODE_ADD, BSCRIPT_VAR_TEMP_DATA, 1
    UpdateMonDataFromVar OPCODE_SET, BATTLER_CATEGORY_DEFENDER, BMON_DATA_SLOW_START_TURN_NUMBER, BSCRIPT_VAR_TEMP_DATA
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_DEFENDER, BMON_DATA_SLOW_START_FLAG, 0
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_DEFENDER, BMON_DATA_SLOW_START_END, 0

_SWAP_ABILITY_SUCCESS:
    // {0} swapped abilities with its target!
    PrintMessage msg_0197_00559, TAG_NICKNAME, BATTLER_CATEGORY_ATTACKER
    Wait 
    WaitButtonABTime 30
    End 

_SWAP_ABILITY_FAILED:
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
