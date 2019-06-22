#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void imprime_matriz(int *mat, int m, int n);

int main (){
    srand(time(NULL));

    int m = 3;
    int n = 4;
    int mat[m*n];

    for (int i=0; i<m; i++){
	    for (int j=0; j<n; j++){
		mat[i*m+j] = rand()%20;
	    }
    }	
    imprime_matriz(mat, m, n);
    return 0;
}

//// comando utilizado para compilar: nasm -f elf64 Exercicio1.asm && gcc -no-pie Exercicio1.c Exercicio1.o && ./a.out

