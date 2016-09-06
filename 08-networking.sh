### Show docker networks
docker network ls

### Show actually subnet on container
docker run -i -t --rm debian:jessie ip a


#####################################################
### Configure docker service to use a specific subnet
# Open config file
sudo vim /etc/default/docker

# Include this option:
DOCKER_OPTS="--bip=192.0.2.1/24 --fixed-cidr=192.0.2.0/24"

# Restart docker service
service docker restart

### Show subnet on containers now
docker run -i -t --rm debian:jessie ip a


#####################################################
### Create containers (interface + DB) and network link
# Up graphite (DB)
docker run -d --name graphite -p 80:80 hopsoft/graphite-statsd

# Up Grafana (interface), with --link
docker run -d --link graphite --name=grafana -p 3000:3000 grafana/grafana

### Show configurations grafana
docker exec -i -t grafana bash
cat /etc/hosts
ping graphite
exit

# Go to http://localhost:3000/login
# User: admin Pass: admin
# Include datasource: http://graphite
