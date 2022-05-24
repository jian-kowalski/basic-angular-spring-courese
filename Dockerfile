FROM node:latest as build 
WORKDIR /app
COPY package.json /app
RUN npm install --salient
COPY . .
RUN npm run build

FROM nginx:alpine
VOLUME /var/cache/nginx
COPY --from=build app/dist/basic-angular /usr/share/nginx/html
COPY ./config/nginx-custom.conf /etc/nginx/conf.d/default.config