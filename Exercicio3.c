#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int quadrado(int *mat, int n);

int main (){
    int mat[] = {2,7,6,9,5,1,4,3,8};
    int n = 3;

    printf("%d\n", quadrado(mat, n));

    return 0;
}
//// comando utilizado para compilar: nasm -f elf64 Exercicio3.asm && gcc -no-pie Exercicio3.c Exercicio3.o && ./a.out

