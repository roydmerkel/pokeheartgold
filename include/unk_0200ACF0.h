#ifndef POKEHEARTGOLD_UNK_0200ACF0_H
#define POKEHEARTGOLD_UNK_0200ACF0_H

#include "unk_0200A090.h"

void sub_0200ACF0(struct _2DGfxResObj *obj);
void sub_0200AD30(struct _2DGfxResObjList *charResObjList);
void sub_0200AD64(struct _2DGfxResObj* obj);
void sub_0200ADA4(struct _2DGfxResObj *charResObj);
void sub_0200ADE4(struct _2DGfxResObjList *charResObjList);
void sub_0200AE18(struct _2DGfxResObj* obj);
void sub_0200AE58(struct _2DGfxResObjList *charResObjList);
void sub_0200AEB0(struct _2DGfxResObj *charResObj);
void sub_0200AED4(struct _2DGfxResObjList *charResObjList);
NNSG2dImageProxy *sub_0200AF00(struct _2DGfxResObj *charResObj);
NNSG2dImageProxy *sub_0200AF24(struct _2DGfxResObj *charResObj, struct _2DGfxResObj *cellResObj);
void sub_0200AF80(const NNSG2dImageProxy* imgProxy);
void sub_0200AF94(struct _2DGfxResObj *obj);
void sub_0200AFD8(struct _2DGfxResObjList *plttResObjList);
BOOL sub_0200B00C(struct _2DGfxResObj *plttResObj);
void sub_0200B050(struct _2DGfxResObjList *plttResObjList);
void sub_0200B0A8(struct _2DGfxResObj *plttResObj);
int sub_0200B12C(struct _2DGfxResObj* plttResObj, int vram);
void sub_0200B0CC(struct _2DGfxResObjList *plttResObjList);
NNSG2dImagePaletteProxy *sub_0200B0F8(struct _2DGfxResObj *plttResObj, NNSG2dImageProxy *imageProxy);

#endif //POKEHEARTGOLD_UNK_0200ACF0_H
