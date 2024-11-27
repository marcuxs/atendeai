# Etapa 1: Usar uma imagem base do Node.js para construir o projeto
FROM node:16-alpine AS build

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar os arquivos do package.json e package-lock.json para instalar dependências
COPY package.json package-lock.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante do código para o contêiner
COPY . .

# Construir a aplicação
RUN npm run build

# Etapa 2: Usar uma imagem Nginx para servir os arquivos estáticos
FROM nginx:alpine

# Copiar os arquivos construídos para o Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expor a porta padrão do Nginx
EXPOSE 80

# Comando para rodar o Nginx
CMD ["nginx", "-g", "daemon off;"]
