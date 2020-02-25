#include <gb/gb.h>
#include <stdio.h>
#include <rand.h>
#include <stdlib.h>
#include <gb/font.h>

#include "dino.c"
#include "cac.c"

#include "mapTile.c"
#include "map.c"

#include "character.c"

struct character dinosaur;
struct character cactus[5];

UINT8 floorY = 107;

UINT8 jumpDistance = 20;
UINT8 gravity = 3;

UINT8 maxDinosaurSpeedY;
UINT8 maxCactusSpeedX = 2;

BYTE gameOver = 0;
UINT8 score = 0;

unsigned char scoreMap[] =
{
  0x13,0x10,0x17,0x17,0x1A
};


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

void displayCactus(int index)
{
    cactus[index].x = 50 + (index + 1) * (50 + (rand() % 10));
    cactus[index].y = floorY;

    cactus[index].speedX = maxCactusSpeedX;
    cactus[index].speedY = 0;

    cactus[index].characterIndex = index + 1;
    cactus[index].halfSize = 4;

    set_sprite_tile(index + 1, index + 1);
    move(cactus[index].characterIndex, cactus[index].x, cactus[index].y);
}

void moveCactus(int index)
{
    cactus[index].x += -cactus[index].speedX;
    cactus[index].y += cactus[index].speedY;

    scroll_sprite(cactus[index].characterIndex, -cactus[index].speedX, cactus[index].speedY);
}

void stop(struct character* character, int index)
{
    character[index].speedX = 0;
    character[index].speedY = 0;
}

void initCactus()
{
    set_sprite_data(1, 2, cac);
    set_sprite_data(2, 3, cac);
    set_sprite_data(3, 4, cac);
    set_sprite_data(4, 5, cac);
    set_sprite_data(5, 6, cac);
    
    displayCactus(0);
    displayCactus(1);
    displayCactus(2);
    displayCactus(3);
}

void updateCactus()
{
    moveCactus(0);
    moveCactus(1);
    moveCactus(2);
    moveCactus(3);
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

void initFont()
{
    font_t font;
    font_init();

    font = font_load(font_min);
    font_set(font);

    set_win_tiles(0, 0, 5, 1, scoreMap);
    move_win(7, 136);
}

void initBackground()
{
    set_bkg_data(38, 4, mapTile);
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
    initFont();
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

    SHOW_WIN;
    SHOW_BKG;
    
    SHOW_SPRITES;
    DISPLAY_ON;

    while (TRUE)
    {
        if (joypad() & J_A)
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

        if (checkCollision(&dinosaur, &cactus[0]) || checkCollision(&dinosaur, &cactus[1]) || checkCollision(&dinosaur, &cactus[2]) || checkCollision(&dinosaur, &cactus[3]))
        {
            if (gameOver == 0)
            {
                stop(&cactus, 0);
                stop(&cactus, 1);
                stop(&cactus, 2);
                stop(&cactus, 3);

                stop(&dinosaur, 0);
                
                gameOver = 1;
            }
        }
        performantDelay(3);
    }
}