
FROM node:alpine as builder
WORKDIR /app/frontend
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/frontend/build /usr/share/nginx/html
# default command nginx will start nginx
