CREATE TABLE IF NOT EXISTS estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    uf VARCHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS municipio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado_id INT,
    nome VARCHAR(80) NOT NULL,
    cod_ibge INT NOT NULL,

    FOREIGN KEY (estado_id) REFERENCES estado (id)
);

CREATE TABLE IF NOT EXISTS cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    municipio_id INT,
    nome VARCHAR(80) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    celular VARCHAR(11),
    end_logradouro VARCHAR(100) NOT NULL,
    end_numero VARCHAR(100) NOT NULL,
    end_municipio INT NOT NULL,
    end_cep VARCHAR(8),

    FOREIGN KEY (municipio_id) REFERENCES municipio (id)
);

CREATE TABLE IF NOT EXISTS conta_receber (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fatura_venda_id INT,
    data_conta DATE NOT NULL,
    data_vencimento DATE NOT NULL,
    valor DECIMAL(18, 2) NOT NULL,
    situacao ENUM('1', '2', '3') NOT NULL,

    FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);

INSERT INTO estado (nome, uf) VALUES
('Rio Grande do Sul', 'RS'),
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ');

INSERT INTO municipio (estado_id, nome, cod_ibge) VALUES
(1, 'Porto Alegre', 4314902),
(1, 'Canoas', 4304606),
(2, 'São Paulo', 3550308),
(2, 'Campinas', 3509502),
(3, 'Rio de Janeiro', 3304557);

INSERT INTO cliente (
    municipio_id,
    nome,
    cpf,
    celular,
    end_logradouro,
    end_numero,
    end_municipio,
    end_cep
) VALUES
(2, 'João Silva', '12345678901', '51999998888', 'Rua A', '100', 2, '92400000'),
(1, 'Maria Souza', '98765432100', '51988887777', 'Av Brasil', '200', 1, '90010000'),
(3, 'Carlos Lima', '45678912300', '11977776666', 'Rua Central', '300', 3, '01001000'),
(4, 'Ana Pereira', '32165498700', '11966665555', 'Av Paulista', '1500', 4, '01310000');

INSERT INTO conta_receber (
    cliente_id,
    fatura_venda_id,
    data_conta,
    data_vencimento,
    valor,
    situacao
) VALUES
(1, 1001, '2026-01-10', '2026-02-10', 250.00, '2'),
(1, 1005, '2026-03-05', '2026-04-05', 180.90, '1'),
(1, 1009, '2026-04-01', '2026-05-01', 320.00, '1'),
(2, 1002, '2026-02-15', '2026-03-15', 900.50, '3'),
(2, 1010, '2026-03-20', '2026-04-20', 450.00, '2'),
(2, 1011, '2026-04-10', '2026-05-10', 780.75, '1'),
(3, 1003, '2026-01-25', '2026-02-25', 530.75, '2'),
(3, 1012, '2026-03-01', '2026-04-01', 999.99, '1'),
(3, 1013, '2026-04-12', '2026-05-12', 150.00, '1'),
(4, 1004, '2026-02-20', '2026-03-20', 899.99, '3'),
(4, 1014, '2026-03-18', '2026-04-18', 340.00, '2'),
(4, 1015, '2026-04-15', '2026-05-15', 610.30, '1');

CREATE OR REPLACE VIEW contas_pendente_pagamento AS
SELECT
    conta.id conta_id,
    cliente.nome cliente_nome,
    cliente.cpf cliente_cpf,
    conta.data_vencimento conta_vencimento,
    conta.valor conta_valor
FROM conta_receber conta
JOIN cliente ON cliente.id = conta.cliente_id
WHERE conta.situacao = '1';

SELECT * FROM contas_pendente_pagamento;
