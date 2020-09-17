FROM node:alpine 

WORKDIR "/app"

COPY package.json ./

RUN npm install

COPY ./ ./ 
# not required as docker-compose will take care of that. keep it here if dont want to use docker default cli

RUN npm run build

FROM nginx
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html

