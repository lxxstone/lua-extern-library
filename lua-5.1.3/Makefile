LUA_LIB= liblua.so

LUA_T=  lua

CORE_O= lapi.c lcode.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c \
        lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c  \
        lundump.c lvm.c lzio.c
LIB_O=  lauxlib.c lbaselib.c ldblib.c liolib.c lmathlib.c loslib.c ltablib.c \
        lstrlib.c loadlib.c linit.c

ALL_T= $(LUA_LIB) $(LUA_T)

all:	$(ALL_T)

linux:
	$(MAKE) all MYCFLAGS=-DLUA_USE_LINUX MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"

liblua.so:$(CORE_O) $(LIB_O)
	g++ $^ -o $@ -shared -fPIC -DLUA_USE_LINUX -Wl,-E -ldl -lreadline -lhistory -lncurses
lua:
	g++ lua.c -o lua -L. -llua
.PHONY:clean

clean:
	rm -f lua liblua.so
