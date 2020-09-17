FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . . 
# not required as docker-compose will take care of that. keep it here if dont want to use docker default cli

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

