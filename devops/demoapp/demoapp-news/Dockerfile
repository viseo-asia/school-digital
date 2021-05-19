# Builder
FROM node:14-alpine

RUN apk add bash curl jq fdkghjkdfhgjkdfhjkgfvd

COPY . /app

WORKDIR /app

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    npm install

ENTRYPOINT ["/entrypoint.sh"]