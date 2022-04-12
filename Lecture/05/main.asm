

extern printf
extern scanf 


global main 

section .data 
 messagePrompt db "Enter a message: ", 0
 messageFormat db "%[^", 0ah, "]", 0    ; take until a new line char from user
 resultMessage db "The message in uppercase is '%s'", 0ah, 0dh, 0

section .bss 
    userInput resb 51

section .text 


main:
    ; ask the user for the prompt 
    ; printf(messagePrompt)
    mov rdi, messagePrompt
    push rbx 
    call printf 
    pop rbx 

    ; take the user input 
    ; scanf(messageFormat, userInput)
    mov rdi, messageFormat
    mov rsi, userInput 
    push rbx 
    call scanf 
    pop rbx 


    ; convert the string to uppercase 
    mov rsi, userInput ; move the pointer

    loopStart: 
        mov al, [rsi]      ; move 8 bits from rsi into al 

        cmp al, 0          ; check if the char is null
        je endLoop         ; exit loop if end of string 

        cmp al, 97         ; lowercase a
        jl skipChar        ; if less than a skip 

        cmp al, 122        ; lowercase z
        jg skipChar        ; if greater than z skip

        sub al, 32         ; subtract diff of a and A (make char upper)
        mov [rsi], al      ; set the new character 

        skipChar:

        inc rsi            ; increment by 1 character, would need to increment with the datatype of the array (1)
        jmp loopStart      ; next loop


    endLoop:

    ; print the result
    ; printf(resultMessage, userInput)
    mov rdi, resultMessage
    mov rsi, userInput
    push rbx 
    call printf 
    pop rbx 

    ret 