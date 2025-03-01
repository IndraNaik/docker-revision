FROM node:18

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 5137

CMD ["npm", "run","dev"]
