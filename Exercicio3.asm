global quadrado
segment .data
    fnt db "%d ", 0    
extern printf
segment .text
quadrado:
    push rbp
    mov rbp, rsp
    
    ; checa linhas
    xor r14, r14
    mov rdx, 0
    call soma_linha
    mov r8d, eax
    
    ; Como são um numero arbitrario de linhas e cols
    for:
	cmp r14d, esi
	je fim
	
	mov edx, r14d
	call soma_linha
	cmp r8d, eax
	jne erro
		
	mov edx, r14d
	call soma_coluna
	cmp r8d, eax
	jne erro
		
    fim:
        inc r14d
        jmp for
        
		
    ; Checa as diagonais (Sempre só tem uma diag princ e uma sec)
    call soma_diagonal_principal
    cmp r8d, eax
    jne erro
		
    call soma_diagonal_secundaria
    cmp r8d, eax
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
    
    xor r12d, r12d 
    
    mov eax, edx
    mov ebx, esi 
    mul ebx
    xor rbx, rbx
    mov r12d, eax
    add r12d, esi
    
    laco_i: 
        cmp eax, r12d
        je fim_i
        mov ecx, [edi+eax*4]
        add ebx, ecx
        inc eax
        jmp laco_i
    
    fim_i:
        mov eax, ebx
        leave
        ret
        
soma_coluna:
    push rbp
    mov rbp, rsp
  
    xor rbx, rbx 
    xor r12, r12 
    
    mov eax, esi 
    mul esi
    mov r12d, eax
    mov eax, edx
    
    laco_j: 
        cmp eax, r12d
        jge fim_i
        mov ecx, [edi+eax*4]
        add ebx, ecx
        add eax, esi
        jmp laco_j
    
    fim_j:
        mov eax, ebx
        leave
        ret

soma_diagonal_principal:
    push rbp
    mov rbp, rsp
    
    xor rcx, rcx 
    xor rdx, rdx 
    
    mov eax, esi
    mul esi
    mov r12d, eax 
    
    l1: 
        cmp edx, r12d
        jge fim_l1
        mov ebx, [edi+edx*4]
        add ecx, ebx
        add edx, esi
        inc edx
        jmp l1
        
    fim_l1:
        mov eax, ecx
        leave
        ret
        
soma_diagonal_secundaria:
    push rbp
    mov rbp, rsp
    
    xor rcx, rcx 
	
    mov eax, esi
    mul esi
    mov r12d, eax 
    dec r12d 
    
    mov edx, esi 
    dec edx 
        
    l2: 
        cmp edx,r12d
        jge fim_l2
        mov ebx, [edi+edx*4]
        add ecx, ebx
        add edx, esi
        dec edx
        jmp l2
       
    fim_l2:
        mov eax, ecx
        leave
        ret

