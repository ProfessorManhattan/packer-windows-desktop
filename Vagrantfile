# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.2"

cpus = 2
description = ""
memory = 4096

Vagrant.configure("2") do |config|

  config.ssh.password = "vagrant"
  config.ssh.username = "vagrant"

  config.vm.define "" do |os|
    os.vm.box="/"
    os.vm.hostname = "vagrant-windows"

    os.vm.network "forwarded_port", guest: 22, host: 58022, id: "ssh", auto_correct: true
    os.vm.network "forwarded_port", guest: 80, host: 58080, id: "http", auto_correct: true
    os.vm.network "forwarded_port", guest: 443, host: 58443, id: "https", auto_correct: true
    os.vm.network "forwarded_port", guest: 3389, host: 53389, id: "rdp", auto_correct: true

  end
end
