AS = /bin/as
LD = /bin/ld

.PHONY: all
all: clean toupper

toupper: toupper.o
	$(LD) toupper.o -o toupper

toupper.o: toupper.s
	$(AS) -g toupper.s -o toupper.o

.PHONY: clean
clean:
	rm -rf *.o toupper
