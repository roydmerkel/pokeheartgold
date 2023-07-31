#include "global.h"
#include "battle_controller_opponent.h"
#include "battle_system.h"
#include "party.h"
#include "pokemon_mood.h"
#include "overlay_12_0224E4FC.h"

BgConfig *BattleSystem_GetBgConfig(BattleSystem *bsys) {
    return bsys->bgConfig;
}

Window *BattleSystem_GetWindow(BattleSystem *bsys, int index) {
    return &bsys->window[index];
}

u32 BattleSystem_GetBattleType(BattleSystem *bsys) {
    return bsys->battleType;
}

BATTLECONTEXT *BattleSystem_GetBattleContext(BattleSystem *bsys) {
    return bsys->ctx;
}

OpponentData *BattleSystem_GetOpponentData(BattleSystem *bsys, int battlerId) {
    return bsys->opponentData[battlerId];
}

int BattleSystem_GetMaxBattlers(BattleSystem *bsys) {
    return bsys->maxBattlers;
}

PARTY *BattleSystem_GetParty(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->trainerParty[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->trainerParty[battlerId & 1];
    } else {
        return bsys->trainerParty[battlerId];
    }
}

int BattleSystem_GetPartySize(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return GetPartyCount(bsys->trainerParty[battlerId]);
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return GetPartyCount(bsys->trainerParty[battlerId & 1]);
    } else {
        return GetPartyCount(bsys->trainerParty[battlerId]);
    }
}

Pokemon *BattleSystem_GetPartyMon(BattleSystem *bsys, int battlerId, int index) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return GetPartyMonByIndex(bsys->trainerParty[battlerId], index);
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return GetPartyMonByIndex(bsys->trainerParty[battlerId & 1], index);
    } else {
        return GetPartyMonByIndex(bsys->trainerParty[battlerId], index);
    }
}

u32 *ov12_0223A8D4(BattleSystem *bsys) {
    return bsys->unk88;
}

u32 *ov12_0223A8DC(BattleSystem *bsys) {
    return bsys->unk8C;
}

u32 *ov12_0223A8E4(BattleSystem *bsys) {
    return bsys->unk90;
}

u32 *ov12_0223A8EC(BattleSystem *bsys) {
    return bsys->unk94;
}

UnkBattleSystemSub17C *ov12_0223A8F4(BattleSystem *bsys, int index) {
    return &bsys->unk17C[index];
}

u32 *ov12_0223A900(BattleSystem *bsys) {
    return bsys->unk19C;
}

u32 *ov12_0223A908(BattleSystem *bsys, int index) {
    return bsys->unk1A0[index];
}

void ov12_0223A914(BattleSystem *bsys, int index, u32 *a2) {
    bsys->unk1A0[index] = a2;
}

FontID *BattleSystem_GetHpFont(BattleSystem *bsys) {
    return bsys->hpFont;
}

FontID *BattleSystem_GetLevelFont(BattleSystem *bsys) {
    return bsys->levelFont;
}

u32 *ov12_0223A930(BattleSystem *bsys) {
    return bsys->unkC;
}

u32 *ov12_0223A934(BattleSystem *bsys) {
    return bsys->unk10;
}

void *ov12_0223A938(BattleSystem *bsys) {
    return bsys->unk28;
}

Pokedex *BattleSystem_GetPokedex(BattleSystem *bsys) {
    return bsys->pokedex;
}

u8 *BattleSystem_GetSendBufferPtr(BattleSystem *bsys) {
    return &bsys->sendBuffer[0];
}

u8 *BattleSystem_GetRecvBufferPtr(BattleSystem *bsys) {
    return &bsys->recvBuffer[0];
}

u16 *ov12_0223A954(BattleSystem *bsys) {
    return &bsys->unk23E8;
}

u16 *ov12_0223A960(BattleSystem *bsys) {
    return &bsys->unk23EA;
}

u16 *ov12_0223A96C(BattleSystem *bsys) {
    return &bsys->unk23EC;
}

u16 *ov12_0223A978(BattleSystem *bsys) {
    return &bsys->unk23EE;
}

u16 *ov12_0223A984(BattleSystem *bsys) {
    return &bsys->unk23F0;
}

u16 *ov12_0223A990(BattleSystem *bsys) {
    return &bsys->unk23F2;
}

UnkBattleSystemSub1D0 *ov12_0223A99C(BattleSystem *bsys) {
    return &bsys->unk1D0[0];
}

u32 *ov12_0223A9A4(BattleSystem *bsys) {
    return bsys->unk14;
}

String *BattleSystem_GetMessageBuffer(BattleSystem *bsys) {
    return bsys->msgBuffer;
}

u16 BattleSystem_GetTrainerIndex(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->trainerId[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->trainerId[battlerId & 1];
    } else {
        return bsys->trainerId[battlerId];
    }
}

