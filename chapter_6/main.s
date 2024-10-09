// Converts all the characters in a string to their upper case versions.
//
// x0-x2: Parameters to functions
// x8: Linux system call function number


.text

.include "toupper_macro.s"

.global _start

_start:
	toupper_macro instr, outstr
	// Commented out the function call to test the macro
	// // Call toupper
	// ldr x0, =instr  // Address of the input string
	// ldr x1, =outstr  // Address of the output string
	// bl toupper

	// Print the upper case string
	mov x2, x0  // Store the length of the string returned by the functuion
	movz x0, #1  // Stdout
	ldr x1, =outstr  // Pointer to the beginning of the string
	movz x8, #64
	svc 0

	// Exit the programm
	movz x0, #0  // Successful exit code
	movz x8, #93  // Linux exit system call
	svc 0


.data

instr: .asciz "This is the Test string we will convert.\n"
outstr: .space 255
