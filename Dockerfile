FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
COPY . .
RUN npm rum build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
