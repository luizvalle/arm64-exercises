.text

.global _start
_start:
	mov x0, #1  // Stdout
	ldr x1, =msg
	mov x2, #12
	mov x8, #64  // Write system call
	svc 0  // Trigger the system call

	mov x0, #0  // Return code of the program (success)
	mov x8, #93  // Exit system call
	svc 0

.data
msg: .ascii "Hello World\n"
