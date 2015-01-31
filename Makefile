
VERSION=1.7-noexec

UUCP_LOCK_DIR=/var/lock

# CC = gcc
CPPFLAGS=-DVERSION_STR=\"$(VERSION)\" \
         -DUUCP_LOCK_DIR=\"$(UUCP_LOCK_DIR)\" 
CFLAGS = -Wall -g

# LD = gcc
LDFLAGS =
LDLIBS =

picocom : picocom.o term.o
	$(CC) $(LDFLAGS) -o picocom picocom.o term.o $(LDLIBS)

picocom.o : picocom.c term.h
	$(CC) $(CPPFLAGS) -c picocom.c

term.o : term.c term.h
	$(CC) $(CPPFLAGS) -c term.c

doc : picocom.8

clean:
	rm -f picocom.o term.o
	rm -f *~

distclean: clean
	rm -f picocom

realclean: distclean
