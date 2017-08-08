### Installing docker service
# Reference: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/

# Removing old versions
sudo apt-get remove docker docker-engine docker.io

# Recommended extra packages
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
sudo apt-get update

# Packages to user https
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Docker key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Include Docker repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# installing docker
sudo apt-get install docker-ce

### run docker command without "sudo"
sudo groupadd docker
sudo usermod -aG docker $USER

# testing
docker run hello-world
