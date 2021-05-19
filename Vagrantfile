# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false
  config.ssh.password = "vagrant"
  config.ssh.username = "vagrant"

  config.vm.define :windows do |windows|
    windows.vm.box="Megabyte/Windows-Desktop"
    windows.vm.hostname = "vagrant-windows"
    windows.vm.name = "Windows 10 Enterprise (Insider's Preview)"
    windows.vm.network :forwarded_port, guest: 22, host: 58022, id: "ssh", auto_correct: true
    windows.vm.network :forwarded_port, guest: 443, host: 58443, id: "https", auto_correct: true
    windows.vm.network :forwarded_port, guest: 80, host: 58080, id: "http", auto_correct: true
    windows.vm.network :private_network, ip: "172.24.24.2", netmask: "255.255.255.0"

    windows.vm.provider :hyperv do |v|
      v.cpus = 2
      v.maxmemory = 4096
    end

    windows.vm.provider :libvirt do |v, override|
      v.memory = 4096
      v.cpus = 2
      # Use WinRM for the default synced folder; or disable it if
      # WinRM is not available. Linux hosts don't support SMB,
      # and Windows guests don't support NFS/9P/rsync
      # Source: https://github.com/Cimpress-MCP/vagrant-winrm-syncedfolders
      if Vagrant.has_plugin?("vagrant-winrm-syncedfolders")
          override.vm.synced_folder ".", "/vagrant", type: "winrm"
      else
          override.vm.synced_folder ".", "/vagrant", disabled: true
      end
      # Enable Hyper-V enlightments - Source: https://blog.wikichoon.com/2014/07/enabling-hyper-v-enlightenments-with-kvm.html
      v.hyperv_feature :name => 'stimer', :state => 'on'
      v.hyperv_feature :name => 'relaxed', :state => 'on'
      v.hyperv_feature :name => 'vapic', :state => 'on'
      v.hyperv_feature :name => 'synic', :state => 'on'
  end


    windows.vm.provider :parallels do |v|
      v.cpus = 2
      v.memory = 4096
      v.name = "Ubuntu Desktop"
      v.update_guest_tools = true
    end

    windows.vm.provider :virtualbox do |v|
      v.check_guest_additions = true
      v.customize ["modifyvm", :id, "--accelerate3d", "on"]
      v.customize ["modifyvm", :id, "--cpus", "4"]
      v.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
      v.customize ["modifyvm", :id, "--hwvirtex", "on"]
      v.customize ["modifyvm", :id, "--memory", "4096"]
      v.customize ["modifyvm", :id, "--natdnsresolver1", "on"]
      v.customize ["modifyvm", :id, "--vram", "256"]
      v.customize ["setextradata", "global", "GUI/SuppressMessages", "all"]
      v.memory = 4096
      v.cpus = 2
    end

    windows.vm.provider :vmware_fusion do |v|
      v.gui = true
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "2"

    windows.vm.provider :vmware_workstation do |v|
      v.gui = true
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "2"
    end
  end
end
