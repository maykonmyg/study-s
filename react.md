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