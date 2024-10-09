// Print the contents of a register to stdout as a hex number
//
// Registers:
//	x0-x2: Parameters to Linux system calls
//	x1: Also the address of the byte we are writing
//	x4: Register to print
//	w5: Loop index
//	w6: Current character
//	x8: Linux function number


.text

.global _start

_start:
	// Number to print
	movz x4, #0x6e3a
	movk x4, #0x4f5d, LSL #16
	movk x4, #0xfedc, LSL #32
	movk x4, #0x1234, LSL #48

	ldr x1, =hexstr  // start of the string
	add x1, x1, #17  // Last digit

	// For w5 = 16 to 0
	movz w5, #16  // 16 digits to print
loop:
	and w6, w4, #0xf  // Mask out the upper order bits
	// If w6 >= 10, then goto letter
	cmp w6, #10
	b.ge letter
	// Else it's a number
	add w6, w6, #'0'
	b end_if
letter:
	add w6, w6, #('a' - 10)
end_if:
	strb w6, [x1], #-1
	mov x4, x4, LSR #4
	subs w5, w5, #1
	b.ne loop

	mov x0, #1  // Print to stdout
	ldr x1, =hexstr  // String to print
	// Length of the string
	ldr x2, =hexstr_len
	ldrb w2, [x2]
	movz x8, #64  // Linux write system call
	svc 0

	// Prepare to exit
	mov x0, #0  // Success exit code
	mov x8, #93  // Linux exit system call
	svc 0
		

.data
hexstr: .asciz "0x123456789abcdefg\n"  // Space for 16 ASCII charaters + 0x at the beginning + a new line
hexstr_len: .byte 19