TRAINER *BattleSystem_GetTrainer(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return &bsys->trainers[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return &bsys->trainers[battlerId & 1];
    } else {
        return &bsys->trainers[battlerId];
    }
}

PlayerProfile *BattleSystem_GetPlayerProfile(BattleSystem *bsys, int battlerId) {
    if ((bsys->battleType & BATTLE_TYPE_MULTI) || ((bsys->battleType & BATTLE_TYPE_INGAME_PARTNER) && (ov12_0223AB0C(bsys, battlerId) & 1))) {
        return bsys->playerProfile[battlerId];
    } else if (bsys->battleType & BATTLE_TYPE_DOUBLES) {
        return bsys->playerProfile[battlerId & 1];
    } else {
        return bsys->playerProfile[battlerId];
    }
}

Bag *BattleSystem_GetBag(BattleSystem *bsys) {
    return bsys->bag;
}

BagCursor *BattleSystem_GetBagCursor(BattleSystem *bsys) {
    return bsys->bagCursor;
}

u16 BattleSystem_GetMonBall(BattleSystem *bsys, Pokemon *mon) {
    if (bsys->unk2474_2) {
        return GetMonData(mon, MON_DATA_DP_POKEBALL, NULL);
    } else {
        return GetMonData(mon, MON_DATA_POKEBALL, NULL);
    }
}

u32 ov12_0223AAB8(BattleSystem *bsys) {
    return bsys->unk2474_3;
}

u32 BattleSystem_GetTrainerGender(BattleSystem *bsys, int battlerId) {
    return PlayerProfile_GetTrainerGender(bsys->playerProfile[battlerId]);
}

int ov12_0223AAD8(BattleSystem *bsys, int a1) {
    int battlerId;
    for (battlerId = 0; battlerId < bsys->maxBattlers; battlerId++) {
        if (ov12_02261258(bsys->opponentData[battlerId]) == a1) {
            break;
        }
    }
    
    GF_ASSERT(battlerId < bsys->maxBattlers);
    
    return battlerId;
}

u8 ov12_0223AB0C(BattleSystem *bsys, int battlerId) {
    return ov12_02261258(bsys->opponentData[battlerId]);
}

u8 BattleSystem_GetFieldSide(BattleSystem *bsys, int battlerId) {
    return ov12_02261258(bsys->opponentData[battlerId]) & 1;
}

void *BattleSystem_GetMessageIcon(BattleSystem *bsys) {
    return bsys->msgIcon;
}

PC_STORAGE *BattleSystem_GetPcStorage(BattleSystem *bsys) {
    return bsys->storage;
}

Terrain BattleSystem_GetTerrainId(BattleSystem *bsys) {
    if (bsys->terrain > TERRAIN_MAX || bsys->terrain < 0) {
        return TERRAIN_MAX;
    }
    return bsys->terrain;
}

int ov12_0223AB54(BattleSystem *bsys) {
    return bsys->unk2404;
}

int BattleSystem_GetLocation(BattleSystem *bsys) {
    return bsys->location;
}

int BattleSystem_GetBattlerIdPartner(BattleSystem *bsys, int battlerId) {
    int battlerIdPartner;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    u32 battleType = BattleSystem_GetBattleType(bsys);
    
    if (!(battleType & BATTLE_TYPE_DOUBLES)) {
        return battlerId;
    }
    
    for (battlerIdPartner = 0; battlerIdPartner < maxBattlers; battlerIdPartner++) {
        if (battlerIdPartner != battlerId && BattleSystem_GetFieldSide(bsys, battlerIdPartner) == BattleSystem_GetFieldSide(bsys, battlerId)) {
            break;
        }
    }
    
    return battlerIdPartner;
}

int ov12_0223ABB8(BattleSystem *bsys, int battlerId, int side) {
    int battlerIdOpponent;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    u32 battleType = BattleSystem_GetBattleType(bsys);
    
    if (!(battleType & BATTLE_TYPE_DOUBLES)) {
        return battlerId ^ 1;
    }
    
    for (battlerIdOpponent = 0; battlerIdOpponent < maxBattlers; battlerIdOpponent++) {
        if (battlerIdOpponent != battlerId && (ov12_0223AB0C(bsys, battlerIdOpponent) & 2) == side && BattleSystem_GetFieldSide(bsys, battlerIdOpponent) != BattleSystem_GetFieldSide(bsys, battlerId)) {
            break;
        }
    }
    
    return battlerIdOpponent;
}

