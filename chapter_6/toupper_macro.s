// Macro implementation of toupper
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
//
// Labels:
// 	label 1: loop
// 	label 2: store_character
// 	label 3: exit_loop

.MACRO toupper_macro, instr, outstr
	ldr x0, =\instr
	ldr x1, =\outstr
	mov x4, x1
1:
	ldrb w5, [x0], #1  // Read the current character
	// Is it the null character
	cmp w5, #0
	b.eq 3f
	// If w5 < 'a', not a lower-case character
	cmp w5, #'a'
	b.lt 2f
	// If w5 > 'z', not a lower-case character
	cmp w5, #'z'
	b.gt 2f
	// Lower-case character
	add w5, w5, #('A' - 'a')
2:
	strb w5, [x1], #1
	b 1b
3:
	sub x0, x1, x4
.ENDM
