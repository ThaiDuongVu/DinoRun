;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _jump
	.globl _init
	.globl _scroll_background
	.globl _init_background
	.globl _game_over
	.globl _update_score
	.globl _addScore
	.globl _init_font
	.globl _check_collision
	.globl _update_all_cactuses
	.globl _update_cactus
	.globl _init_all_cactuses
	.globl _init_cactus
	.globl _update_dino
	.globl _init_dino
	.globl _character_stop
	.globl _fall
	.globl _set_score
	.globl _performant_delay
	.globl _rand
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _game_over_map
	.globl _score_map
	.globl _score
	.globl _is_game_over
	.globl _max_cactus_speed_x
	.globl _max_dinosaur_speed_y
	.globl _gravity
	.globl _jump_distance
	.globl _floor_y
	.globl _cactuses
	.globl _dinosaur
	.globl _map
	.globl _mapTile
	.globl _cactus_tile
	.globl _dino_tile
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_dino_tile::
	.ds 32
_cactus_tile::
	.ds 32
_mapTile::
	.ds 64
_map::
	.ds 720
_dinosaur::
	.ds 7
_cactuses::
	.ds 28
_floor_y::
	.ds 1
_jump_distance::
	.ds 1
_gravity::
	.ds 1
_max_dinosaur_speed_y::
	.ds 1
_max_cactus_speed_x::
	.ds 1
_is_game_over::
	.ds 1
_score::
	.ds 1
_score_map::
	.ds 9
_game_over_map::
	.ds 9
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;dino_tile.c:26: unsigned char dino_tile[] =
	ld	hl, #_dino_tile
	ld	(hl), #0x3e
	ld	hl, #(_dino_tile + 0x0001)
	ld	(hl), #0x3e
	ld	hl, #(_dino_tile + 0x0002)
	ld	(hl), #0x36
	ld	hl, #(_dino_tile + 0x0003)
	ld	(hl), #0x36
	ld	hl, #(_dino_tile + 0x0004)
	ld	(hl), #0x3e
	ld	hl, #(_dino_tile + 0x0005)
	ld	(hl), #0x3e
	ld	hl, #(_dino_tile + 0x0006)
	ld	(hl), #0x3c
	ld	hl, #(_dino_tile + 0x0007)
	ld	(hl), #0x3c
	ld	hl, #(_dino_tile + 0x0008)
	ld	(hl), #0x7f
	ld	hl, #(_dino_tile + 0x0009)
	ld	(hl), #0x7f
	ld	hl, #(_dino_tile + 0x000a)
	ld	(hl), #0xbc
	ld	hl, #(_dino_tile + 0x000b)
	ld	(hl), #0xbc
	ld	hl, #(_dino_tile + 0x000c)
	ld	(hl), #0x24
	ld	hl, #(_dino_tile + 0x000d)
	ld	(hl), #0x24
	ld	hl, #(_dino_tile + 0x000e)
	ld	(hl), #0x36
	ld	hl, #(_dino_tile + 0x000f)
	ld	(hl), #0x36
	ld	hl, #(_dino_tile + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_dino_tile + 0x001f)
	ld	(hl), #0x00
;cactus_tile.c:26: unsigned char cactus_tile[] =
	ld	hl, #_cactus_tile
	ld	(hl), #0x3c
	ld	hl, #(_cactus_tile + 0x0001)
	ld	(hl), #0x3c
	ld	hl, #(_cactus_tile + 0x0002)
	ld	(hl), #0x3c
	ld	hl, #(_cactus_tile + 0x0003)
	ld	(hl), #0x3c
	ld	hl, #(_cactus_tile + 0x0004)
	ld	(hl), #0x3d
	ld	hl, #(_cactus_tile + 0x0005)
	ld	(hl), #0x3d
	ld	hl, #(_cactus_tile + 0x0006)
	ld	(hl), #0x3f
	ld	hl, #(_cactus_tile + 0x0007)
	ld	(hl), #0x3f
	ld	hl, #(_cactus_tile + 0x0008)
	ld	(hl), #0xff
	ld	hl, #(_cactus_tile + 0x0009)
	ld	(hl), #0xff
	ld	hl, #(_cactus_tile + 0x000a)
	ld	(hl), #0xbc
	ld	hl, #(_cactus_tile + 0x000b)
	ld	(hl), #0xbc
	ld	hl, #(_cactus_tile + 0x000c)
	ld	(hl), #0x3c
	ld	hl, #(_cactus_tile + 0x000d)
	ld	(hl), #0x3c
	ld	hl, #(_cactus_tile + 0x000e)
	ld	(hl), #0x3c
	ld	hl, #(_cactus_tile + 0x000f)
	ld	(hl), #0x3c
	ld	hl, #(_cactus_tile + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_cactus_tile + 0x001f)
	ld	(hl), #0x00
