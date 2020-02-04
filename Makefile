PREFIX ?= /usr
LIBDIR ?= $(PREFIX)/lib
PKGCONFIGDIR ?= $(PREFIX)/share/pkgconfig
INCLUDEDIR ?= $(PREFIX)/include

help:
	@echo "make all                   -- build binaries"
	@echo "make clean                 -- cleanup"

all:
	$(MAKE) -C vchan

install:
	install -D -m 0644 vchan/libvchan.h ${DESTDIR}$(INCLUDEDIR)/vchan-socket/libvchan.h
	install -D -m 0644 vchan/vchan-socket.pc ${DESTDIR}$(PKGCONFIGDIR)/vchan-socket.pc
	install -D vchan/libvchan-socket.so ${DESTDIR}$(LIBDIR)/libvchan-socket.so

clean:
	make -C vchan clean