CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_cadastro DATE
);

CREATE TABLE acessos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    data_acesso DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Solução Desafio 1: LEFT JOIN mantém todos os usuários, mesmo sem acesso
SELECT 
    u.id,
    u.nome,
    MAX(a.data_acesso) AS ultimo_acesso
FROM usuarios u
LEFT JOIN acessos a ON u.id = a.usuario_id
GROUP BY u.id, u.nome;

-- Solução Desafio 2: Identificar quem não tem registro na tabela de acessos
SELECT 
    u.id,
    u.nome,
    u.data_cadastro
FROM usuarios u
LEFT JOIN acessos a ON u.id = a.usuario_id
WHERE a.id IS NULL; -- Filtra onde o JOIN falhou em encontrar correspondência