;map_tile.c:26: unsigned char mapTile[] =
	ld	hl, #_mapTile
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0016)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0017)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0019)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x001a)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x001c)
	ld	(hl), #0x9f
	ld	hl, #(_mapTile + 0x001d)
	ld	(hl), #0x60
	ld	hl, #(_mapTile + 0x001e)
	ld	(hl), #0xf1
	ld	hl, #(_mapTile + 0x001f)
	ld	(hl), #0x0e
	ld	hl, #(_mapTile + 0x0020)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0022)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0024)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0026)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0028)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x002a)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x002c)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x002e)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0030)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0032)
	ld	(hl), #0x1f
	ld	hl, #(_mapTile + 0x0033)
	ld	(hl), #0xe0
	ld	hl, #(_mapTile + 0x0034)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x0036)
	ld	(hl), #0xf0
	ld	hl, #(_mapTile + 0x0037)
	ld	(hl), #0x0f
	ld	hl, #(_mapTile + 0x0038)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x003a)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x003c)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_mapTile + 0x003e)
	ld	(hl), #0xff
	ld	hl, #(_mapTile + 0x003f)
	ld	(hl), #0x00
;map.c:25: unsigned char map[] =
	ld	hl, #_map
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0001)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0002)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0003)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0004)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0005)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0006)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0007)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0008)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0009)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x000a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x000b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x000c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x000d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x000e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x000f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0010)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0011)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0012)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0013)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0014)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0015)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0016)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0017)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0018)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0019)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x001a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x001b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x001c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x001d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x001e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x001f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0020)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0021)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0022)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0023)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0024)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0025)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0026)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0027)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0028)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0029)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x002a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x002b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x002c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x002d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x002e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x002f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0030)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0031)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0032)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0033)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0034)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0035)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0036)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0037)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0038)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0039)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x003a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x003b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x003c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x003d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x003e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x003f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0040)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0041)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0042)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0043)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0044)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0045)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0046)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0047)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0048)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0049)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x004a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x004b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x004c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x004d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x004e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x004f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0050)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0051)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0052)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0053)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0054)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0055)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0056)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0057)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0058)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0059)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x005a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x005b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x005c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x005d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x005e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x005f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0060)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0061)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0062)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0063)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0064)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0065)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0066)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0067)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0068)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0069)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x006a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x006b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x006c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x006d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x006e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x006f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0070)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0071)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0072)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0073)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0074)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0075)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0076)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0077)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0078)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0079)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x007a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x007b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x007c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x007d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x007e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x007f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0080)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0081)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0082)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0083)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0084)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0085)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0086)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0087)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0088)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0089)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x008a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x008b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x008c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x008d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x008e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x008f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0090)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0091)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0092)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0093)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0094)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0095)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0096)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0097)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0098)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0099)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x009a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x009b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x009c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x009d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x009e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x009f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00a9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00aa)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ab)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ac)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ad)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ae)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00af)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00b9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ba)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00bb)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00bc)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00bd)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00be)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00bf)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00c9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ca)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00cb)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00cc)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00cd)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ce)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00cf)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00d9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00da)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00db)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00dc)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00dd)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00de)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00df)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00e9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ea)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00eb)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ec)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ed)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ee)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ef)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00f9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00fa)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00fb)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00fc)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00fd)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00fe)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x00ff)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0100)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0101)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0102)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0103)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0104)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0105)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0106)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0107)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0108)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0109)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x010a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x010b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x010c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x010d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x010e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x010f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0110)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0111)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0112)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0113)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0114)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0115)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0116)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0117)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0118)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0119)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x011a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x011b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x011c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x011d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x011e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x011f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0120)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0121)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0122)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0123)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0124)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0125)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0126)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0127)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0128)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0129)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x012a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x012b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x012c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x012d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x012e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x012f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0130)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0131)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0132)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0133)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0134)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0135)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0136)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0137)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0138)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0139)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x013a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x013b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x013c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x013d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x013e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x013f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0140)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0141)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0142)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0143)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0144)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0145)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0146)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0147)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0148)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0149)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x014a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x014b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x014c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x014d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x014e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x014f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0150)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0151)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0152)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0153)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0154)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0155)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0156)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0157)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0158)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0159)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x015a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x015b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x015c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x015d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x015e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x015f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0160)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0161)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0162)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0163)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0164)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0165)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0166)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0167)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0168)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0169)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x016a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x016b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x016c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x016d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x016e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x016f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0170)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0171)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0172)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0173)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0174)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0175)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0176)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0177)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0178)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0179)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x017a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x017b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x017c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x017d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x017e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x017f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0180)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0181)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0182)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0183)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0184)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0185)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0186)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0187)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0188)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0189)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x018a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x018b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x018c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x018d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x018e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x018f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0190)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0191)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0192)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0193)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0194)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0195)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0196)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0197)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0198)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x0199)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x019a)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x019b)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x019c)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x019d)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x019e)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x019f)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01a9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01aa)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01ab)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01ac)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01ad)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01ae)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01af)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01b9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01ba)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01bb)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01bc)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01bd)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01be)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01bf)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01c9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01ca)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01cb)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01cc)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01cd)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01ce)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01cf)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d0)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d1)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d2)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d3)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d4)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d5)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d6)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d7)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d8)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01d9)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01da)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01db)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01dc)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01dd)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01de)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01df)
	ld	(hl), #0x26
	ld	hl, #(_map + 0x01e0)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e1)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e2)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e3)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e4)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e5)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e6)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e7)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e8)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01e9)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01ea)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01eb)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01ec)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01ed)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01ee)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01ef)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f0)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f1)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f2)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f3)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f4)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f5)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f6)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f7)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f8)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01f9)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01fa)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01fb)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01fc)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01fd)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01fe)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x01ff)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0200)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0201)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0202)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0203)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0204)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0205)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0206)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0207)
	ld	(hl), #0x27
	ld	hl, #(_map + 0x0208)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0209)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x020a)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x020b)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x020c)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x020d)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x020e)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x020f)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0210)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0211)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0212)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0213)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0214)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0215)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0216)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0217)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0218)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0219)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x021a)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x021b)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x021c)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x021d)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x021e)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x021f)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0220)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0221)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0222)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0223)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0224)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0225)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0226)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0227)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0228)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0229)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x022a)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x022b)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x022c)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x022d)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x022e)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x022f)
	ld	(hl), #0x29
	ld	hl, #(_map + 0x0230)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0231)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0232)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0233)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0234)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0235)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0236)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0237)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0238)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0239)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x023a)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x023b)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x023c)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x023d)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x023e)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x023f)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0240)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0241)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0242)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0243)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0244)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0245)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0246)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0247)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0248)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0249)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x024a)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x024b)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x024c)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x024d)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x024e)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x024f)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0250)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0251)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0252)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0253)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0254)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0255)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0256)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0257)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0258)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0259)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x025a)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x025b)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x025c)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x025d)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x025e)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x025f)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0260)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0261)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0262)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0263)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0264)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0265)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0266)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0267)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0268)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0269)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x026a)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x026b)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x026c)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x026d)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x026e)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x026f)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0270)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0271)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0272)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0273)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0274)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0275)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0276)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0277)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0278)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0279)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x027a)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x027b)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x027c)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x027d)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x027e)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x027f)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0280)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0281)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0282)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0283)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0284)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0285)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0286)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0287)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0288)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0289)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x028a)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x028b)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x028c)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x028d)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x028e)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x028f)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0290)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0291)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0292)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0293)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0294)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0295)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0296)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0297)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0298)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x0299)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x029a)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x029b)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x029c)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x029d)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x029e)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x029f)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a0)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a1)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a2)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a3)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a4)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a5)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a6)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a7)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a8)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02a9)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02aa)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02ab)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02ac)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02ad)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02ae)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02af)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b0)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b1)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b2)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b3)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b4)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b5)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b6)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b7)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b8)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02b9)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02ba)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02bb)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02bc)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02bd)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02be)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02bf)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c0)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c1)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c2)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c3)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c4)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c5)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c6)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c7)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c8)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02c9)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02ca)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02cb)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02cc)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02cd)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02ce)
	ld	(hl), #0x28
	ld	hl, #(_map + 0x02cf)
	ld	(hl), #0x28
