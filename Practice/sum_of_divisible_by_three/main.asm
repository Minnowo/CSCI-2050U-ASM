extern printf
extern scanf

global main 

section .bss 
    
section .data

    array dq 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
    arraySize dq 12

    string times 51 db 0
    eString times 51 db 0

    inputStringPrompt db "Enter a string: ", 0
    inputStringFormat db "%s", 0

    outputArrayFormat db "The sum of the array is %d", 0ah, 0
    outputStringFormat db "There are %d e's in '%s': '%s'.", 0xa, 0

section .text 

sumOfDivisibleByThree:

    ; rdi = size of array 
    ; rsi = array 

    mov r9, 0 ; count
    mov r11, 0 ; sum 

    getSumLoop:

        mov r10, [rsi]

        mov rdx, 0
        mov rax, r10
        mov rbx, 3
        div rbx

        cmp rdx, 0
        jne notDivisByThree

        add r11, r10

        notDivisByThree:

        inc r9
        cmp r9, rdi
        je endSumLoop

        add rsi, 8        ; IF YOU USE inc HERE IT WILL NOT WORK
        jmp getSumLoop 

    endSumLoop:

    mov rax, r11

    ret 


countEs:

    ; rdi = destination of e
    ; rsi = source string

    mov r11, 0 ; count of E's

    countELoop:

        mov al, [rsi]

        cmp al, 'e'
        jne skip

        mov [rdi], al
        inc rdi 
        inc r11 

        skip:

            inc rsi
            mov al, [rsi]
            cmp al, 0
            je endELoop

            jmp countELoop

    endELoop:

    mov rax, r11

    ret


main:

    ; sumOfDivisibleByThree(arraySize, array);
    mov rdi, [arraySize]
    mov rsi, array 
    mov rax, 0
    push rax
    call sumOfDivisibleByThree
    mov r8, rax
    pop rax

    ; printf("The sum of all elements divisible by 3 is %d.\n", sum);
    mov rdi, outputArrayFormat
    mov rsi, r8
    mov rax, 0
    push rax 
    call printf 
    pop rax





  ; printf("Enter a string: ");
    mov rdi, inputStringPrompt 
    mov rax, 0
    push rax 
    call printf 
    pop rax 

    ; scanf("%s", string);
    mov rdi, inputStringFormat
    mov rsi, string 
    mov rax, 0
    push rax 
    call scanf 
    pop rax 

    ; countEs(eString, string)
    mov rdi, eString 
    mov rsi, string 
    mov rax, 0
    push rax 
    call countEs 
    mov r8, rax
    pop rax

    ; printf("There are %d e's in '%s': '%s'.\n", count, str, eString);
    mov rdi, outputStringFormat 
    mov rsi, r8
    mov rdx, string 
    mov rcx, eString
    mov rax, 0
    push rax 
    call printf
    pop rax 


    ret 