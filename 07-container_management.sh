### Stop docker container
docker stop $CONTAINER_NAME

### Start docker container
docker start $CONTAINER_NAME

### Restart docker container
docker restart $CONTAINER_NAME

### Statistics docker container
docker stats $CONTAINER_NAME

### Show running containers
docker ps

### Show all containers
docker ps -a

### Open bash on container
docker exec -i -t $CONTAINER_NAME bash
