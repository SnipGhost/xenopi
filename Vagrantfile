# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/precise64"  

  def create_node(config, hostname, ip, type = "slave")
    config.vm.define hostname do |host|

      host.vm.hostname = hostname
      host.vm.network "private_network", ip: ip
      host.vm.provision "shell", path: "provision.sh"
      case type
        when "master"
          host.vm.network "forwarded_port", guest: 80, host: 8080
        when "database"
          host.vm.network "forwarded_port", guest: 8080, host: 8081
      end
      host.vm.provision "shell", path: "#{type}.sh"

    end
  end

  # Создаем master-ноду
  masterIP = "192.168.10.10"
  masterName = "balancer"
  create_node config, masterName, masterIP, "master"

  # Создаем database-ноду
  dbsIP = "192.168.20.10"
  dbsName = "database"
  create_node config, dbsName, dbsIP, "database"

  # Создаем slave-ноды
  for num in 1..3
    hostname = "server-#{num}"
    slaveIP = "192.168.10.1#{num}"
    create_node config, hostname, slaveIP
  end

end