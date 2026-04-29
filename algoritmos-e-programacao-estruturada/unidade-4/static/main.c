#include <stdlib.h>
#include <stdio.h>

const float aliquota_desconto = 0.09;

float calcular_salario_bruto(float valor_hora, float qtde_horas) {
    return valor_hora * qtde_horas;
}

float calcular_desconto(float salario_bruto) {
    return aliquota_desconto * salario_bruto;
}

float calcular_salario_liquido(float salario_bruto, float desconto) {
    return salario_bruto - desconto;
}

int main() {
    float valor_hora;
    float qtde_horas;

    printf("Valor da hora: ");
    scanf("%f", &valor_hora);

    printf("Quantidade de horas: ");
    scanf("%f", &qtde_horas);

    float salario_bruto = calcular_salario_bruto(valor_hora, qtde_horas);
    float desconto = calcular_desconto(salario_bruto);
    float salario_liquido = calcular_salario_liquido(salario_bruto, desconto);

    printf("Salario bruto: %.02f\n", salario_bruto);
    printf("Desconto: %.02f\n", desconto);
    printf("Salario liquido: %.02f\n\n", salario_liquido);

    return EXIT_SUCCESS;
}
