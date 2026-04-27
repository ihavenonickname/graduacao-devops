#include <stdlib.h>
#include <stdio.h>

int main() {
    int n1;
    int n2;
    int n3;

    printf("Informe o 1o numero: ");
    scanf("%d", &n1);

    printf("Informe o 2o numero: ");
    scanf("%d", &n2);

    printf("Informe o 3o numero: ");
    scanf("%d", &n3);

    int soma = n1 + n2 + n3;
    printf("Soma = %d\n", soma);

    int subtracao = n1 - n2 - n3;
    printf("Subtracao = %d\n", subtracao);

    int multiplicacao = n1 * n2 * n3;
    printf("Multiplicacao = %d\n", multiplicacao);

    float divisao = (float)n1 / n2 / n3;
    printf("Divisao = %f\n", divisao);

    int n1_maior_n2 = n1 > n2;
    printf("Primeiro maior que segundo: %s\n", n1_maior_n2 ? "sim" : "nao");

    int n2_menor_n3 = n2 < n3;
    printf("Segundo menor que terceiro: %s\n", n2_menor_n3 ? "sim" : "nao");

    int n1_positivo_n2_par = n1 > 0 && n2 % 2 == 0;
    printf("Primeiro positivo e segundo par: %s\n", n1_positivo_n2_par ? "sim" : "nao");

    printf("\n");

    return EXIT_SUCCESS;
}
