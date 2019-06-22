global escreve_arquivo
segment .data
    mode db "w+", 0
    fn   db "%.2lf ", 0
    nl   db 10, 0
    fd   dq 0
segment .text
extern fopen
extern fprintf
escreve_arquivo:
    ; variaveis da funcao
    xor r12, r12
    xor r13, r13
    
    ; parametros da funcao
    mov rbx, rdi
    mov r14, rsi
    mov r15, rdx

    ; fopen
    lea rdi, [rcx]
    lea rsi, [mode]
    call fopen
    mov [fd], rax

    l1:
        cmp r12, r14
        je fim_i
    
        l2: 
            cmp r13, r15
            je fim_j

            mov rax, r14
            mul r12
            add rax, r13

            ;fprintf para elementos da matriz
            sub rsp, 8 
            mov rdi, [fd]
            mov rsi, fn
            movss xmm0, [rbx+rax*4]
            cvtss2sd xmm0, xmm0
            call fprintf
            add rsp, 8

            inc r13
            jmp l2
    
        fim_i:
            leave
            ret
    
        fim_j:
            ;fprintf para quebra de linha
            sub rsp, 8
            mov rdi, [fd]
            mov rsi, nl
            call fprintf
            add rsp, 8

            xor r13, r13
            inc r12
            jmp l1
