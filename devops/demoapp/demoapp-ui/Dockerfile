# BUILD
FROM node:12-alpine as builder

RUN apk add --no-cache bash git python perl alpine-sdk

WORKDIR /opt/app

COPY . /opt/app/

RUN npm ci && \
  npm run build && \
  npm run export


# RUN
FROM nginx:1-alpine as production

COPY --from=builder /opt/app/dist /usr/share/nginx/html
