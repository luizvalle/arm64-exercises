.text
.global _start
_start:
	// Calculate -2 using 2's complement
	movn w0, #2
	add w0, w0, #1

	// Exit
	mov x8, #93
	svc 0
