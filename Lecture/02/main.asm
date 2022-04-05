extern printf 
extern scanf
extern exit 

global main 

section .text 

main: 
    ; ask the user for a number 
    mov rdi, formatString1
    mov rax, 0 
    mov rbx, 0 
    push rbx
    call printf 
    pop rbx

    ; take user input into 'input'
    mov rdi, formatString2
    mov rsi, input          ; scanf wants the second value by ref, do not use []
    mov rax, 0 
    mov rbx, 0 
    push rbx
    call scanf 
    pop rbx 

    ; this is regsiter direct
    ; add 24 to the number the user input 
    mov rax, [input]
    add rax, 24         ; add 24 to the value in the rax register 
    mov [input], rax    ; move the result of input + 24 back into input 

    ; this is register indirect, rax contains a pointer
    ; and we can set the value at the poitner using 'mov qword [rax], rdi'
    ; add another 24 to the input 
    mov rax, input
    mov rdi, [input]
    add rdi, 24
    mov qword [rax], rdi 

    ; multiple the input by 5 
    ; rdx and rax are considered 1 value
    ; the output of imul will be split between rdx and rax 
    mov rdx, 0          
    mov rax, [input]
    mov rcx, 5
    imul rcx            ; multiply rdx:rax with the value of rcx, this is for 2 signed int 
    mov [input], rax 

    ; divide the input by 2
    ; rdx and rax are considered 1 value
    ; the output of idiv will be split between rdx and rax 
    mov rdx, 0 
    mov rax, [input]
    mov rcx, 2
    idiv rcx           ; divide rdx:rax with the value of rdx 
    mov [input], rax 

    ; display the number gotten from the user
    mov rdi, formatString3
    mov rsi, [input]
    mov rax, 0 
    mov rbx, 0 
    push rbx
    call printf 
    pop rbx

    ; exit(0), this follows a different syntax for being called 
    ; call exit 

    ret 

section .bss
    input resq 1

section .data 
    formatString1 db "Input a number: ", 0 

    formatString2 db "%d", 0 ; if you add 0ah and 0dh, it scanf will try and take 2 inputs 

    formatString3 db "The result of your (((number + 24 + 24) * 5) / 2) was: %d", 0ah, 0dh, 0
