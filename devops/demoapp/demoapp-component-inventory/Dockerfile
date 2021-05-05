# Builder
FROM node:14-alpine

COPY . /app

WORKDIR /app

RUN npm ci

CMD ["npm","start"]