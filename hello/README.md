# Hello World Custom Docker Image

This is a minimal custom Docker image based on Alpine Linux that simply prints a message when run.

## 🐳 Dockerfile

```Dockerfile
FROM alpine
CMD [ "echo", "hello-world-custom image" ]
📦 Build the Image
To build the Docker image, run the following command in the directory 
docker build -t hello-custom .
🚀 Run the Container
To run the container and see the output:

docker run hello-custom
📝 Notes
This image is based on the ultra-lightweight Alpine Linux.

Useful as a starting point or a test for Docker setup.

📂 Files
Dockerfile: Defines the image

README.md: This documentation