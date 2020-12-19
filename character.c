#include <gb/gb.h>

struct character
{
    // x, y coordinates
    UINT8 x;
    UINT8 y;

    // vertical, horizontal speed
    UINT8 speed_x;
    UINT8 speed_y;

    // whether a character is jumping
    BYTE is_jumping;

    UINT8 index;

    // (size of character tile) / 2
    UINT8 half_size;
};
