extern printf
extern scanf

global main 

GetFib:

    ; rdi = nth fib
    ; rsi = array for output

    mov r9, 0   ; last fib
    mov r10, 1  ; current fib
    mov r11, 0  ; index

    mov [rsi], r9
    add rsi, 8
    mov [rsi], r10
    add rsi, 8
    add r11, 2

    fibLoop:
        cmp r11, rdi
        je endFibLoop

        mov r12, r10
        add r10, r9
        mov r9, r12

        mov [rsi], r10
        add rsi, 8

        inc r11
        jmp fibLoop

    endFibLoop:
        mov rax, 0
        ret 

main:

    ; printf
    mov rdi, prompt
    push rax
    call printf
    pop rax 

    ; scanf 
    mov rdi, readNum
    mov rsi, input
    push rax
    call scanf
    pop rax 

    mov rdi, [input]
    mov rsi, array
    push rax
    call GetFib
    pop rax 


    mov r14, array
    mov r12, [input]
    mov r13, 0

    printLoop:

        cmp r13, r12
        je endProgram 

        mov rdi, printNum
        mov rsi, [r14]
        push rax
        call printf
        pop rax 


        add r14, 8
        add r13, 1

        jmp printLoop

    endProgram:
        ret

section .bss 
    array resq 51
    input resq 1

section .text 
    loopCount dq 0
    prompt db "Enter a number: ", 0
    readNum db "%d", 0
    printNum db "%d ", 0