;main.c:18: UINT8 floor_y = 107;
	ld	hl, #_floor_y
	ld	(hl), #0x6b
;main.c:20: UINT8 jump_distance = 20;
	ld	hl, #_jump_distance
	ld	(hl), #0x14
;main.c:21: UINT8 gravity = 3;
	ld	hl, #_gravity
	ld	(hl), #0x03
;main.c:24: UINT8 max_cactus_speed_x = 2;
	ld	hl, #_max_cactus_speed_x
	ld	(hl), #0x02
;main.c:26: BYTE is_game_over = 0;
	ld	hl, #_is_game_over
	ld	(hl), #0x00
;main.c:27: UINT8 score = 0;
	ld	hl, #_score
	ld	(hl), #0x00
;main.c:29: unsigned char score_map[] = {0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
	ld	hl, #_score_map
	ld	(hl), #0x02
	ld	hl, #(_score_map + 0x0001)
	ld	(hl), #0x01
	ld	hl, #(_score_map + 0x0002)
	ld	(hl), #0x01
	ld	hl, #(_score_map + 0x0003)
	ld	(hl), #0x01
	ld	hl, #(_score_map + 0x0004)
	ld	(hl), #0x01
	ld	hl, #(_score_map + 0x0005)
	ld	(hl), #0x01
	ld	hl, #(_score_map + 0x0006)
	ld	(hl), #0x01
	ld	hl, #(_score_map + 0x0007)
	ld	(hl), #0x01
	ld	hl, #(_score_map + 0x0008)
	ld	(hl), #0x01
;main.c:31: unsigned char game_over_map[] = {0x12, 0x0C, 0x18, 0x10, 0x01, 0x1A, 0X21, 0X10, 0X1D};
	ld	hl, #_game_over_map
	ld	(hl), #0x12
	ld	hl, #(_game_over_map + 0x0001)
	ld	(hl), #0x0c
	ld	hl, #(_game_over_map + 0x0002)
	ld	(hl), #0x18
	ld	hl, #(_game_over_map + 0x0003)
	ld	(hl), #0x10
	ld	hl, #(_game_over_map + 0x0004)
	ld	(hl), #0x01
	ld	hl, #(_game_over_map + 0x0005)
	ld	(hl), #0x1a
	ld	hl, #(_game_over_map + 0x0006)
	ld	(hl), #0x21
	ld	hl, #(_game_over_map + 0x0007)
	ld	(hl), #0x10
	ld	hl, #(_game_over_map + 0x0008)
	ld	(hl), #0x1d
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:33: void performant_delay(UINT8 delay)
;	---------------------------------
; Function performant_delay
; ---------------------------------
_performant_delay::
;main.c:36: for (i = 0; i < delay; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:37: wait_vbl_done();
	call	_wait_vbl_done
;main.c:36: for (i = 0; i < delay; i++)
	inc	c
;main.c:38: }
	jr	00103$
;main.c:40: void set_score(int condition, int index)
;	---------------------------------
; Function set_score
; ---------------------------------
_set_score::
;main.c:42: switch (condition)
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x00
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00125$
	bit	7, d
	jr	NZ, 00126$
	cp	a, a
	jr	00126$
00125$:
	bit	7, d
	jr	Z, 00126$
	scf
00126$:
	ret	C
	ldhl	sp,	#2
	ld	a, #0x09
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00127$
	bit	7, d
	jr	NZ, 00128$
	cp	a, a
	jr	00128$
00127$:
	bit	7, d
	jr	Z, 00128$
	scf
00128$:
	ret	C
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00129$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00129$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
	jp	00110$
;main.c:44: case 0:
00101$:
;main.c:45: score_map[index] = 0x02;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x02
;main.c:46: break;
	ret
;main.c:47: case 1:
00102$:
;main.c:48: score_map[index] = 0x03;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x03
;main.c:49: break;
	ret
;main.c:50: case 2:
00103$:
;main.c:51: score_map[index] = 0x04;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x04
;main.c:52: break;
	ret
;main.c:53: case 3:
00104$:
;main.c:54: score_map[index] = 0x05;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x05
;main.c:55: break;
	ret
;main.c:56: case 4:
00105$:
;main.c:57: score_map[index] = 0x06;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x06
;main.c:58: break;
	ret
;main.c:59: case 5:
00106$:
;main.c:60: score_map[index] = 0x07;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x07
;main.c:61: break;
	ret
;main.c:62: case 6:
00107$:
;main.c:63: score_map[index] = 0x08;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x08
;main.c:64: break;
	ret
;main.c:65: case 7:
00108$:
;main.c:66: score_map[index] = 0x09;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x09
;main.c:67: break;
	ret
;main.c:68: case 8:
00109$:
;main.c:69: score_map[index] = 0x0A;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a,h
	ld	(hl), #0x0a
;main.c:70: break;
	ret
;main.c:71: case 9:
00110$:
;main.c:72: score_map[index] = 0x0B;
	ld	bc, #_score_map+0
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x0b
;main.c:77: }
;main.c:78: }
	ret
