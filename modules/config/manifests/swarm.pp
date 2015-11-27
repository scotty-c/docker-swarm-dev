class config::swarm {

  class { 'docker_swarm': 
  require => Class['config::consul_config']
  } 

  if $hostname =~ /^*master*$/ {
  
  swarm_cluster {'cluster 1':
    ensure       => present,
    backend      => 'consul',
    cluster_type => 'manage',
    port         => '8500',
    address      => '172.17.8.101',
    path         => 'swarm',
    }  
  }

  else {

  swarm_cluster {'cluster 1':
   ensure       => present,
   backend      => 'consul',
   cluster_type => 'join',
   port         => '8500',
   address      =>  '172.17.8.101',
   path         =>  'swarm'
    } 
  }
}  