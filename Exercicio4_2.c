#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void escreve_arquivo(float *mat, int m, int n, char *arquivo);

int main (){
    srand(time(NULL));

    int m = 3;
    int n = 2;
    float mat[m*n];

    for (int i=0; i<m; i++){
	    for (int j=0; j<n; j++){
		mat[i*m+j] = (rand()%27*.33)*(rand()%20*.75);
	    }
    }	
    escreve_arquivo(mat, m, n, "arquivo");
    return 0;
}

//// comando utilizado para compilar: nasm -f elf64 Exercicio4_2.asm && gcc -no-pie Exercicio4_2.c Exercicio4_2.o && ./a.out