;main.c:81: void fall(struct character *character)
;	---------------------------------
; Function fall
; ---------------------------------
_fall::
	add	sp, #-9
;main.c:84: if ((character->y < floor_y - jump_distance) && (character->is_jumping))
	ldhl	sp,#11
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_floor_y)
	ldhl	sp,	#3
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (#_jump_distance)
	ldhl	sp,	#5
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
;main.c:86: character->speed_y = max_dinosaur_speed_y;
	inc	bc
	inc	bc
	inc	bc
;main.c:84: if ((character->y < floor_y - jump_distance) && (character->is_jumping))
	ldhl	sp,	#5
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00123$
	bit	7, d
	jr	NZ, 00124$
	cp	a, a
	jr	00124$
00123$:
	bit	7, d
	jr	Z, 00124$
	scf
00124$:
	jr	NC, 00102$
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00102$
;main.c:86: character->speed_y = max_dinosaur_speed_y;
	ld	hl, #_max_dinosaur_speed_y
	ld	a, (hl)
	ld	(bc), a
;main.c:87: max_dinosaur_speed_y += gravity;
	ld	a, (hl)
	ld	hl, #_gravity
	add	a, (hl)
	ld	(#_max_dinosaur_speed_y),a
00102$:
;main.c:91: if (character->y >= floor_y)
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	ld	hl, #_floor_y
	sub	a, (hl)
	jr	C, 00106$
;main.c:93: character->is_jumping = 0;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:94: max_dinosaur_speed_y = 2;
	ld	hl, #_max_dinosaur_speed_y
	ld	(hl), #0x02
;main.c:96: character->speed_y = 0;
	xor	a, a
	ld	(bc), a
;main.c:97: character->y = floor_y;
	pop	de
	push	de
	ld	a, (#_floor_y)
	ld	(de), a
00106$:
;main.c:99: }
	add	sp, #9
	ret
;main.c:102: void character_stop(struct character *character, int index)
;	---------------------------------
; Function character_stop
; ---------------------------------
_character_stop::
;main.c:104: character[index].speed_x = 0;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;main.c:105: character[index].speed_y = 0;
	inc	bc
	inc	bc
	inc	bc
	ld	a, b
	ld	l, c
	ld	h, a
	ld	(hl), #0x00
;main.c:106: }
	ret
;main.c:109: void init_dino()
;	---------------------------------
; Function init_dino
; ---------------------------------
_init_dino::
	dec	sp
;main.c:111: set_sprite_data(0, 1, dino_tile);
	ld	hl, #_dino_tile
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:113: dinosaur.x = 30;
	ld	hl, #_dinosaur
	ld	(hl), #0x1e
;main.c:114: dinosaur.y = floor_y;
	ld	de, #(_dinosaur + 0x0001)
	ld	a, (#_floor_y)
	ld	(de), a
;main.c:116: dinosaur.speed_x = 0;
	ld	hl, #(_dinosaur + 0x0002)
	ld	(hl), #0x00
;main.c:117: dinosaur.speed_y = 0;
	ld	hl, #(_dinosaur + 0x0003)
	ld	(hl), #0x00
;main.c:119: dinosaur.index = 0;
	ld	hl, #(_dinosaur + 0x0005)
	ld	(hl), #0x00
;main.c:120: dinosaur.half_size = 4;
	ld	hl, #(_dinosaur + 0x0006)
	ld	(hl), #0x04
;C:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;main.c:123: move_sprite(dinosaur.index, dinosaur.x, dinosaur.y);
	ld	hl, #_floor_y
	ld	b, (hl)
	ld	hl, #_dinosaur
	ld	c, (hl)
	ld	a, (#(_dinosaur + 0x0005) + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:123: move_sprite(dinosaur.index, dinosaur.x, dinosaur.y);
;main.c:124: }
	inc	sp
	ret
;main.c:127: void update_dino()
;	---------------------------------
; Function update_dino
; ---------------------------------
_update_dino::
;main.c:129: dinosaur.x += dinosaur.speed_x;
	ld	hl, #_dinosaur
	ld	c, (hl)
	ld	a, (#(_dinosaur + 0x0002) + 0)
	add	a, c
	ld	hl, #_dinosaur
;main.c:130: dinosaur.y += dinosaur.speed_y;
	ld	(hl+), a
	ld	e, (hl)
	ld	bc, #_dinosaur + 3
	ld	a, (bc)
	add	a, e
	ld	(hl), a
;main.c:133: scroll_sprite(dinosaur.index, dinosaur.speed_x, dinosaur.speed_y);
	ld	a, (bc)
	ld	b, a
	ld	hl, #(_dinosaur + 0x0002)
	ld	c, (hl)
	ld	hl, #_dinosaur + 5
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	add	a, b
	ld	(hl+), a
	ld	a, (hl)
	add	a, c
	ld	(hl), a
;main.c:135: fall(&dinosaur);
	ld	hl, #_dinosaur
	push	hl
	call	_fall
	add	sp, #2
;main.c:136: }
	ret
;main.c:139: void init_cactus(int index)
;	---------------------------------
; Function init_cactus
; ---------------------------------
_init_cactus::
	add	sp, #-3
;main.c:141: cactuses[index].x = 100 + (index + 1) + (50 * (rand() % 3 + 1));
	ldhl	sp,#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_cactuses
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x65
	dec	hl
	ld	(hl), a
	push	bc
	call	_rand
	pop	bc
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	push	bc
	ld	hl, #0x0003
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, e
	inc	a
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	ldhl	sp,	#1
	add	a, (hl)
	ld	(bc), a
;main.c:142: cactuses[index].y = floor_y;
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (#_floor_y)
	ld	(de), a
;main.c:144: cactuses[index].speed_x = max_cactus_speed_x;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (#_max_cactus_speed_x)
	ld	(de), a
;main.c:145: cactuses[index].speed_y = 0;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;main.c:147: cactuses[index].index = index + 1;
	ld	hl, #0x0005
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#2
	inc	(hl)
	pop	de
	push	de
	ld	a, (hl)
	ld	(de), a
;main.c:148: cactuses[index].half_size = 4;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x04
;main.c:150: set_sprite_tile(index + 1, index + 1);
	ldhl	sp,	#2
	ld	e, (hl)
	ld	d, (hl)
;C:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
	inc	hl
	inc	hl
	ld	(hl), e
;main.c:151: move_sprite(cactuses[index].index, cactuses[index].x, cactuses[index].y);
	ld	a, (#_floor_y)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (bc)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
;C:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;C:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;main.c:151: move_sprite(cactuses[index].index, cactuses[index].x, cactuses[index].y);
;main.c:152: }
	add	sp, #3
	ret
;main.c:155: void init_all_cactuses()
;	---------------------------------
; Function init_all_cactuses
; ---------------------------------
_init_all_cactuses::
;main.c:157: set_sprite_data(1, 2, cactus_tile);
	ld	bc, #_cactus_tile+0
	push	bc
	ld	de, #0x0201
	push	de
	call	_set_sprite_data
	add	sp, #4
;main.c:158: set_sprite_data(2, 3, cactus_tile);
	push	bc
	ld	de, #0x0302
	push	de
	call	_set_sprite_data
	add	sp, #4
;main.c:159: set_sprite_data(3, 4, cactus_tile);
	push	bc
	ld	de, #0x0403
	push	de
	call	_set_sprite_data
	add	sp, #4
;main.c:160: set_sprite_data(4, 5, cactus_tile);
	push	bc
	ld	de, #0x0504
	push	de
	call	_set_sprite_data
	add	sp, #4
;main.c:161: set_sprite_data(5, 6, cactus_tile);
	push	bc
	ld	de, #0x0605
	push	de
	call	_set_sprite_data
	add	sp, #4
;main.c:163: init_cactus(0);
	ld	hl, #0x0000
	push	hl
	call	_init_cactus
	add	sp, #2
;main.c:164: init_cactus(1);
	ld	hl, #0x0001
	push	hl
	call	_init_cactus
	add	sp, #2
;main.c:165: init_cactus(2);
	ld	hl, #0x0002
	push	hl
	call	_init_cactus
	add	sp, #2
;main.c:166: init_cactus(3);
	ld	hl, #0x0003
	push	hl
	call	_init_cactus
	add	sp, #2
;main.c:167: }
	ret
;main.c:170: void update_cactus(int index)
;	---------------------------------
; Function update_cactus
; ---------------------------------
_update_cactus::
	add	sp, #-6
;main.c:172: cactuses[index].x -= cactuses[index].speed_x;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_cactuses
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
;c
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	inc	hl
	ld	(hl), a
	pop	de
	push	de
	ld	a, (hl)
	ld	(de), a
;main.c:173: cactuses[index].y += cactuses[index].speed_y;
	pop	de
	push	de
	inc	de
	ld	a, (de)
	inc	hl
	ld	(hl), a
	pop	bc
	push	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	add	a, (hl)
	ld	(de), a
;main.c:175: if (cactuses[index].x <= 0)
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;main.c:176: init_cactus(index);
	push	bc
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_init_cactus
	add	sp, #2
	pop	bc
00102$:
;main.c:178: scroll_sprite(cactuses[index].index, -cactuses[index].speed_x, cactuses[index].speed_y);
	ld	a, (bc)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	xor	a, a
	sub	a, c
	ld	c, a
;c
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	add	a, b
	ld	(hl+), a
	ld	a, (hl)
	add	a, c
	ld	(hl), a
;main.c:178: scroll_sprite(cactuses[index].index, -cactuses[index].speed_x, cactuses[index].speed_y);
;main.c:179: }
	add	sp, #6
	ret
;main.c:182: void update_all_cactuses()
;	---------------------------------
; Function update_all_cactuses
; ---------------------------------
_update_all_cactuses::
;main.c:184: update_cactus(0);
	ld	hl, #0x0000
	push	hl
	call	_update_cactus
	add	sp, #2
;main.c:185: update_cactus(1);
	ld	hl, #0x0001
	push	hl
	call	_update_cactus
	add	sp, #2
;main.c:186: update_cactus(2);
	ld	hl, #0x0002
	push	hl
	call	_update_cactus
	add	sp, #2
;main.c:187: update_cactus(3);
	ld	hl, #0x0003
	push	hl
	call	_update_cactus
	add	sp, #2
;main.c:188: }
	ret
;main.c:191: BYTE check_collision(struct character *character1, struct character *character2)
;	---------------------------------
; Function check_collision
; ---------------------------------
_check_collision::
	add	sp, #-16
;main.c:193: BYTE collide_x = 0;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
;main.c:194: BYTE collide_y = 0;
	xor	a, a
	inc	hl
	ld	(hl), a
;main.c:196: if (character1->x + character1->half_size > character2->x - character2->half_size)
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#8
	ld	(hl+), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl), a
	xor	a, a
	inc	hl
