    .include "macros/btlcmd.inc"

    .data

_000:
    TryReplaceFaintedMon BATTLER_CATEGORY_ATTACKER, TRUE, _008
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_FLAGS_DIRECT, MOVE_SIDE_EFFECT_ON_HIT|MOVE_SUBSCRIPT_PTR_HEALING_WISH
    End 

_008:
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_FAILED
    End 
