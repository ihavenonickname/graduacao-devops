#include <stdlib.h>
#include <stdio.h>

int main() {
    const int qtde_elementos = 5;

    int vetor[qtde_elementos];
    int soma = 0;

    for (int i = 0; i < qtde_elementos; i++) {
        printf("%do elemento: ", i+1);
        scanf("%d", vetor+i);
        soma += vetor[i];
    }

    for (int i = 0; i < qtde_elementos; i++) {
        printf("vetor[%d] = %d\n", i, vetor[i]);
    }

    printf("Soma: %d", soma);

    printf("\n");
    printf("\n");

    return EXIT_SUCCESS;
}