;c
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#14
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00144$
	bit	7, d
	jr	NZ, 00145$
	cp	a, a
	jr	00145$
00144$:
	bit	7, d
	jr	Z, 00145$
	scf
00145$:
	jr	NC, 00104$
;main.c:198: if (character1->x - character1->half_size < character2->x + character2->half_size)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
;c
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00146$
	bit	7, d
	jr	NZ, 00147$
	cp	a, a
	jr	00147$
00146$:
	bit	7, d
	jr	Z, 00147$
	scf
00147$:
	jr	NC, 00104$
;main.c:199: collide_x = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
00104$:
;main.c:201: if (character1->y + character1->half_size > character2->y - character2->half_size)
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#10
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00148$
	bit	7, d
	jr	NZ, 00149$
	cp	a, a
	jr	00149$
00148$:
	bit	7, d
	jr	Z, 00149$
	scf
00149$:
	jr	NC, 00108$
;main.c:203: if (character1->y - character1->half_size < character2->y + character2->half_size)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
;c
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00150$
	bit	7, d
	jr	NZ, 00151$
	cp	a, a
	jr	00151$
00150$:
	bit	7, d
	jr	Z, 00151$
	scf
00151$:
	jr	NC, 00108$
;main.c:204: collide_y = 1;
	ldhl	sp,	#1
	ld	(hl), #0x01
