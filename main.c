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
    0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
};

unsigned char gameOverMap[] = 
{
    0x12, 0x0C, 0x18, 0x10, 0x01, 0x1A, 0X21, 0X10, 0X1D
};

void performantDelay(UINT8 delay)
{
    UINT8 i = 0;
    for (i = 0; i < delay; i++)
    {
        wait_vbl_done();
    }
}

void setScore(int condition, int index)
{
    switch (condition)
    {
    case 0:
        scoreMap[index] = 0x02;
        break;
    case 1:
        scoreMap[index] = 0x03;
        break;
    case 2:
        scoreMap[index] = 0x04;
        break;
    case 3:
        scoreMap[index] = 0x05;
        break;
    case 4:
        scoreMap[index] = 0x06;
        break;
    case 5:
        scoreMap[index] = 0x07;
        break;
    case 6:
        scoreMap[index] = 0x08;
        break;
    case 7:
        scoreMap[index] = 0x09;
        break;
    case 8:
        scoreMap[index] = 0x0A;
        break;
    case 9:
        scoreMap[index] = 0x0B;
        break;
    
    default:
        break;
    }
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
    move_sprite(dinosaur.characterIndex, dinosaur.x, dinosaur.y);
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
    cactus[index].x = 50 + (index + 1) * (50 + (rand() % 3));
    cactus[index].y = floorY;

    cactus[index].speedX = maxCactusSpeedX;
    cactus[index].speedY = 0;

    cactus[index].characterIndex = index + 1;
    cactus[index].halfSize = 4;

    set_sprite_tile(index + 1, index + 1);
    move_sprite(cactus[index].characterIndex, cactus[index].x, cactus[index].y);
}

void moveCactus(int index)
{
    cactus[index].x += -cactus[index].speedX;
    cactus[index].y += cactus[index].speedY;

    if (cactus[index].x <= 0)
    {
        cactus[index].x = 50 + (index + 1) * (50 + (rand() % 3));
        set_sprite_tile(index + 1, index + 1);

        move_sprite(cactus[index].characterIndex, cactus[index].x, cactus[index].y);
    }

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

    scoreMap[0] = 0x02;
    scoreMap[1] = 0x01;
    scoreMap[2] = 0x01;
    scoreMap[3] = 0x01;
    scoreMap[4] = 0x01;
    scoreMap[5] = 0x01;
    scoreMap[6] = 0x01;
    scoreMap[7] = 0x01;
    scoreMap[8] = 0x01;

    set_win_tiles(0, 0, 9, 1, scoreMap);
    move_win(7, 136);
}

void updateScore()
{
    if (score < 10)
    {
        setScore(score, 0);

        set_win_tiles(0, 0, 1, 1, scoreMap);
    }
    else if (score >= 10 && score < 100)
    {
        setScore(score / 10, 0);
        setScore(score % 10, 1);

        set_win_tiles(0, 0, 2, 1, scoreMap);
    }
}

void gameOverAction()
{
    set_win_tiles(0, 0, 9, 1, gameOverMap);
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

void addScore()
{
    if (score < 99)
    {
        score++;
    }
}

void jump(struct character* character)
{
    if (character->isJumping == 0)
    {
        character->speedY = -maxDinosaurSpeedY;
        addScore();
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
        if (gameOver == 0)
        {
            updateBackground();
            updateScore();

            updateDino();
            updateCactus();

            if (checkCollision(&dinosaur, &cactus[0]) || checkCollision(&dinosaur, &cactus[1]) || checkCollision(&dinosaur, &cactus[2]) || checkCollision(&dinosaur, &cactus[3]))
            {
                
                stop(&cactus, 0);
                stop(&cactus, 1);
                stop(&cactus, 2);
                stop(&cactus, 3);

                stop(&dinosaur, 0);

                gameOverAction();
                gameOver = 1;
                
            }
        }
        
        performantDelay(3);
    }
}