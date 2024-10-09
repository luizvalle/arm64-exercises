.text

.global _start
_start:
	// Load  X2 with 0x1234 FEDC 4F5D 6E3A
	movk x2, 0x6e3a
	movk x2, 0x4f5d, LSL #16
	movk x2, 0xfedc, LSL #32
	movk x2, 0x1234, LSL #48

	// Load X1
	mov x1, x2

	// Practice shifting
	mov x1, x2, LSL #1
	mov x1, x2, LSR #1
	mov x1, x2, ASR #1
	mov x1, x2, ROR #1

	// Repeat the above with mnemonics
	lsl x1, x2, #1
	lsr x1, x2, #1
	asr x1, x2, #1
	ror x1, x2, #1

	// Too big for immediate16, assembler will adjust
	mov x1, #0xab000000

	// Can't move, uncomment to see error
	// mov x1, #0xabcdef

	// Examble of movn
	movn w1, #45

	// Example of mov that the assembler will change to movn
	mov x1, #0xfffffffe

	// Exit the program
	mov x0, #0
	mov x8, #94
	svc 0
