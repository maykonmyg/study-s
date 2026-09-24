CREATE TABLE inscricoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100),
    data_inscricao DATETIME
);

SELECT 
    email,
    COUNT(*) AS total_inscricoes
FROM inscricoes
GROUP BY email
HAVING COUNT(*) > 1;