00108$:
;main.c:206: if (collide_x && collide_y)
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	inc	hl
	ld	a, (hl)
	or	a, a
;main.c:207: return 1;
;main.c:209: return 0;
	ld	e, #0x01
	jr	NZ, 00112$
00110$:
	ld	e, #0x00
00112$:
;main.c:210: }
	add	sp, #16
	ret
;main.c:213: void init_font()
;	---------------------------------
; Function init_font
; ---------------------------------
_init_font::
;main.c:216: font_init();
	call	_font_init
;main.c:218: font = font_load(font_min);
	ld	hl, #_font_min
	push	hl
	call	_font_load
	add	sp, #2
;main.c:219: font_set(font);
	push	de
	call	_font_set
	add	sp, #2
;main.c:221: score_map[0] = 0x02;
	ld	bc, #_score_map+0
	ld	a, #0x02
	ld	(bc), a
;main.c:222: score_map[1] = 0x01;
	ld	hl, #(_score_map + 0x0001)
	ld	(hl), #0x01
;main.c:223: score_map[2] = 0x01;
	ld	hl, #(_score_map + 0x0002)
	ld	(hl), #0x01
;main.c:224: score_map[3] = 0x01;
	ld	hl, #(_score_map + 0x0003)
	ld	(hl), #0x01
