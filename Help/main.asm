extern printf 
extern scanf 
global main 

section .text
main:
;;; function param registers in order
;;;   rdi 
;;;   rsi 
;;;   rdx 
;;;   rcx 
;;;   r8  
;;;   r9  
;;;   all remaining args passed via stack

;;; good 64 bit registers 
    mov rax, 50
    mov rdi, 50
    mov rsi, 50
    mov rbx, 50
    mov rcx, 50
    mov rdx, 50
    mov r8, 50
    mov r9, 50
    mov r10, 50
    mov r11, 50
    mov r12, 50
    mov r13, 50
    mov r14, 50
    mov r15, 50

;;; good 8 bit registers
    mov al, 5
    mov ah, 5
    mov bl, 5
    mov bh, 5



    ;;; mul usage 
    ;;; a * b
    mov rdx, 0    ; remainder goes here? output goes into rax 
    mov rax, 5    ; a
    mov rcx, 10   ; b
    mul rcx       ; rax = a * b 

    ;;; printf(displayNumber, a * b);
    mov rdi, displayNumber
    mov rsi, rax
    push rax 
    call printf
    pop rax



    ;;; div usage
    ;;; a / b
    mov rdx, 0    ; remainder goes here
    mov rax, 400  ; a
    mov r8 , 10   ; b
    div r8        ; rax = a / b      (400 / 10 = 40)

    ;;; printf(displayNumber, a * b);
    mov rdi, displayNumber
    mov rsi, rax
    push rbx 
    call printf
    pop rbx
ret

;;; if you're using an array of quad words i.e (array dq 1, 2, 3, 4, 5)

section .bss 
    ;;; empty array and string
    emptyArray resq 51
    emptyString resb 51

section .data 
    ;;; define an array with the following values 
    ;;; you MUST use 'add array, 8' to increase the pointer DON'T use 'inc' because it uses dq (64bit)
    someArray dq 1, 2, 3, 4, 5, 6

    ; define empty string of 50 chars long
    someString times 51 db 0

    displayNumber db "%d", 0ah, 0dh, 0
    displayString db "%s", 0ah, 0dh, 0



