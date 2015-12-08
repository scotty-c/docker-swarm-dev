# Docker Swarm Dev Environment
```
Prerequisites:
- Vagrant
- Ruby
```


# Install dependencies
```
git clone to a new directory
cd that directory
vagrant up
```
This will build a demo environment of 3 boxes in Docker Swarm cluster and 2 Swarm Manager. It also configurers Conul so we can monitor the cluster and contianers on the cluster.
This is all automated and controlled with Puppet.


# URL
consul
````
127.0.0.1:9500
````

# Commands

Here are a few interesting commands to look at what is happening inside the swarm cluster. ````vagrant ssh into swarm-master-01````

Info
````
docker -H tcp://172.17.8.114:2376 info
`````  

Docker ps
```` 
docker -H tcp://172.17.8.114:2376 ps
````


Get Registrator
````
docker -H tcp://172.17.8.114:2376 run -d  --restart always -e constraint:node!=swarm* -v /var/run/docker.sock:/tmp/docker.sock   gliderlabs/registrator consul://172.17.8.101:8500
````

