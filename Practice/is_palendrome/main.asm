extern printf
extern scanf 

global main 

section .bss 
    input resb 51

section .data

    prompt db "Enter a string: ", 0

    input_p db "%s", 0

    is_palindrome_message db "The string is a palindrome", 0ah, 0dh, 0
    is_not_palindrome_message db "The string is not a palindrome", 0ah, 0dh, 0

section .text 

main:

    ; printf(prompt);
    mov rdi, prompt
    mov rax, 0
    push rax
    call printf
    pop rax 

    mov rdi, input_p
    mov rsi, input
    push rax
    call scanf 
    pop rax 

    mov r8, input  ; pointer start
    mov r9, input  ; pointer end 

    count_string_length_loop: ; increase the pointer of r9 until the end of the string

        mov al, [r9]
        cmp al, 0
        je end_count_loop

        inc r9
        jmp count_string_length_loop

    end_count_loop:
        dec r9     ; decrease the pointer by 1 so it's value isn't 0

    check_palindrome_loop:
        
        mov al, [r8] ; use 8bit register to compare char
        mov bl, [r9] 

        cmp al, bl      ; if not equal it's not palindrome
        jne is_not_palindrome

        inc r8 ; increase front pointer
        dec r9 ; decrease back pointer
        
        cmp r8, r9 ; check if the front and back are equal or past eachother
        jge is_palindrome

        jmp check_palindrome_loop ; keep loopin

    is_palindrome:
        ; printf(is_palindrome_message);
        mov rdi, is_palindrome_message
        push rbx
        call printf
        pop rbx
        jmp endProgram

    is_not_palindrome:
        ; printf(is_not_palindrome_message);
        mov rdi, is_not_palindrome_message
        push rbx
        call printf
        pop rbx

    endProgram:

        ret 