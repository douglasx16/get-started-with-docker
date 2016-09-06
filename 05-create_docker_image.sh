### Docker build
docker build -t 'tag' .

### Show local images
docker images

#################################################
### Update running container
# Open browser http://localhost:8080

# open bash on running container
docker exec -u root -it nginx bash

# Change to your name
YOUR_NAME='Douglas'

# Adjust welcome page
sed -i 's/to nginx!/'$YOUR_NAME', this is your personalized nginx!/g'  /usr/share/nginx/html/index.html

# Exit container
exit

### Show diff
docker diff nginx

### Show your images
docker images

### Commit changes in a new image
docker commit -a 'My Name' -m 'Adjusted welcome page' nginx

### Show your images
docker images

### New tag
docker tag IMAGE_ID personalized_nginx

### Show your images
docker images

### Image details
docker inspect personalized_nginx
