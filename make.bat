C:/gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o ./bin/main.o main.c
C:/gbdk/bin/lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -o ./bin/main.gb ./bin/main.o
start ./bin/main.gb
