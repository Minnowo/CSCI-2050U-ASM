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

    ; divide by 2 to determine even 
    mov rax, [input]
    mov rdx, 0
    mov rbx, 2
    idiv rbx ; RDX:RAX / RBX = input / 2 => quotient goes into RAX, remainder goes int RDX

    ; check if the remainder is 0 to determine if number is even or odd 
    cmp rdx, 0 
    jne isOdd ; if not 0 goto isOdd

    isEven:
        mov rdi, evenString
        mov rsi, [input]
        mov rax, 0 
        mov rbx, 0 
        push rbx
        call printf 
        pop rbx

    jmp end_if  ; skip over the isOdd 

    isOdd:

        mov rdi, oddString
        mov rsi, [input]
        mov rax, 0 
        mov rbx, 0 
        push rbx
        call printf 
        pop rbx

    end_if:

    ret 

section .bss
    input resq 1

section .data 
    formatString1 db "Input a number: ", 0 

    formatString2 db "%d", 0 ; if you add 0ah and 0dh, it scanf will try and take 2 inputs 

    evenString db "The number %d is even.", 0ah, 0dh, 0
    oddString db "The number %d is odd.", 0ah, 0dh, 0
