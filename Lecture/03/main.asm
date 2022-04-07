extern printf 
extern scanf

global main 

section .bss
    input resq 1
    

section .data 
    A dq 0 
    B dq 1
    count dq 0
    prompt db "Enter a number: ", 0
    getDigit db "%d", 0
    displayStr db "[%d] = %d", 0ah, 0dh, 0

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
    ret 