extern printf 
extern scanf

global main 

section .bss
    input resq 1
    

section .data 
<<<<<<< HEAD
    prompt db "Enter a number: ", 0
    getDigit db "%lli", 0
    displayStr db "[%lli] = %lli", 0ah, 0dh, 0
=======
    A dq 0 
    B dq 1
    count dq 0
    prompt db "Enter a number: ", 0
    getDigit db "%d", 0
    displayStr db "[%d] = %d", 0ah, 0dh, 0
>>>>>>> 1ad213e6fdf4b83c2b4f6206875ef25d7e6800dc

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
    
<<<<<<< HEAD
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
=======
    mov rcx, [count]
    loopStart:
        cmp rcx, [input]    
        ja endLoop     ; rcx >= input then end loop  

        ; display [count] = [A]
        mov rdi, displayStr
        mov rsi, [count]
        mov rdx, [A]
        push rbx 
        call printf
        pop rbx 

        mov rdx, [A]    ; rdx = A
        add rdx, [B]    ; rdx += B 

        mov rax, [B]
        mov [A], rax    ; A = B
        mov [B], rdx    ; B = RDX

        ; increment count by 1
        mov rcx, [count]
        inc rcx          
        mov [count], rcx

        jmp loopStart    ; start loop again 

    endLoop:
>>>>>>> 1ad213e6fdf4b83c2b4f6206875ef25d7e6800dc
    ret 