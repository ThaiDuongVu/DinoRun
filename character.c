#include <gb/gb.h>

struct character
{
    UINT8 x;
    UINT8 y;

    UINT8 speedX;
    UINT8 speedY;

    BYTE isJumping;
    UINT8 characterIndex;

    UINT8 halfSize;
};
