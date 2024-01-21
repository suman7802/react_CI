FROM node:alpine as builder
WORKDIR '/app/client'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/client/build /usr/share/nginx/html