global imprime_matriz
segment .data
    fnt db "%.2lf ", 0
    nl db 0

segment .text
extern printf
extern puts

imprime_matriz:
    ;variaveis da funcao
    xor r12, r12
    xor r13, r13
    
    ; parametros da funcao
    mov rbx, rdi ;rbx
    mov r14, rsi ;r14
    mov r15, rdx ;r15

    l1:
        cmp r12, r14
        je fim_i
    
        l2: 
            cmp r13, r14
            je fim_j

            mov rax, r14
            mul r12
            add rax, r13

            sub rsp, 8 

            ;printf
            mov rdi, fnt      
            movss xmm0, [rbx+rax*4]
            cvtss2sd xmm0, xmm0
            mov rax, 1
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
