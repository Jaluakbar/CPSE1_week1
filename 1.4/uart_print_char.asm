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
   bl   letter_case_conv
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

   .cpu cortex-m0
   .text
   .align 2
   .global letter_case_conv

letter_case_conv:
	push {r5,lr}
	mov r2, #'A'
	mov r3, #'a'
	mov r4, #'Z'
	mov r5, #'z'
	
	sub r1,r0,r2
	BLT back
	
	sub r1,r0,r3
	BGT to_upper
	
	sub r1,r0,r4
	BLT to_lower

to_upper:
	sub r1,r0,r5
	BGT back
	sub r0,r0,r3
	add r0,r0,r2
	b back
to_lower:
	sub r1,r0,r4
	BGT back
	add r0,r0,#32
	b back
back:
	pop {r5,pc}