extern printf
extern exit

global main

section .text

main:
  ; printf("Hello, world!\n");
  ; setup for the syscall printf 
  ; list of sys calls for linux http://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
  mov rdi, message
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; exit(0)
  mov rax, 0
  call exit

section .data
    message db "Hello, world!", 0ah, 0dh, 0
    ; db -> byte
    greeting db "hello", 0 
    ; dq -> qword -> long
    count dq 0
    ; dq -> qword -> long
    list dq 1,2,3,4,5,6,7,8,9,10

section .bss 
    
    ; resB -> b meaning byte 
    firstName resb 50 ; a byte array of 50

    ; resQ -> q meaning quad (qword -> long)
    age resq 1 ; a single qword

    ; resQ -> qmeaning quad 
    grades resq 10 ; a qword array of 10 
