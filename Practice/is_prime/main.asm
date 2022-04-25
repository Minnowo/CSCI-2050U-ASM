extern printf
extern scanf 

global main 

section .bss 
    input dq 1

section .data 

    prompt db "Enter a number: ", 0
    intput_string db "%d", 0

    is_prime_msg db "The number is prime", 0ah, 0dh, 0
    is_not_prime_msg db "The number is not prime", 0ah, 0dh, 0

section .text 

main:

    ; printf(prompt);
    mov rdi, prompt
    mov rbx, 0
    push rbx 
    call printf
    pop rbx 

    ; scanf(intput_string, input);
    mov rdi, intput_string
    mov rsi, input
    push rbx
    call scanf
    pop rbx 

    mov r8, 2        ; start loop at
    mov r9, [input]  ; number 

    divloop:

        mov rdx, 0  ; remainder goes in here after div
        mov rax, r9 ; we want r9 / r8 so put r9 into rax
        div r8      ; r9 / r8, then put result in rax, and remainder in rdx

        cmp rdx, 0     ; check if the remainder is 0
        je isNotPrime  ; if the remainder is 0, the number is not prime 

        inc r8      ; increase the number
        cmp r8, r9  ; check if equal to the input
        jl divloop  ; if the number is less than the input continue the loop

    isPrime:
        ; printf(is_prime_msg);
        mov rdi, is_prime_msg
        push rbx
        call printf
        pop rbx
        jmp endProgram

    isNotPrime:
        ; printf(is_not_prime_msg);
        mov rdi, is_not_prime_msg
        push rbx
        call printf
        pop rbx
        
    endProgram:

    ret 