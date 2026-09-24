npm create vite@latest meu-app-react -- --template react

npm install

npm run dev

# 1. Inicia o repositório Git dentro da pasta do projeto
git init

# 2. Adiciona todos os arquivos para o controle do Git
git add .

# 3. Cria o primeiro ponto de salvamento (commit)
git commit -m "Primeiro commit do projeto"

# 4. Renomeia a branch principal para 'main' (padrão atual)
git branch -M main

# 5. Conecta sua pasta local ao repositório remoto na nuvem
git remote add origin URL_DO_SEU_REPOSITORIO

# 6. Envia os arquivos locais e define a branch padrão na nuvem
git push -u origin main

# 1. Prepara todos os arquivos modificados/criados
git add .

# 2. Registra o que foi feito nas alterações
git commit -m "Descrição clara do que você alterou"

# 3. Envia os novos commits para a nuvem
git push

# Baixa uma cópia completa do projeto para o seu computador
git clone URL_DO_SEU_REPOSITORIO

# Entra na pasta criada
cd NOME_DA_PASTA

# Baixa e mescla as novidades do repositório remoto na sua pasta local
git pull

# Mostra o status dos arquivos (o que foi alterado ou não salvo)
git status

# Exibe o histórico dos últimos salvamentos (commits)
git log --oneline



-- Criando o banco de dados do desafio
CREATE DATABASE IF NOT EXISTS desafio_devops;
USE desafio_devops;

-- Tabela de Servidores
CREATE TABLE servidores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ambiente VARCHAR(20) NOT NULL, -- 'producao', 'staging'
    ip VARCHAR(45) NOT NULL
);

-- Tabela de Registros de Incidentes/Alertas
CREATE TABLE alertas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    servidor_id INT NOT NULL,
    tipo VARCHAR(50) NOT NULL, -- 'CPU', 'MEMORIA', 'DISCO'
    gravidade VARCHAR(20) NOT NULL, -- 'CRITICO', 'ALERTA', 'INFO'
    data_alerta DATETIME NOT NULL,
    FOREIGN KEY (servidor_id) REFERENCES servidores(id)
);

-- Inserindo dados de teste
INSERT INTO servidores (nome, ambiente, ip) VALUES
('Web-Prod-01', 'producao', '10.0.0.1'),
('DB-Prod-01', 'producao', '10.0.0.2'),
('Web-Staging-01', 'staging', '10.0.0.3'),
('Auth-Service', 'producao', '10.0.0.4');

INSERT INTO alertas (servidor_id, tipo, gravidade, data_alerta) VALUES
(1, 'CPU', 'CRITICO', '2026-09-20 10:30:00'),
(1, 'MEMORIA', 'ALERTA', '2026-09-20 11:00:00'),
(2, 'DISCO', 'CRITICO', '2026-09-21 08:15:00'),
(2, 'CPU', 'CRITICO', '2026-09-21 09:00:00'),
(2, 'MEMORIA', 'CRITICO', '2026-09-22 14:20:00'),
(3, 'CPU', 'INFO', '2026-09-22 15:00:00');

SELECT 
    s.nome,
    s.ip,
    COUNT(a.id) AS total_criticos
FROM servidores s
INNER JOIN alertas a ON s.id = a.servidor_id
WHERE s.ambiente = 'producao' 
  AND a.gravidade = 'CRITICO'
GROUP BY s.id, s.nome, s.ip
HAVING COUNT(a.id) >= 2;

SELECT 
    s.nome,
    s.ambiente,
    COUNT(a.id) AS total_alertas
FROM servidores s
LEFT JOIN alertas a ON s.id = a.servidor_id
GROUP BY s.id, s.nome, s.ambiente;
