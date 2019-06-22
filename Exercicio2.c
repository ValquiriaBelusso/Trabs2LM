#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void escreve_arquivo(int *mat, int m, int n, char *arquivo);

int main (){
    srand(time(NULL));

    int m = 3;
    int n = 2;
    int mat[m*n];

    for (int i=0; i<m; i++){
	    for (int j=0; j<n; j++){
		    mat[i*m+j] = rand()%20;
	    }
    }

    escreve_arquivo(mat, m, n, "arquivo");

    return 0;
}

//// comando utilizado para compilar: nasm -f elf64 Exercicio2.asm && gcc -no-pie Exercicio2.c Exercicio2.o && ./a.out
