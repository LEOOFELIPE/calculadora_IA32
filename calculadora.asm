section .data:

    title     db 10, '*************', 10, '|CALCULADORA|', 10, '*************', 0
    len_title equ $ - title

    break_line     db 10,0
    len_break_line equ $ - break_line

    opc1     db 10, '1 - Soma', 0
    len_opc1 equ $ - opc1
    opc2     db 10, '2 - Subtração', 0
    len_opc2 equ $ - opc2
    opc3     db 10, '3 - Multiplicação', 0
    len_opc3 equ $ - opc3
    opc4     db 10, '4 - Divisão', 0
    len_opc4 equ $ - opc4
    opc5     db 10, '5 - Potenciação', 0
    len_opc5 equ $ - opc5
    opc6     db 10, '6 - Fatorial', 0
    len_opc6 equ $ - opc6
    opc7     db 10, '7 - Sair', 0
    len_opc7 equ $ - opc7
    question db 10, 'O que deseja fazer ?', 0
    len_question equ $ - question
    msg_dig1 db 10, 'Digite um digito ', 0
    len_msg_dig1 equ $ - msg_dig1
    msg_dig2 db 10, 'Digite outro digito ', 0
    len_msg_dig2 equ $ - msg_dig2
    

section .bss

    user_option  resb 2
    result       resb 1
    operando1    resb 2
    operando2    resb 2

section .text

    global _start

_start:
    call menu
    call get_option_user
    jmp exit

menu:
    
    call in_title
    call n_line
    call option_one
    call n_line
    call option_two
    call n_line
    call option_three
    call n_line
    call option_four
    call n_line
    call option_five
    call n_line
    call option_six
    call n_line
    call option_seven
    call n_line
    ret


in_title:
    mov ecx, title
    mov edx, len_title
    mov eax, 4
    mov ebx, 0
    int 80h
    ret

option_one:
    mov ecx, opc1
    mov edx, len_opc1
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

option_two:
    mov ecx, opc2
    mov edx, len_opc2
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

option_three:
    mov ecx, opc3
    mov edx, len_opc3
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

option_four:
    mov ecx, opc4
    mov edx, len_opc4
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

option_five:
    mov ecx, opc5
    mov edx, len_opc5
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

option_six:
    mov ecx, opc6
    mov edx, len_opc6
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

option_seven:
    mov ecx, opc7
    mov edx, len_opc7
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

get_option_user:
    ;Pega escolha do usuario
    call in_question
    call n_line
    ;Recebe a resposta do usuário
    mov eax, 3
    mov ebx, 0
    mov ecx, user_option
    mov edx, 1
    int 80h

    ; Transforma ASCI em número (só funciona de 0 a 9)
    mov eax, 0
    mov eax, [user_option]
    sub eax, 0x30
    call operations
    ret


operations:
    cmp eax, 1
    je SOMA
    cmp eax, 2
    je SUB
    cmp eax, 3
    je MUL
    cmp eax, 4
    je DIV
    cmp eax, 5
    je POT
    cmp eax, 6
    je FAT
    cmp eax, 7
    je exit
    ret

SOMA:
    ;msg1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_dig1
    mov edx, len_msg_dig1

    mov eax, 3
    mov ebx, 0
    mov ecx, operando1
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_dig2
    mov edx, len_msg_dig2

    mov eax, 3
    mov ebx, 0
    mov ecx, operando2
    mov edx, 2
    int 80h

    ; Transforma ASCI em número (só funciona de 0 a 9)
    mov eax, [operando1]
    sub eax, 0x30
    mov ebx, [operando2]
    sub ebx, 0x30
    
    add eax, ebx
    add eax, 0x30
    
    mov [result], eax

    ;imprimir 
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 80h
    ret 

SUB:
    ;msg1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_dig1
    mov edx, len_msg_dig1

    mov eax, 3
    mov ebx, 0
    mov ecx, operando1
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_dig2
    mov edx, len_msg_dig2

    mov eax, 3
    mov ebx, 0
    mov ecx, operando2
    mov edx, 2
    int 80h

    ; Transforma ASCI em número (só funciona de 0 a 9)
    mov eax, [operando1]
    sub eax, 0x30
    mov ebx, [operando2]
    sub ebx, 0x30
    
    sub eax, ebx
    add eax, 0x30
    
    mov [result], eax

    ;imprimir 
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 80h
    ret 
MUL:
    ;msg1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_dig1
    mov edx, len_msg_dig1

    mov eax, 3
    mov ebx, 0
    mov ecx, operando1
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_dig2
    mov edx, len_msg_dig2

    mov eax, 3
    mov ebx, 0
    mov ecx, operando2
    mov edx, 2
    int 80h

    ; Transforma ASCI em número (só funciona de 0 a 9)
    mov eax, [operando1]
    sub eax, 0x30
    mov ebx, [operando2]
    sub ebx, 0x30
    
    mul ebx
    add eax, 0x30
    
    mov [result], eax

    ;imprimir 
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 80h
    ret 
DIV:
    ;msg1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_dig1
    mov edx, len_msg_dig1

    mov eax, 3
    mov ebx, 0
    mov ecx, operando1
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_dig2
    mov edx, len_msg_dig2

    mov eax, 3
    mov ebx, 0
    mov ecx, operando2
    mov edx, 2
    int 80h

    ; Transforma ASCI em número (só funciona de 0 a 9)
    mov eax, [operando1]
    sub eax, 0x30
    mov ebx, [operando2]
    sub ebx, 0x30
    
    div ebx
    add eax, 0x30
    
    mov [result], eax

    ;imprimir 
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 80h
    ret 
POT:
    call option_five
    call n_line
    ret
FAT:
    call option_six
    call n_line
    ret
in_question:
    mov ecx, question
    mov edx, len_question
    mov eax, 4
    mov ebx, 0
    int 80h
    ret
n_line:
    mov ecx, break_line
    mov edx, len_break_line
    mov eax, 4
    mov ebx, 0
    int 80h
    ret

msg_out:

    mov eax, 4
    mov ebx, 0
    int 80h
    ret

exit:

    mov eax, 1
    mov ebx, 0
    int 80h