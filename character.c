#include <gb/gb.h>

struct character
{
    UINT8 x;
    UINT8 y;

    UINT8 speed_x;
    UINT8 speed_y;

    BYTE is_jumping;
    UINT8 index;

    UINT8 half_size;
};
