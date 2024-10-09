// Defines a function that converts null-terminated strings to upper-case
//
// Args:
//	x0: Address of the first character in the input string
//	x1: Address of the start of the buffer to place the output
// Ret:
//	x0: Length of the string
//
// Other registers used:
//	x4: Copy of x1 used for length calculation
//	w5: Current character being processed

.text

.global toupper

toupper:
	str lr, [sp, #-16]!
	mov x4, x1
loop:
	ldrb w5, [x0], #1  // Read the current character
	// Is it the null character
	cmp w5, #0
	b.eq exit_loop
	// If w5 < 'a', not a lower-case character
	cmp w5, #'a'
	b.lt store_character
	// If w5 > 'z', not a lower-case character
	cmp w5, #'z'
	b.gt store_character
	// Lower-case character
	add w5, w5, #('A' - 'a')
store_character:
	strb w5, [x1], #1
	b loop
exit_loop:
	sub x0, x1, x4
	ldr lr, [sp], #16
	ret
