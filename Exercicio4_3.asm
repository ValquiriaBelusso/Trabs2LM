global quadrado
segment .data
    fnt db "%f ", 0 
    z dd 0.00  
extern printf
segment .text
quadrado:
    push rbp
    mov rbp, rsp
    
    ; checa linhas
    xor r14d, r14d
    mov edx, 0
    call soma_linha
    movss xmm3, xmm0
    
    ; Como são um numero arbitrario de linhas e cols
    for:
        cmp r14d, esi
        je fim
		
        mov edx, r14d
        call soma_linha
        ucomiss xmm3, xmm0
        jne erro
			
        mov edx, r14d
        call soma_coluna
        ucomiss xmm3, xmm0
        jne erro
        inc r14d
        jmp for
        
    fim:
    
    ; Checa as diagonais (Sempre só tem uma diag princ e uma sec)
    call soma_diagonal_principal
    ucomiss xmm3, xmm0
    jne erro
		
    call soma_diagonal_secundaria
    ucomiss xmm3, xmm0
    jne erro				
			
    mov eax, 1
    leave
    ret  
    
    erro:
        mov eax, 0
        leave
        ret
    
soma_linha:
    push rbp
    mov rbp, rsp
    
    movss xmm0, [z] ;zera xmm0
    
    mov rax, rdx ; rax=i
    mov rbx, rsi 
    mul rbx
    mov r12, rax
    add r12, rsi ; r12=i_max
    
    laco_i: 
        cmp rax, r12
        je fim_i        
        movss xmm1, [rdi+rax*4]
        addss xmm0, xmm1
        inc rax
        jmp laco_i
    
    fim_i:
        leave
        ret
        
soma_coluna:
    push rbp
    mov rbp, rsp
  
    movss xmm0, [z] ;zera xmm0
    
    mov rax, rsi
    mul rsi
    mov r12, rax
    mov rax, rdx
    
    laco_j: 
        cmp rax, r12
        je fim_i
        movss xmm1, [rdi+rax*4]
        addss xmm0, xmm1
        add rax, rsi
        jmp laco_j
        
    fim_j:
        leave
        ret

soma_diagonal_principal:
    push rbp
    mov rbp, rsp
    
    xor rdx, rdx  ; i
    movss xmm0, [z] ; acc
    
    mov rax, rsi
    mul rsi
    mov r12, rax ; i_max
    
    l1: 
        cmp rdx, r12
        jge fim_l1
        movss xmm1, [rdi+rdx*4]
        addss xmm0, xmm1
        add rdx, rsi
        inc rdx
        jmp l1

    fim_l1:
        leave
        ret
        
soma_diagonal_secundaria:
    push rbp
    mov rbp, rsp
    
    movss xmm0, [z] 
    
    mov rax, rsi
    mul rsi
    mov r12, rax 
    dec r12 
    
    mov rdx, rsi 
    dec rdx 
        
    l2: 
        cmp rdx, r12
        jge fim_l2
        movss xmm1, [rdi+rdx*4]
        addss xmm0, xmm1
        add rdx, rsi
        dec rdx
        jmp l2
               
    fim_l2:
        leave
        ret
