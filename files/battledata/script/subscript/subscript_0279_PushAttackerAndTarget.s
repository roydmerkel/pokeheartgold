    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVarFromVar OPCODE_GET, BSCRIPT_VAR_BATTLER_ATTACKER, BSCRIPT_VAR_BATTLER_ATTACKER_TEMP
    UpdateVarFromVar OPCODE_GET, BSCRIPT_VAR_BATTLER_TARGET, BSCRIPT_VAR_BATTLER_TARGET_TEMP
    End 
