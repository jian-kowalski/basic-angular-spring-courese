FROM node:12.22.9-alpine as node
WORKDIR /app
COPY package.json /app/
RUN npm i npm@latest -g
RUN npm install
COPY ./ /app/
ARG env=prod
RUN npm run build

# Estagio 2 - Responsável por expor nossa aplicação
FROM nginx:1.21.3-alpine
COPY --from=node /app/dist /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf