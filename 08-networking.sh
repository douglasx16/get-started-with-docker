### Show docker networks
docker network ls

### Show actually subnet on container
docker run -i -t --rm debian:jessie ip a

#####################################################
### Configure docker service to use a specific subnet
# Open config file
sudo vim /etc/docker/daemon.json

# Include this options:
{
  "bip": "192.0.2.1/24",
  "fixed-cidr": "192.0.2.0/24",
  "dns": ["192.168.206.8","10.128.17.136"]
}

### for old versions:
# vim /etc/default/docker
# DOCKER_OPTS="--bip=192.0.2.1/24 --fixed-cidr=192.0.2.0/24"

# Restart docker service
systemctl restart docker.service

### Show subnet on containers now
docker run -i -t --rm debian:jessie ip a


#####################################################
### Create containers (interface + DB) and network link
# Up graphite (DB)
docker run -d --name graphite -p 80:80 -p 2003-2004:2003-2004 hopsoft/graphite-statsd

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

#####################################################
### Sending 2 hours of fake data
for i in {1..7200..10}
do
  VALUE=$(( ( RANDOM % 100 )  + 1 ))
  DATE=$(($(date +%s) - $i))
  echo "test.server1 $VALUE $DATE" | nc -q0 localhost 2003
done
