/* Converted to D from include/wut_structsize.h by htod */
module wut_structsize;
//C     #pragma once
//C     #include <assert.h>
//import std.c.assert;
//C     #include <stddef.h>
//import std.c.stddef;

// Ensure structs are correct size & offsets
//C     #define CHECK_SIZE(Type, Size)    static_assert(sizeof(Type) == Size,                  #Type " must be " #Size " bytes")

//C     #define CHECK_OFFSET(Type, Offset, Field)    static_assert(offsetof(Type, Field) == Offset,                  #Type "::" #Field " must be at offset " #Offset)

// Workaround weird macro concat ## behaviour
//C     #define PP_CAT(a, b) PP_CAT_I(a, b)
//C     #define PP_CAT_I(a, b) PP_CAT_II(~, a ## b)
//C     #define PP_CAT_II(p, res) res

// Allow us to easily add UNKNOWN / PADDING bytes into our structs,
// generates unique variable names using __COUNTER__
//C     #define UNKNOWN(Size) char PP_CAT(__unk, __COUNTER__) [Size]
//C     #define PADDING(Size) UNKNOWN(Size)

// Just some placeholder defines
//C     #define UNKNOWN_ARG uint32_t
//C     #define UNKNOWN_ARGS void
alias uint UNKNOWN_ARG;
//C     #define UNKNOWN_SIZE(x)
alias void UNKNOWN_ARGS;
