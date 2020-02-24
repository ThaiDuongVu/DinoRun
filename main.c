#include <gb/gb.h>
#include <stdio.h>
#include <rand.h>

#include "dino.c"
#include "cac.c"

#include "mapTile.c"
#include "map.c"

#include "character.c"

struct character dinosaur;
struct character cactus;

UINT8 floorY = 107;

UINT8 jumpDistance = 20;
UINT8 gravity = 3;

UINT8 maxDinosaurSpeedY;
UINT8 maxCactusSpeedX = 2;

BYTE gameOver = 0;
UINT8 score = 0;

void move(UINT8 characterIndex, UINT8 x, UINT8 y)
{
    move_sprite(characterIndex, x, y);
}

void fall(struct character* character)
{
    if ((character->y < floorY - jumpDistance) && (character->isJumping == 1))
    {
        character->speedY = maxDinosaurSpeedY;
        maxDinosaurSpeedY += gravity;
    }
    if (character->y >= floorY)
    {
        character->isJumping = 0;
        maxDinosaurSpeedY = 2;

        character->speedY = 0;
        character->y = floorY;
    }
}

void initDino()
{
    set_sprite_data(0, 1, dino);

    dinosaur.x = 30;
    dinosaur.y = floorY;

    dinosaur.speedX = 0;
    dinosaur.speedY = 0;

    dinosaur.characterIndex = 0;
    dinosaur.halfSize = 4;

    set_sprite_tile(0, 0);
    move(dinosaur.characterIndex, dinosaur.x, dinosaur.y);
}

void updateDino()
{
    dinosaur.x += dinosaur.speedX;
    dinosaur.y += dinosaur.speedY;

    scroll_sprite(dinosaur.characterIndex, dinosaur.speedX, dinosaur.speedY);
    fall(&dinosaur);
}

void initCactus()
{
    set_sprite_data(1, 2, cac);

    cactus.x = 100;
    cactus.y = floorY;

    cactus.speedX = maxCactusSpeedX;
    cactus.speedY = 0;

    cactus.characterIndex = 1;
    cactus.halfSize = 4;

    set_sprite_tile(1, 1);
    move(cactus.characterIndex, cactus.x, cactus.y);
}

void updateCactus()
{
    cactus.x += -cactus.speedX;
    cactus.y += cactus.speedY;

    scroll_sprite(cactus.characterIndex, -cactus.speedX, 0);
}

BYTE checkCollision(struct character* character1, struct character* character2)
{
    BYTE collideX = 0;
    BYTE collideY = 0;

    if (character1->x + character1->halfSize > character2->x - character2->halfSize)
    {
        if (character1->x - character1->halfSize < character2->x + character2->halfSize)
        {
            collideX = 1;
        }
    }
    if (character1->y + character1->halfSize > character2->y - character2->halfSize)
    {
        if (character1->y - character1->halfSize < character2->y + character2->halfSize)
        {
            collideY = 1;
        }
    }
    if (collideX == 1 && collideY == 1)
    {
        return 1;
    }
    return 0;
}

void initBackground()
{
    set_bkg_data(0, 4, mapTile);
    set_bkg_tiles(0, 0, 40, 18, map);
}

void updateBackground()
{
    if (gameOver == 0)
    {
        scroll_bkg(maxCactusSpeedX, 0);
    }
}

void init()
{
    initBackground();

    initDino();
    initCactus();

    gameOver = 0;
    score = 0;
}

void performantDelay(UINT8 delay)
{
    UINT8 i = 0;
    for (i = 0; i < delay; i++)
    {
        wait_vbl_done();
    }
}

void jump(struct character* character)
{
    if (character->isJumping == 0)
    {
        character->speedY = -maxDinosaurSpeedY;
        character->isJumping = 1;
    }
}

void main()
{
    init();

    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    while (TRUE)
    {
        if (joypad())
        {
            if (gameOver == 0)
            {
                jump(&dinosaur);
            }
            else
            {
                init();
            }
        }
        updateBackground();

        updateDino();
        updateCactus();

        if (checkCollision(&dinosaur, &cactus) == 1 && gameOver == 0)
        {
            cactus.speedX = 0;
            gameOver = 1;
        }

        performantDelay(3);
    }
}