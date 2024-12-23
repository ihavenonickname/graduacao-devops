CREATE DATABASE IF NOT EXISTS empresa
CHARSET = utf8
COLLATE = utf8_general_ci;

USE empresa;

CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    departamento VARCHAR(50),
    salario DECIMAL(10, 2),
    data_admissao DATE
);

INSERT INTO funcionarios (nome, departamento, salario, data_admissao)
VALUES
    ('Leo Costa', 'Manutenção', 2600.0, '2018-12-05'),
    ('Jota Lira', 'Manutenção', 3000.0, '2019-09-21'),
    ('Diego Paz', 'Suporte TI', 3500.0, '2021-04-14'),
    ('Eva Gomes', 'Financeiro', 4100.0, '2018-03-15'),
    ('Ana Silva', 'Financeiro', 5000.0, '2014-01-11');

SELECT *
FROM funcionarios
WHERE departamento = 'Financeiro';

SELECT UPPER(nome) AS `Nome do Funcionário`, departamento AS `Área de Atuação`
FROM funcionarios;

SELECT departamento, SUM(salario) AS sum_salarios
FROM funcionarios
GROUP BY departamento
ORDER BY sum_salarios DESC;

SELECT *
FROM funcionarios
WHERE nome LIKE 'A%';
