# Angular Dockerization Example

This project demonstrates how to dockerize a basic Angular application using Node.js and NGINX.

## 📦 Project Setup

1. **Install Node.js LTS**
   - Make sure you have the LTS version of Node.js installed.
   - You can download it from [https://nodejs.org/en/](https://nodejs.org/en/)

2. **Create Angular App**
   ```bash
   ng new angular
   cd angular
Serve Locally (Optional Test)
ng serve
Open http://localhost:4200 to verify the app works.

Modify index.html
Navigate to src/app/index.html and add the following line:
<!-- Running from Docker image -->
🐳 Dockerization Steps
Dockerfile
Create a Dockerfile in your project root with the following content:
# Build Stage
FROM node:24-alpine3.21 AS build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
RUN npm run build --prod

# Run Stage
FROM nginx:alpine
COPY --from=build /app/dist/angular/browser /usr/share/nginx/html
Build the Docker Image
docker build --tag angular .
Run the Container
docker run -d -p 4200:80 --name angular angular
Open your browser at http://localhost:4200 to view the app running inside Docker.

Commit to Docker Image
docker commit container username/image
Replace username/image with your Docker Hub username and preferred image name.

Push to Docker Hub
Log in to Docker Hub:
docker login

Push your image:
docker push username/image
📌 Notes
This image uses multi-stage builds to keep the final image lightweight by only including the built Angular files in an NGINX container.

The production build is served through NGINX on port 80 and exposed via Docker on port 4200.
