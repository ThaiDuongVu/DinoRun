#!/bin/bash

/mnt/c/gbdk/bin/lcc.exe -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o ./bin/main.o main.c
/mnt/c/gbdk/bin/lcc.exe -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -o ./bin/main.gb ./bin/main.o
./bin/main.gb
