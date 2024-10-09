AS = /bin/as
LD = /bin/ld

.PHONY: all
all: clean toupper

toupper: main.o toupper.o
	$(LD) main.o toupper.o -o toupper

main.o: main.s
	$(AS) -g main.s -o main.o

toupper.o: toupper.s
	$(AS) -g toupper.s -o toupper.o

.PHONY: clean
clean:
	rm -rf *.o toupper
