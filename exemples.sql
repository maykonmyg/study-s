-- ============================================================
-- 1. CRIAÇÃO E SELEÇÃO DO BANCO DE DADOS
-- ============================================================

-- Cria um novo banco de dados (se ele ainda não existir)
CREATE DATABASE IF NOT EXISTS meu_primeiro_db;

-- Seleciona o banco de dados que será utilizado nos próximos comandos
USE meu_primeiro_db;


-- ============================================================
-- 2. CRIAÇÃO DE TABELAS (CREATE TABLE)
-- ============================================================

-- Cria a tabela de usuários com diferentes tipos de dados e restrições (constraints)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Chave primária que autoincrementa a cada novo registro
    nome VARCHAR(100) NOT NULL,               -- Texto com até 100 caracteres, campo obrigatório
    email VARCHAR(100) UNIQUE NOT NULL,       -- Email único (não aceita duplicados) e obrigatório
    idade INT,                                -- Número inteiro para a idade
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP -- Data e hora inseridos automaticamente
);

-- Cria uma segunda tabela para demonstrar relacionamento (Chave Estrangeira / FOREIGN KEY)
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,                  -- Coluna que fará referência ao ID do usuário
    valor DECIMAL(10, 2) NOT NULL,            -- Número decimal (até 10 dígitos, 2 casas decimais)
    data_pedido DATE,                          -- Armazena apenas a data (AAAA-MM-DD)
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) -- Liga esta tabela à tabela 'usuarios'
);


-- ============================================================
-- 3. INSERÇÃO DE DADOS (INSERT INTO)
-- ============================================================

-- Insere um único registro na tabela 'usuarios'
INSERT INTO usuarios (nome, email, idade) 
VALUES ('Ana Silva', 'ana@email.com', 25);

-- Insere múltiplos registros de uma só vez
INSERT INTO usuarios (nome, email, idade) VALUES 
('Carlos Souza', 'carlos@email.com', 30),
('Beatriz Lima', 'beatriz@email.com', 19),
('João Pedro', 'joao@email.com', 42);

-- Insere registros na tabela 'pedidos' associando aos IDs de usuários existentes
INSERT INTO pedidos (usuario_id, valor, data_pedido) VALUES 
(1, 150.50, '2026-09-01'),
(1, 89.90, '2026-09-10'),
(2, 299.00, '2026-09-15');


-- ============================================================
-- 4. CONSULTA DE DADOS (SELECT)
-- ============================================================

-- Seleciona todas as colunas e todas as linhas da tabela
SELECT * FROM usuarios;

-- Seleciona apenas colunas específicas
SELECT nome, email FROM usuarios;

-- Filtra registros usando a cláusula WHERE
SELECT * FROM usuarios WHERE idade >= 25;

-- Ordena o resultado por idade de forma decrescente (DESC) ou crescente (ASC)
SELECT * FROM usuarios ORDER BY idade DESC;

-- Limita a quantidade de resultados retornados
SELECT * FROM usuarios LIMIT 2;

-- Consulta cruzada (JOIN) para unir dados da tabela 'usuarios' com a tabela 'pedidos'
SELECT usuarios.nome, pedidos.valor, pedidos.data_pedido
FROM usuarios
INNER JOIN pedidos ON usuarios.id = pedidos.usuario_id;


-- ============================================================
-- 5. ATUALIZAÇÃO DE DADOS (UPDATE)
-- ============================================================

-- Atualiza a idade do usuário cujo ID é 1
-- ATENÇÃO: Sempre use WHERE no UPDATE para não alterar todas as linhas da tabela!
UPDATE usuarios 
SET idade = 26 
WHERE id = 1;

-- Atualiza múltiplos campos de um registro específico
UPDATE usuarios 
SET nome = 'Carlos Eduardo Souza', email = 'carlos.eduardo@email.com' 
WHERE id = 2;


-- ============================================================
-- 6. ALTERAÇÃO NA ESTRUTURA DA TABELA (ALTER TABLE)
-- ============================================================

-- Adiciona uma nova coluna na tabela existente
ALTER TABLE usuarios 
ADD COLUMN telefone VARCHAR(20);

-- Modifica o tipo de dado ou atributos de uma coluna existente
ALTER TABLE usuarios 
MODIFY COLUMN telefone VARCHAR(30);

-- Remove uma coluna da tabela
ALTER TABLE usuarios 
DROP COLUMN telefone;


-- ============================================================
-- 7. EXCLUSÃO DE DADOS (DELETE)
-- ============================================================

-- Remove um registro específico da tabela
-- ATENÇÃO: Sempre use WHERE no DELETE para não apagar a tabela inteira!
DELETE FROM pedidos 
WHERE id = 2;

-- Apaga todos os registros de uma tabela mantendo sua estrutura (redefine o AUTO_INCREMENT)
TRUNCATE TABLE pedidos;


-- ============================================================
-- 8. REMOÇÃO DE ESTRUTURAS (DROP)
-- ============================================================

-- Apaga a tabela completa (estrutura + dados)
DROP TABLE IF EXISTS pedidos;

-- Apaga o banco de dados inteiro e todas as suas tabelas
DROP DATABASE IF EXISTS meu_primeiro_db;