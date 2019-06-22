global imprime_matriz
segment .data
    fnt db "%d ", 0
    nl db 0
segment .text
extern printf
extern puts
imprime_matriz:
    ;variaveis da funcao
    xor r12, r12
    xor r13, r13
    
    ;parametros da funcao
    mov rbx, rdi
    mov r14, rsi
    mov r15, rdx

    l1:
        cmp r12, r14
        je fim_i
    
        l2: 
            cmp r13, r15
            je fim_j

            mov rax, r14
            mul r12
            add rax, r13

            ; printf
            sub rsp, 8 
            mov rdi, fnt      
            mov rsi, [rbx+rax*4]
            call printf
            add rsp, 8

            inc r13
            jmp l2
    
        fim_i:
            leave
            ret
    
        fim_j:
            ;puts para quebra de linha
            mov rdi, nl
            call puts

            xor r13, r13
            inc r12
            jmp l1
