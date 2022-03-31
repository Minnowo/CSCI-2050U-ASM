section .data ; tells assembler where the data is 
    message db "This is a message from Linux assembly!", 0ah, 0dh, 0

section .text ; tells assembler where the instructions are 

; global _start 

global main
; list of sys calls for linux http://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/

; _start:
main:
    mov rax, 1       ; syscall number for sys_write()
    mov rdi, 1       ; standard output
    mov rsi, message ; what to print
    mov rdx, 40      ; how many characters to print
    syscall 

    mov rax, 60 ; syscall number for sys_exit()
    mov rdi, 0  ; exit code (0 means success)
    syscall 
