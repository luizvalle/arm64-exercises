// Converts all the characters in a string to their upper case versions.
//
// x0-x2: Parameters to Linux system calls
// x3: address of the output string
// x4: address of the input string
// w5: current character being processed
// x8: Linux system call function number


.text

.global _start

_start:
	ldr x3, =outstr  // Address of the output string
	ldr x4, =instr  // Address of the input string
loop:
	ldrb w5, [x4], #1
	// If w5 is the null character, we reached the end of the string
	cmp w5, #0
	b.eq exit_loop
	// If w5 < 'a', then not a lower case character
	cmp w5, #'a'
	b.lt store_character
	// If w5 > 'z', then not a lower case character
	cmp w5, #'z'
	b.gt store_character
	// The character is a lower case character
	add w5, w5, #('A' - 'a')  // Convert the character to upper case
store_character:
	strb w5, [x3], #1
	b loop
exit_loop:
	// Print the upper case string
	movz x0, #1  // Stdout
	ldr x1, =outstr  // Pointer to the beginning of the string
	sub x2, x3, x1  // Length of the string: end - start
	movz x8, #64
	svc 0

	// Exit the programm
	movz x0, #0  // Successful exit code
	movz x8, #93  // Linux exit system call
	svc 0


.data

instr: .asciz "This is the Test string we will convert.\n"
outstr: .space 255
