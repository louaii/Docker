FROM node:24-alpine3.21 AS build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
RUN npm run build --prod
FROM nginx:alpine
COPY --from=build /app/dist/angular/browser /usr/share/nginx/html