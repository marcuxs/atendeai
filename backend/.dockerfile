# Usar uma imagem base do Node.js
FROM node:16-alpine

# Criar o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar os arquivos de dependências
COPY package.json package-lock.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante do código para o contêiner
COPY . .

# Expor a porta usada pelo backend
EXPOSE 3001

# Definir o comando padrão para iniciar o backend
CMD ["npm", "start"]
