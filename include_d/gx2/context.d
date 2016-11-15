/* Converted to D from include/gx2/context.h by htod */
module gx2.context;
//C     #pragma once
//C     #include <wut.h>
import wut;

/**
 * \defgroup gx2_context Context State
 * \ingroup gx2
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef struct GX2ShadowState GX2ShadowState;
extern (C):

struct GX2ShadowState
{
    uint [2816]config;
    uint [1024]context;
    uint [2048]alu;
    uint [96]loop;
    char [128] unk1;
    uint [3486]resource;
    char [136] unk2;
    uint [162]sampler;
    char [120] unk3;
}

struct GX2ContextState
{
   GX2ShadowState shadowState;
   ubyte[4] unk1;
   uint shadowDisplayListSize;
   ubyte[0x9e00 - 0x9808] unk2;
   uint shadowDisplayList[192];
};

void
GX2SetupContextStateEx(GX2ContextState *state,
                       bool unk1);

void
GX2GetContextStateDisplayList(GX2ContextState *state,
                              void *outDisplayList,
                              uint *outSize);

void
GX2SetContextState(GX2ContextState *state);

void
GX2SetDefaultState();
