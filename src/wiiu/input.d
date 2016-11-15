module wiiu.input;

import vpad.input;

extern (C)
{
    extern __gshared VPADStatus vpad_status;
    extern __gshared float tpXPos;
    extern __gshared float tpYPos;
    extern __gshared bool tpTouched;
}
