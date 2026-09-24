CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    valor DECIMAL(10,2),
    data_pedido DATE,
    status VARCHAR(20), -- 'concluido', 'cancelado', 'pendente'
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);


-- Solução Desafio 1 e 2 em uma única consulta:
SELECT 
    c.nome,
    SUM(p.valor) AS total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
WHERE p.status = 'concluido'           -- Filtra as LINHAS antes de agrupar
GROUP BY c.id, c.nome                   -- Agrupa por cliente
HAVING SUM(p.valor) > 500.00;           -- Filtra o GRUPO (apenas totais > 500)