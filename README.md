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
This is all automated and controlled with Puppet. It will also deploy Jenkins and Nginx. The Swarm master will pick a node to deploy the contianers on. So you can check the consul gui, ping the service name from any of the 5 boxes or logon to one of the swarm masters and run ````docker -H tcp://172.17.8.114:2376 ps````. Once you have the ip of the box, you can access the app on the forwarded port from the ````server.yaml````. 
For example if jenkins was on swarm-103 you would access it from ````127.0.0.1:8083```` and nginx would be on ````127.0.0.1:8003```` 

# URL
consul
````
127.0.0.1:9501
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
# This repo is no longer being managed please see [`scottyc/puppet-demo`](https://github.com/scotty-c/puppet-demo)

