FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install express cors -S
RUN npm install

COPY . .

EXPOSE 5500

CMD ["node", "server.js"]