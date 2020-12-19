#include <gb/gb.h>
#include <gb/font.h>
#include <stdio.h>
#include <stdlib.h>
#include <rand.h>

#include "dino_tile.c"
#include "cactus_tile.c"

#include "map_tile.c"
#include "map.c"

#include "character.c"

struct character dinosaur;
struct character cactuses[4];

UINT8 floor_y = 107;

UINT8 jump_distance = 20;
UINT8 gravity = 3;

UINT8 max_dinosaur_speed_y;
UINT8 max_cactus_speed_x = 2;

BYTE is_game_over = 0;
UINT8 score = 0;

unsigned char score_map[] = {0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

unsigned char game_over_map[] = {0x12, 0x0C, 0x18, 0x10, 0x01, 0x1A, 0X21, 0X10, 0X1D};

void performant_delay(UINT8 delay)
{
    UINT8 i = 0;
    for (i = 0; i < delay; i++)
        wait_vbl_done();
}

void set_score(int condition, int index)
{
    switch (condition)
    {
    case 0:
        score_map[index] = 0x02;
        break;
    case 1:
        score_map[index] = 0x03;
        break;
    case 2:
        score_map[index] = 0x04;
        break;
    case 3:
        score_map[index] = 0x05;
        break;
    case 4:
        score_map[index] = 0x06;
        break;
    case 5:
        score_map[index] = 0x07;
        break;
    case 6:
        score_map[index] = 0x08;
        break;
    case 7:
        score_map[index] = 0x09;
        break;
    case 8:
        score_map[index] = 0x0A;
        break;
    case 9:
        score_map[index] = 0x0B;
        break;

    default:
        break;
    }
}

// make a character fall to gravity
void fall(struct character *character)
{
    // if character is in the air
    if ((character->y < floor_y - jump_distance) && (character->is_jumping))
    {
        character->speed_y = max_dinosaur_speed_y;
        max_dinosaur_speed_y += gravity;
    }

    // if character is grounded
    if (character->y >= floor_y)
    {
        character->is_jumping = 0;
        max_dinosaur_speed_y = 2;

        character->speed_y = 0;
        character->y = floor_y;
    }
}

// stop a character
void character_stop(struct character *character, int index)
{
    character[index].speed_x = 0;
    character[index].speed_y = 0;
}

// initialize dinosaur
void init_dino()
{
    set_sprite_data(0, 1, dino);

    dinosaur.x = 30;
    dinosaur.y = floor_y;

    dinosaur.speed_x = 0;
    dinosaur.speed_y = 0;

    dinosaur.index = 0;
    dinosaur.half_size = 4;

    set_sprite_tile(0, 0);
    move_sprite(dinosaur.index, dinosaur.x, dinosaur.y);
}

// update dinosaur
void update_dino()
{
    dinosaur.x += dinosaur.speed_x;
    dinosaur.y += dinosaur.speed_y;

    // move dinosaur at vertical & horizontal speed
    scroll_sprite(dinosaur.index, dinosaur.speed_x, dinosaur.speed_y);
    // make dinosaur fall to gravity
    fall(&dinosaur);
}

// initialize cactus in cactuses array at index
void init_cactus(int index)
{
    cactuses[index].x = 50 + (index + 1) * (50 + (rand() % 3));
    cactuses[index].y = floor_y;

    cactuses[index].speed_x = max_cactus_speed_x;
    cactuses[index].speed_y = 0;

    cactuses[index].index = index + 1;
    cactuses[index].half_size = 4;

    set_sprite_tile(index + 1, index + 1);
    move_sprite(cactuses[index].index, cactuses[index].x, cactuses[index].y);
}

// initialize all cactuses in cactuses array
void init_all_cactuses()
{
    set_sprite_data(1, 2, cac);
    set_sprite_data(2, 3, cac);
    set_sprite_data(3, 4, cac);
    set_sprite_data(4, 5, cac);
    set_sprite_data(5, 6, cac);

    init_cactus(0);
    init_cactus(1);
    init_cactus(2);
    init_cactus(3);
}

// update cactus in cactuses array at index
void update_cactus(int index)
{
    cactuses[index].x += -cactuses[index].speed_x;
    cactuses[index].y += cactuses[index].speed_y;

    if (cactuses[index].x <= 0)
    {
        cactuses[index].x = 50 + (index + 1) * (50 + (rand() % 3));
        set_sprite_tile(index + 1, index + 1);

        move_sprite(cactuses[index].index, cactuses[index].x, cactuses[index].y);
    }

    scroll_sprite(cactuses[index].index, -cactuses[index].speed_x, cactuses[index].speed_y);
}

// update all cactuses in cactuses array
void update_all_cactuses()
{
    update_cactus(0);
    update_cactus(1);
    update_cactus(2);
    update_cactus(3);
}

// check for collision between 2 characters based on positions and sizes
BYTE check_collision(struct character *character1, struct character *character2)
{
    BYTE collide_x = 0;
    BYTE collide_y = 0;

    if (character1->x + character1->half_size > character2->x - character2->half_size)
    {
        if (character1->x - character1->half_size < character2->x + character2->half_size)
            collide_x = 1;
    }
    if (character1->y + character1->half_size > character2->y - character2->half_size)
    {
        if (character1->y - character1->half_size < character2->y + character2->half_size)
            collide_y = 1;
    }
    if (collide_x && collide_y)
        return 1;

    return 0;
}

// initialize text font
void init_font()
{
    font_t font;
    font_init();

    font = font_load(font_min);
    font_set(font);

    score_map[0] = 0x02;
    score_map[1] = 0x01;
    score_map[2] = 0x01;
    score_map[3] = 0x01;
    score_map[4] = 0x01;
    score_map[5] = 0x01;
    score_map[6] = 0x01;
    score_map[7] = 0x01;
    score_map[8] = 0x01;

    set_win_tiles(0, 0, 9, 1, score_map);
    move_win(7, 136);
}

void addScore(int amount)
{
    if (score < 99)
        score += amount;
}

// update game score
void update_score()
{
    if (score < 10)
    {
        set_score(score, 0);
        set_win_tiles(0, 0, 1, 1, score_map);
    }
    else if (score >= 10 && score < 100)
    {
        set_score(score / 10, 0);
        set_score(score % 10, 1);

        set_win_tiles(0, 0, 2, 1, score_map);
    }
}

// game over behaviour
void game_over()
{
    set_win_tiles(0, 0, 9, 1, game_over_map);
}

// initialize background tiles
void init_background()
{
    set_bkg_data(38, 4, mapTile);
    set_bkg_tiles(0, 0, 40, 18, map);
}

// scroll background to the left
void scroll_background()
{
    if (!is_game_over)
        scroll_bkg(max_cactus_speed_x, 0);
}

// initialize game
void init()
{
    init_font();
    init_background();

    init_dino();
    init_all_cactuses();

    is_game_over = 0;
    score = 0;
}

// character jump
void jump(struct character *character)
{
    if (!character->is_jumping)
    {
        character->speed_y = -max_dinosaur_speed_y;
        character->is_jumping = 1;

        addScore(1);
    }
}
void main()
{
    init();

    SHOW_WIN;
    SHOW_BKG;

    SHOW_SPRITES;
    DISPLAY_ON;

    // main game loop
    while (TRUE)
    {
        // if A button pressed then dinosaur jump
        if (joypad() & J_A)
        {
            if (!is_game_over)
                jump(&dinosaur);
            else
                init();
        }

        // while game is not over, perform game logic
        if (!is_game_over)
        {
            scroll_background();
            update_score();

            update_dino();
            update_all_cactuses();

            // if dinosaur collide with any cactuses then game over
            if (check_collision(&dinosaur, &cactuses[0]) || check_collision(&dinosaur, &cactuses[1]) || check_collision(&dinosaur, &cactuses[2]) || check_collision(&dinosaur, &cactuses[3]))
            {
                // stop all characters
                character_stop(&cactuses, 0);
                character_stop(&cactuses, 1);
                character_stop(&cactuses, 2);
                character_stop(&cactuses, 3);
                character_stop(&dinosaur, 0);

                game_over();
                is_game_over = 1;
            }
        }

        performant_delay(3);
    }
}