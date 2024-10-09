AS= /bin/as
LD= /bin/ld

.PHONY: all
all: clean printword

printword: printword.o
	$(LD) printword.o -o printword

printword.o: printword.s
	$(AS) -g printword.s -o printword.o

.PHONY: clean
clean:
	rm -rf *.o printword
