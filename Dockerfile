FROM node:alpine as build

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["npm", "run", "build"]

From nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html