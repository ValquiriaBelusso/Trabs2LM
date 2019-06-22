#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int quadrado (float *mat, int n);

int main (){
    float mat[] = {2.00,7.00,6.00,9.00,5.00,1.00,4.00,3.00,8.00};
    int n = 3;

    printf("%d\n", quadrado(mat, n));

    return 0;
}
//// comando utilizado para compilar: nasm -f elf64 Exercicio4_3.asm && gcc -no-pie Exercicio4_3.c Exercicio4_3.o && ./a.out

