#include <stdlib.h>
#include <stdio.h>

int main() {
    int soma = 0;
    int valor = 1;

    while (valor != 0) {
        printf("Valor: ");
        scanf("%d", &valor);

        soma += valor;
    }

    printf("Soma: %d", soma);
    printf("\n");
    printf("\n");

    return EXIT_SUCCESS;
}
