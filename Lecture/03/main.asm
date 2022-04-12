extern printf 
extern scanf

global main 

section .bss
    input resq 1
    

section .data 
    prompt db "Enter a number: ", 0
    getDigit db "%lli", 0
    displayStr db "[%lli] = %lli", 0ah, 0dh, 0

section .text 

main:
    ; prompt user to enter a number 
    mov rdi, prompt 
    push rbx 
    call printf 
    pop rbx 

    ; read the user's response as an int 
    mov rdi, getDigit
    mov rsi, input 
    push rbx 
    call scanf 
    pop rbx 

    ; calc the nth fib number 
    
    mov rdx, [input] ; n
    mov rax, 0       ; count
    mov r11, 0       ; previous
    mov r12, 1       ; curent fib

    cmp rdx, 0
    jl exitProgram

    nextFib:
        ; check if the loop should end
        cmp rax, rdx
        je endLoop

        mov r8, r12  ; save current value 
        add r12, r11 ; add a + b
        mov r11, r8  ; set the previous value 

        inc rax      ; increment counter 

        jmp nextFib  ; begin next loop

    endLoop:

        ; printf 
        mov rdi, displayStr
        mov rsi, rax
        mov rdx, r11
        push rbx
        call printf
        pop rbx 

    exitProgram:
    ret 