BOOL BattleSystem_RecoverStatus(BattleSystem *bsys, int battlerId, int selectedMonIndex, int movePos, int item) {
    BATTLECONTEXT *ctx = bsys->ctx;
    Pokemon *mon;
    BOOL ret = FALSE;
    int data;
    int index1 = ov12_022581D4(bsys, ctx, 2, battlerId);
    int index2;
    int friendship;
    
    if (BattleSystem_GetBattleType(bsys) == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_TRAINER) || ((BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_INGAME_PARTNER) && !(ov12_0223AB0C(bsys, battlerId) & 1))) {
        index2 = ov12_022581D4(bsys, ctx, 2, BattleSystem_GetBattlerIdPartner(bsys, battlerId));
        if (index2 == selectedMonIndex) {
            battlerId = BattleSystem_GetBattlerIdPartner(bsys, battlerId);
        }
    } else {
        index2 = index1;
    }
    mon = BattleSystem_GetPartyMon(bsys, battlerId, selectedMonIndex);
    friendship = 0;
    
    if (GetItemAttr(item, ITEMATTR_SLP_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_SLEEP) {
            data &= ~STATUS_SLEEP;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_SLEEP;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL);
                data &= ~STATUS2_NIGHTMARE;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_PSN_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_POISON_ALL) {
            data &= ~STATUS_POISON_ALL;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_POISON_ALL;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_BRN_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_BURN) {
            data &= ~STATUS_BURN;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_BURN;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_FRZ_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_FREEZE) {
            data &= ~STATUS_FREEZE;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_FREEZE;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_PRZ_HEAL, HEAP_ID_BATTLE)) {
        data = GetMonData(mon, MON_DATA_STATUS, NULL);
        if (data & STATUS_PARALYSIS) {
            data &= ~STATUS_PARALYSIS;
            SetMonData(mon, MON_DATA_STATUS, &data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, NULL);
                data &= ~STATUS_PARALYSIS;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS, &data);
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_CFS_HEAL, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL);
            if (data & STATUS2_CONFUSION) {
                data &= ~STATUS2_CONFUSION;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, &data);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_INF_HEAL, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL);
            if (data & STATUS2_ATTRACT_ALL) {
                data &= ~STATUS2_ATTRACT_ALL;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, &data);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_GUARD_SPEC, HEAP_ID_BATTLE)) {
        data = ov12_022581D4(bsys, ctx, 1, battlerId);
        if (!data) {
            data = ov12_022581D4(bsys, ctx, 0, battlerId);
            data |= SIDE_CONDITION_MIST;
            ov12_022582B8(bsys, ctx, 0, battlerId, data);
            ov12_022582B8(bsys, ctx, 1, battlerId, 5);
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_ATK_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_ATK, NULL) < 12) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_ATK, 1);
                ret = TRUE;
            }
        }
    }
  
    if (GetItemAttr(item, ITEMATTR_DEF_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_DEF, NULL) < 12) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_DEF, 1);
                ret = TRUE;
            }
        }
    }  
    
    if (GetItemAttr(item, ITEMATTR_SPATK_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPATK, NULL) < 12) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPATK, 1);
                ret = TRUE;
            }
        }
    }
    
    if (GetItemAttr(item, ITEMATTR_SPDEF_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPDEF, NULL) < 12) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPDEF, 1);
                ret = TRUE;
            }
        }
    }

    if (GetItemAttr(item, ITEMATTR_SPEED_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPEED, NULL) < 12) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_SPEED, 1);
                ret = TRUE;
            }
        }
    }
    
    if (GetItemAttr(item, ITEMATTR_ACCURACY_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            if (GetBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_ACC, NULL) < 12) {
                AddBattlerVar(ctx, battlerId, BMON_DATA_STAT_CHANGE_ACC, 1);
                ret = TRUE;
            }
        }
    }
    
    if (GetItemAttr(item, ITEMATTR_CRITRATE_STAGES, HEAP_ID_BATTLE)) {
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            data = GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL);
            if (!(data & STATUS2_FOCUS_ENERGY)) {
                data |= STATUS2_FOCUS_ENERGY;
                SetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, &data);
                ret = TRUE;
            }
        }
    }
    
    if (GetItemAttr(item, ITEMATTR_PP_RESTORE, HEAP_ID_BATTLE)) {
        data = GetItemAttr(item, ITEMATTR_PP_RESTORE_PARAM, HEAP_ID_BATTLE);
        if (GetMonData(mon, MON_DATA_MOVE1PP + movePos, NULL) != GetMonData(mon, MON_DATA_MOVE1MAXPP + movePos, NULL)) {
            AddMonData(mon, MON_DATA_MOVE1PP + movePos, data);
            if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                if (!(GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL) & STATUS2_TRANSFORMED) && !(GetBattlerVar(ctx, battlerId, BMON_DATA_MIMICED_MOVE, NULL) & MaskOfFlagNo(movePos))) {
                    AddBattlerVar(ctx, battlerId, BMON_DATA_MOVE1PP + movePos, data);
                }
            }
            ret = TRUE;
        }
    }

    if (GetItemAttr(item, ITEMATTR_PP_RESTORE_ALL, HEAP_ID_BATTLE)) {
        data = GetItemAttr(item, ITEMATTR_PP_RESTORE_PARAM, HEAP_ID_BATTLE);
        for (movePos = 0; movePos < MAX_MON_MOVES; movePos++) {
            if (GetMonData(mon, MON_DATA_MOVE1PP + movePos, NULL) != GetMonData(mon, MON_DATA_MOVE1MAXPP + movePos, NULL)) {
                AddMonData(mon, MON_DATA_MOVE1PP + movePos, data);
                if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                    if (!(GetBattlerVar(ctx, battlerId, BMON_DATA_STATUS2, NULL) & STATUS2_TRANSFORMED) && !(GetBattlerVar(ctx, battlerId, BMON_DATA_MIMICED_MOVE, NULL) & MaskOfFlagNo(movePos))) {
                        AddBattlerVar(ctx, battlerId, BMON_DATA_MOVE1PP + movePos, data);
                    }
                }
                ret = TRUE;
            }
        }
    }
    
    if (GetItemAttr(item, ITEMATTR_HP_RESTORE, HEAP_ID_BATTLE)) {
        data = 0;
        if (GetItemAttr(item, ITEMATTR_REVIVE, HEAP_ID_BATTLE)) {
            if (GetMonData(mon, MON_DATA_HP, NULL) == 0) {
                data = 1;
            }
        } else {
            data = GetMonData(mon, MON_DATA_HP, NULL);
        }
        if (data && GetMonData(mon, MON_DATA_HP, NULL) != GetMonData(mon, MON_DATA_MAXHP, NULL)) {
            data = GetItemAttr(item, ITEMATTR_HP_RESTORE_PARAM, HEAP_ID_BATTLE);
            switch (data) {
            case HP_RESTORE_ALL:
                data = GetMonData(mon, MON_DATA_MAXHP, NULL);
                break;
            case HP_RESTORE_HALF:
                data = GetMonData(mon, MON_DATA_MAXHP, NULL) / 2;
                if (data == 0) {
                    data = 1;
                }
                break;
            case HP_RESTORE_QTR:
                data = GetMonData(mon, MON_DATA_MAXHP, NULL) *25 / 100;
                if (data == 0) {
                    data = 1;
                }
                break;
            default:
                break;
            }
            AddMonData(mon, MON_DATA_HP, data);
            if (!GetItemAttr(item, ITEMATTR_REVIVE, HEAP_ID_BATTLE)) {
                if (BattleSystem_GetFieldSide(bsys, battlerId)) {
                    SetBattlerVar(ctx, battlerId, BMON_DATA_HELD_ITEM_RESTORE_HP, &data);
                } else if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
                    AddBattlerVar(ctx, battlerId, BMON_DATA_HP, data);
                }
            }
            ret = TRUE;
        }
    }
    
    if (GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_LO, HEAP_ID_BATTLE)) {
        if (GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) < 100 && ret == TRUE) {
            friendship = GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_LO_PARAM, HEAP_ID_BATTLE);
        }
    }

    if (GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_MED, HEAP_ID_BATTLE)) {
        if (GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) >= 100 && GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) < 200 && ret == TRUE) {
            friendship = GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_MED_PARAM, HEAP_ID_BATTLE);
        }
    }

    if (GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_HI, HEAP_ID_BATTLE)) {
        if (GetMonData(mon, MON_DATA_FRIENDSHIP, NULL) >= 200 && ret == TRUE) {
            friendship = GetItemAttr(item, ITEMATTR_FRIENDSHIP_MOD_HI_PARAM, HEAP_ID_BATTLE);
        }
    }
    
    if (friendship) {
        if (friendship > 0) {
            if (BallToItemId(BattleSystem_GetMonBall(bsys, mon)) == ITEM_LUXURY_BALL) {
                friendship++;
            }
            if (GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == BattleSystem_GetLocation(bsys)) {
                friendship++;
            }
            data = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
            if (GetItemAttr(data, ITEMATTR_HOLD_EFFECT, HEAP_ID_BATTLE) == HOLD_EFFECT_FRIENDSHIP_UP) {
                friendship = friendship * 150 / 100;
            }
        }
        AddMonData(mon, MON_DATA_FRIENDSHIP, friendship);
        if (index1 == selectedMonIndex || index2 == selectedMonIndex) {
            AddBattlerVar(ctx, battlerId, BMON_DATA_FRIENDSHIP, friendship);
        }
    }

    if (ret == TRUE) {
        ApplyItemEffectOnMonMood(mon, item);
    }
    
    return ret;
}
