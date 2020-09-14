   .cpu cortex-m0
   .text
   .align 1
   .global print_asciz

print_asciz:
   push { r5, lr }
   mov  r5, r0
loop: 
   ldrb r0, [ r5 ]
   add  r0, r0, #0
   beq  done
   bl   uart_put_char
   add  r5, r5, #1
   b    loop
done: 
   pop  { r5, pc }

	.data
text:
	.asciz "Hello world, the ANSWER is 42! @[]`{}~\n"
	
	.cpu cortex-m0
	.text
	.align 1
	.global application

application:
	push {lr}
	ldr r0, = text
	bl print_asciz
	pop {pc}