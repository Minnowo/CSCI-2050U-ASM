




; System V AMD64 ABI (application binary interface):
; - A calling convention used by Linux, MacOS, BSD
; - For integer or pointer aguments:
;   rdi -> first int/pointer argument
;   rsi -> second int/pointer argument
;   rdx -> third int/pointer argument
;   rcd -> fourth int/pointer argument
;   rcx -> fifth int/pointer argument
;   r8  -> sixth int/pointer argument
;   r9  -> sixth int/pointer argument
;   all remaining args passed via stack

; rsp points to the top of the stack
; when calling a function:
;   [rsp] contains the return address 
;   [rsp+8] contains the first stack param

; System V AMD64 mandates, during funciton calls, the stack address must be a multiple of 16
;   this is called stack alignment
;   many other os has the same rule
;   this means that we may often have to put padding data onto the stack to ensure this is true

; in order to make code that will be easier to move to another os
; we'll use a higher-level library called libc 
;   lib c is so named because it is literally the standard library for the c language 
;   it is simple enough to learn to use, yet higher level enough to abstract away from the os specific details

; basic output - printf
; in c, the most basic way to print a string output is `printf`
; the first arg of printf is a format string which contains a number of typed placeholders
;   each remaining arg corresponds to one of these placeholders (normally, in the same order they are in the string)
; some common types:
;   %d - decimal (i.o integer)
;   %f - floating point
;   %s - string

extern printf 

section .text 
    mov rdi, resultFormat1 ; address for format string
    mov rsi, [age]         ; value of age 
    mov rax, 0  ; set rax to 0, because the return value for printf is stored here, this is just to be clean
    push rbx    ; must align the stack to a multiple of 16 bytes; this is garbage, we don't know what is in rbx, we just push it because we need to align the stack 
    call printf ; call adds 8 bytes/64 bits to the stack -> pushes the return address for later
    pop rbx     ; remove this unnecessary stuff off of the stack

    mov rdi, resultFormat2
    mov rsi, [x]
    mov rdx, [y]
    mov rax, 0
    push rbx
    call printf
    pop rbx 

section .data
    x dq 1                   
    y dq 15                  
    age dq 19                   ; define age
    resultFormat1 db "%d", 0     ; define format string






