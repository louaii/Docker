docker pull nginx
docker run nginx -d -p 80:80 --name nginx nginx
docker exec -it nginx bash
echo '<h1>Message</h1>'> /usr/share/nginx/html/index.html
exit
docker commit nginx dockerhub_username/image_name:Tag
docker login
docker push dockerhub_username/image_name:Tag