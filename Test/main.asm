extern printf
extern scanf
extern exit

global main

section .text

main:
  mov rcd, 5
  mov r8, 5
  mov r9, 10

  cmp r8, r9

  jl owo

  uwu:
    mov rdi, message1
    push rbx
    call printf 
    pop rbx 

  jmp end_prog

  owo:
    mov rdi, message2
    push rbx
    call printf 
    pop rbx 

  end_prog:

  ret

section .data
  namePrompt db "What is your name? ", 0
  nameFormat db "%s", 0

  agePrompt db "How old are you? ", 0
  ageFormat db "%d", 0

  age_in_dog_years dq 0
  age_in_2100 dq 0

  message1 db "uwu", 0ah, 0dh, 0
  message2 db "owo", 0ah, 0dh, 0

section .bss
    name resb 51
    age resq 1