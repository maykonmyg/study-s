CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    quantidade_estoque INT,
    preco DECIMAL(10,2)
);


SELECT 
    nome,
    quantidade_estoque,
    CASE 
        WHEN quantidade_estoque = 0 THEN 'FORA DE ESTOQUE'
        WHEN quantidade_estoque BETWEEN 1 AND 5 THEN 'ESTOQUE CRÍTICO'
        ELSE 'OK'
    END AS status_estoque
FROM produtos
ORDER BY quantidade_estoque ASC;