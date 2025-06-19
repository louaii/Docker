# Nginx Docker 

Run the following commands to pull the Nginx image, start a container, customize the default web page, commit the changes, and push the image to Docker Hub.

```bash
# Pull the official Nginx image
docker pull nginx

# Run the Nginx container in detached mode, mapping port 80
docker run -d -p 80:80 --name nginx nginx

# Update the default web page inside the container
docker exec -it nginx bash -c "echo 'Message' > /usr/share/nginx/html/index.html"

# Commit the container with your Docker Hub username, image name, and tag
docker commit nginx dockerhub_username/image_name:Tag

# Log in to Docker Hub (enter your credentials when prompted)
docker login

# Push the new image to Docker Hub
docker push dockerhub_username/image_name:Tag


#Follow the link below
[View the Nginx image on Docker Hub](https://hub.docker.com/repository/docker/louaii/nginx/general)

