class config::compose {
  
if $hostname =~ /^*master*$/ {
 
 notice ["This server is the Swarm Manager."]

}

else {
 
  $ip = $::hostname ? {
  /.*101$/ => '10.0.1.10/24',
  /.*102$/ => '10.0.1.20/24',
  /.*103$/ => '10.0.1.30/24',
  }


 $erb = $::hostname ? {
  /.*101$/ => 'jenkins.yml',
  /.*102$/ => 'nginx.yml',
  /.*103$/ => 'rabbitmq.yml',
  }

file { '/root/docker-compose.yml':
  ensure  => file,
  content => template("config/$erb.erb"), 
  } ->

docker_compose {'swarm app':
  ensure => present, 
  source => '/root',  
  scale => ['1']
    }
  }
}