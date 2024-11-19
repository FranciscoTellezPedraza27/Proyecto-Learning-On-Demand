# Usa una imagen base ligera de Node.js
FROM node:16-alpine

# Crea un directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copia los archivos necesarios al contenedor
COPY package*.json ./
RUN npm install

# Copia el resto de los archivos del proyecto al contenedor
COPY . .

# Instala http-server para servir archivos estáticos
RUN npm install -g http-server

# Expone el puerto 8080 para acceder al contenido
EXPOSE 8080

# Comando para iniciar el servidor HTTP
CMD ["http-server", ".", "-p", "8080"]
