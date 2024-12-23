INSERT INTO funcionarios (nome, departamento, salario, data_admissao)
VALUES
    ('Aline Luz', 'Financeiro', 2100.0, '2025-10-11'),
    ('Maria Paz', 'Manutenção', 3300.0, '2024-07-29'),
    ('João Ledo', 'Suporte TI', 2300.0, '2026-01-14'),
    ('Bete Rios', 'Manutenção', 1000.0, '2016-03-05');

UPDATE funcionarios
SET salario = salario * 1.1
WHERE nome = 'Ana Silva';

DELETE FROM funcionarios
WHERE departamento = 'Suporte TI';

ALTER TABLE funcionarios
ADD email VARCHAR(50),
MODIFY salario FLOAT,
DROP data_admissao;

ALTER TABLE funcionarios
ADD CONSTRAINT unique_funcionarios_email
UNIQUE (email);
