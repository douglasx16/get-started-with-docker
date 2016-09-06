### Installing docker service
# Reference: https://docs.docker.com/engine/installation/linux/ubuntulinux/

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
vi /etc/apt/sources.list.d/docker.list
deb https://apt.dockerproject.org/repo ubuntu-xenial main
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-get install docker-engine
sudo service docker start

# test
sudo docker run hello-world

### run docker command without "sudo"
sudo groupadd docker
sudo usermod -aG docker $USER
# test
docker run hello-world
