extern printf 

global main 

section .text 

section .data 
    formatString db "%s", 0
    helloWorld db "Hello world!!!", 0ah, 0dh, 0

main:

    mov rdi, formatString
    mov rsi, helloWorld
    mov rax, 0
    push rax
    call printf
    pop rax 

    ret 