;main.c:225: score_map[4] = 0x01;
	ld	hl, #(_score_map + 0x0004)
	ld	(hl), #0x01
;main.c:226: score_map[5] = 0x01;
	ld	hl, #(_score_map + 0x0005)
	ld	(hl), #0x01
;main.c:227: score_map[6] = 0x01;
	ld	hl, #(_score_map + 0x0006)
	ld	(hl), #0x01
;main.c:228: score_map[7] = 0x01;
	ld	hl, #(_score_map + 0x0007)
	ld	(hl), #0x01
;main.c:229: score_map[8] = 0x01;
	ld	hl, #(_score_map + 0x0008)
	ld	(hl), #0x01
;main.c:231: set_win_tiles(0, 0, 9, 1, score_map);
	push	bc
	ld	de, #0x0109
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;C:/gbdk/include/gb/gb.h:888: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x88
	ldh	(_WY_REG+0),a
;main.c:232: move_win(7, 136);
;main.c:233: }
	ret
;main.c:235: void addScore(int amount)
;	---------------------------------
; Function addScore
; ---------------------------------
_addScore::
;main.c:237: if (score < 99)
	ld	a, (#_score)
	sub	a, #0x63
	ret	NC
;main.c:238: score += amount;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_score
	ld	c, (hl)
	add	a, c
	ld	(hl), a
;main.c:239: }
	ret
;main.c:242: void update_score()
;	---------------------------------
; Function update_score
; ---------------------------------
_update_score::
;main.c:244: if (score < 10)
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0x0a
	ld	a, #0x00
	rla
	ld	c, a
;main.c:246: set_score(score, 0);
	ld	e, (hl)
	ld	d, #0x00
;main.c:244: if (score < 10)
	ld	a, c
	or	a, a
	jr	Z, 00105$
;main.c:246: set_score(score, 0);
	ld	hl, #0x0000
	push	hl
	push	de
	call	_set_score
	add	sp, #4
;main.c:247: set_win_tiles(0, 0, 1, 1, score_map);
	ld	hl, #_score_map
	push	hl
	ld	de, #0x0101
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	ret
00105$:
;main.c:249: else if (score >= 10 && score < 100)
	bit	0, c
	ret	NZ
	ld	a, (#_score)
	sub	a, #0x64
	ret	NC
;main.c:251: set_score(score / 10, 0);
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divsint
	add	sp, #4
	ld	hl, #0x0000
	push	hl
	push	de
	call	_set_score
	add	sp, #4
;main.c:252: set_score(score % 10, 1);
	ld	hl, #_score
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	ld	hl, #0x0001
	push	hl
	push	de
	call	_set_score
	add	sp, #4
;main.c:254: set_win_tiles(0, 0, 2, 1, score_map);
	ld	hl, #_score_map
	push	hl
	ld	de, #0x0102
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;main.c:256: }
	ret
;main.c:259: void game_over()
;	---------------------------------
; Function game_over
; ---------------------------------
_game_over::
;main.c:261: set_win_tiles(0, 0, 9, 1, game_over_map);
	ld	hl, #_game_over_map
	push	hl
	ld	de, #0x0109
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;main.c:262: }
	ret
;main.c:265: void init_background()
;	---------------------------------
; Function init_background
; ---------------------------------
_init_background::
;main.c:267: set_bkg_data(38, 4, mapTile);
	ld	hl, #_mapTile
	push	hl
	ld	de, #0x0426
	push	de
	call	_set_bkg_data
	add	sp, #4
