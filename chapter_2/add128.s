// Example program that adds two 64-bit numbers and stores the
// result in a 128-bit number.
// First number:
//	0x0000 0000 0000 0003 ffff ffff ffff ffff
// Second number:
//	0x0000 0000 0000 0005 0000 0000 0000 0001
.global _start
_start:
	// Load the first number, will be in registers 2 and 3
	movz x2, #0x3
	mov x3, #0xffffffffffffffff  // Will be converted to a `movn x3, #0x0`
	
	// Load the second number, will be in registers 4 and 5
	movz x4, #0x5
	movz x5, #0x1

	// Add
	adds x1, x3, x5
	adc x0, x2, x4 // Exit code will be the higher order 64 bits truncated to 1 byte

	// Exit
	mov x8, #93
	svc 0
	
