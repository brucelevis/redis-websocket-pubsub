CC = clang
CFLAGS = -Wall -Wextra -Werror -Wformat -Wformat-security -Werror=format-security -D_FORTIFY_SOURCE=2 -fstack-protector-strong -pedantic -std=c11 $(shell pkg-config --cflags hiredis) $(shell pkg-config --cflags libevent)
LDFLAGS = $(shell pkg-config --libs hiredis) $(shell pkg-config --libs libevent)

.PHONY: all clean

all: test-pubsub test-http test-base64

clean:
	-rm -f *.o test-pubsub

test-base64: test-base64.o base64.o
test-http: test-http.o http.o lexer.o uri.o
test-pubsub: test-pubsub.o base64.o http.o lexer.o uri.o
