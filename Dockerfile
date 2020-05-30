FROM node:alpine as builder
WORKDIR '/'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /build /usr/share/nginx/html