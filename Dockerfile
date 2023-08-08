FROM node:latest
WORKDIR /app/portal/static

RUN npm install --global http-server

COPY src/main/resources/static /app/portal/static

ENV PORT_SERV="4200" \
    DNS="0.0.0.0"

EXPOSE $PORT_SERV

CMD http-server -p ${PORT_SERV} -a ${DNS}
# WORKDIR /app
# COPY package.json /app
# RUN npm install --salient
# COPY . .
# RUN npm run build

# FROM nginx:alpine
# VOLUME /var/cache/nginx
# COPY --from=build app/dist/basic-angular /usr/share/nginx/html
# COPY ./config/nginx-custom.conf /etc/nginx/conf.d/default.config
