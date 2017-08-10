### Create and start Docker container with Volume
docker run -d -p 8080:80 -v $PWD:/folder --name nginx nginx

### Create and start Docker container with automated restart
docker run -d --restart=always -p 8081:80 --name nginx_auto_restart nginx

### Execute bash with root user on running container
docker exec -u root -it nginx bash

### Execute bash on container for test and destroy after logout
docker run -it --rm debian:jessie bash
