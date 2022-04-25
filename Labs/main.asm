extern printf
extern scanf
global main 

section .text 

section .bss 
    

section .data 
    name resb 51
    age resq 1

    scanfInput1 db "%s", 0 
    scanfInput2 db "%d", 0

    prompt1 db "Enter your name: ", 0
    prompt2 db "Enter your age: ", 0

    outputString1 db "%s is %d dog years old.", 0ah, 0dh, 0
    outputString2 db "%s will be %d years old in the year 2100.", 0ah, 0dh, 0

    currentYears_To_2100 dq 78

main: 

    ; printf(prompt1);
    ; > Enter you name: 
    mov rdi, prompt1
    push rbx
    call printf 
    pop rbx 

    ; scanf(scanfInput1, name);
    mov rdi, scanfInput1
    mov rsi, name
    push rbx 
    call scanf
    pop rbx 

    ; printf(prompt2);
    ; > Enter you age: 
    mov rdi, prompt2
    push rbx
    call printf 
    pop rbx 

    ; scanf(scanfInput2, age);
    mov rdi, scanfInput2
    mov rsi, age
    push rbx 
    call scanf
    pop rbx 


    ; printf(outputString1, name, (*age) * 7);
    mov rdi, outputString1         ; set the output format string (has 2 params, name, age)
    mov rsi, name                  ; pointer because char array = string
    mov rdx, [age]                 ; want value of age not pointer 
    imul rdx, 7                    ; multiple the age by 7 for dog years
    push rbx                       ; 16 bit stack align
    call printf                    ; invoke function
    pop rbx                        ; gotta remove from stack
    
    ; printf(outputString2, name, (*age) + (*currentYears_To_2100));
    mov rdi, outputString2          ; set the output format string (has 2 params, name, age)
    mov rsi, name                   ; pointer because char array = string
    mov rdx, [age]                  ; want value of age not pointer
    add rdx, [currentYears_To_2100] ; add (2100 - 2022) to the given age to calculate future age
    push rbx                        ; 16 bit stack align
    call printf                     ; invoke function
    pop rbx                         ; gotta remove from stack

    ret