extern printf

global main

section .text 

main:
  mov rdi, greeting
  mov rax, 0 ; unnecessary, but I like to clear out the register for return values
  mov rbx, 0 ; unnecessary, but if it makes you feel better :)
  push rbx
  call printf
  pop rbx

  ret

section .data
  greeting db "Hello, world!", 0ah, 0dh, 0  