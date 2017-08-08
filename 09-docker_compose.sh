### Installing
sudo su -
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

#########################################################
### Criate file "docker-compose.yml" with:
version: "2"
services:
  graphite:
    image: hopsoft/graphite-statsd
    ports:
      - "80:80"
      - "2003-2004:2003-2004"

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
    links:
      - graphite

### Create environment
docker-compose -p ‘treinamento’ up