;main.c:268: set_bkg_tiles(0, 0, 40, 18, map);
	ld	hl, #_map
	push	hl
	ld	de, #0x1228
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:269: }
	ret
;main.c:272: void scroll_background()
;	---------------------------------
; Function scroll_background
; ---------------------------------
_scroll_background::
;main.c:274: if (!is_game_over)
	ld	a, (#_is_game_over)
	or	a, a
	ret	NZ
;main.c:275: scroll_bkg(max_cactus_speed_x, 0);
	ld	hl, #_max_cactus_speed_x
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:770: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, c
	ldh	(_SCX_REG+0),a
;main.c:275: scroll_bkg(max_cactus_speed_x, 0);
;main.c:276: }
	ret
;main.c:279: void init()
;	---------------------------------
; Function init
; ---------------------------------
_init::
;main.c:281: init_font();
	call	_init_font
;main.c:282: init_background();
	call	_init_background
;main.c:284: init_dino();
	call	_init_dino
;main.c:285: init_all_cactuses();
	call	_init_all_cactuses
;main.c:287: is_game_over = 0;
	ld	hl, #_is_game_over
	ld	(hl), #0x00
;main.c:288: score = 0;
	ld	hl, #_score
	ld	(hl), #0x00
;main.c:289: }
	ret
;main.c:292: void jump(struct character *character)
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
	dec	sp
;main.c:294: if (!character->is_jumping)
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00103$
;main.c:296: character->speed_y = -max_dinosaur_speed_y;
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	hl, #_max_dinosaur_speed_y
	sub	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	(de), a
;main.c:297: character->is_jumping = 1;
	ld	a, #0x01
	ld	(bc), a
;main.c:299: addScore(1);
	ld	hl, #0x0001
	push	hl
	call	_addScore
	add	sp, #2
00103$:
;main.c:301: }
	inc	sp
	ret
;main.c:302: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:304: init();
	call	_init
;main.c:306: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;main.c:307: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:309: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:310: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:313: while (TRUE)
00116$:
;main.c:316: if (joypad() & J_A || joypad() & J_B || joypad() & J_UP)
	call	_joypad
	bit	4, e
	jr	NZ, 00104$
	call	_joypad
	bit	5, e
	jr	NZ, 00104$
	call	_joypad
	bit	2, e
	jr	Z, 00105$
00104$:
;main.c:318: if (!is_game_over)
	ld	a, (#_is_game_over)
	or	a, a
	jr	NZ, 00102$
;main.c:319: jump(&dinosaur);
	ld	hl, #_dinosaur
	push	hl
	call	_jump
	add	sp, #2
	jr	00105$
00102$:
;main.c:321: init();
	call	_init
00105$:
;main.c:325: if (!is_game_over)
	ld	a, (#_is_game_over)
	or	a, a
	jp	NZ, 00114$
;main.c:327: scroll_background();
	call	_scroll_background
;main.c:328: update_score();
	call	_update_score
;main.c:330: update_dino();
	call	_update_dino
;main.c:331: update_all_cactuses();
	call	_update_all_cactuses
;main.c:334: if (check_collision(&dinosaur, &cactuses[0]) || check_collision(&dinosaur, &cactuses[1]) || check_collision(&dinosaur, &cactuses[2]) || check_collision(&dinosaur, &cactuses[3]))
	ld	hl, #_cactuses
	push	hl
	ld	hl, #_dinosaur
	push	hl
	call	_check_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00108$
	ld	hl, #(_cactuses + 0x0007)
	push	hl
	ld	hl, #_dinosaur
	push	hl
	call	_check_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00108$
	ld	hl, #(_cactuses + 0x000e)
	push	hl
	ld	hl, #_dinosaur
	push	hl
	call	_check_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	NZ, 00108$
	ld	hl, #(_cactuses + 0x0015)
	push	hl
	ld	hl, #_dinosaur
	push	hl
	call	_check_collision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00114$
00108$:
;main.c:337: character_stop(&cactuses[0], 0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #_cactuses
	push	hl
	call	_character_stop
	add	sp, #4
;main.c:338: character_stop(&cactuses[1], 0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #(_cactuses + 0x0007)
	push	hl
	call	_character_stop
	add	sp, #4
;main.c:339: character_stop(&cactuses[2], 0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #(_cactuses + 0x000e)
	push	hl
	call	_character_stop
	add	sp, #4
;main.c:340: character_stop(&cactuses[3], 0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #(_cactuses + 0x0015)
	push	hl
	call	_character_stop
	add	sp, #4
;main.c:341: character_stop(&dinosaur, 0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #_dinosaur
	push	hl
	call	_character_stop
	add	sp, #4
;main.c:343: game_over();
	call	_game_over
;main.c:344: is_game_over = 1;
	ld	hl, #_is_game_over
	ld	(hl), #0x01
00114$:
;main.c:348: performant_delay(3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_performant_delay
	inc	sp
;main.c:350: }
	jp	00116$
	.area _CODE
	.area _CABS (ABS)
