# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.2"

Vagrant.configure("2") do |config|

  config.ssh.password = "vagrant"
  config.ssh.username = "vagrant"

  config.vm.define "windows" do |os|
    os.vm.box="Megabyte/Windows-Desktop"
    os.vm.hostname = "vagrant-windows"

    os.vm.network "forwarded_port", guest: 22, host: 58022, id: "ssh", auto_correct: true
    os.vm.network "forwarded_port", guest: 3389, host: 53389, id: "rdp", auto_correct: true
    os.vm.network "forwarded_port", guest: 443, host: 58443, id: "https", auto_correct: true
    os.vm.network "forwarded_port", guest: 80, host: 58080, id: "http", auto_correct: true

    os.vm.provider "hyperv" do |v|
      v.cpus = 2
      v.maxmemory = 4096
      v.vmname = "Windows 10 Enterprise (Insider's Preview)"
    end

    os.vm.provider "libvirt" do |v, override|
      v.cpus = 2
      v.memory = 4096
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


    os.vm.provider "parallels" do |v|
      v.cpus = 2
      v.memory = 4096
      v.name = "Windows 10 Enterprise (Insider's Preview)"
      v.update_guest_tools = true
    end

    os.vm.provider "virtualbox" do |v|
      v.check_guest_additions = true
      v.cpus = 2
      v.customize ["modifyvm", :id, "--accelerate3d", "on"]
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
      v.customize ["modifyvm", :id, "--hwvirtex", "on"]
      v.customize ["modifyvm", :id, "--memory", "4096"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--vram", "256"]
      v.customize ["setextradata", "global", "GUI/SuppressMessages", "all"]
      v.gui = true
      v.memory = 4096
      v.name = "Windows 10 Enterprise (Insider's Preview)"
    end

    os.vm.provider "vmware_fusion" do |v|
      v.gui = true
      v.vmx["ethernet0.virtualDev"] = "vmxnet3"
      v.vmx["gui.fitGuestUsingNativeDisplayResolution"] = "TRUE"
      v.vmx["gui.fullScreenAtPowerOn"] = "TRUE"
      v.vmx["gui.lastPoweredViewMode"] = "fullscreen"
      v.vmx["gui.viewModeAtPowerOn"] = "fullscreen"
      v.vmx["memsize"] = "4096"
      v.vmx["mks.enable3d"] = "TRUE"
      v.vmx["mks.forceDiscreteGPU"] = "TRUE"
      v.vmx["numvcpus"] = "2"
      v.vmx["RemoteDisplay.vnc.enabled"] = "TRUE"
      v.vmx["RemoteDisplay.vnc.port"] = "5900"
      v.vmx["sound.autodetect"] = "TRUE"
      v.vmx["sound.present"] = "TRUE"
      v.vmx["sound.startConnected"] = "TRUE"
    end

    os.vm.provider "vmware_workstation" do |v|
      v.gui = true
      v.vmx["ethernet0.virtualDev"] = "vmxnet3"
      v.vmx["gui.fitGuestUsingNativeDisplayResolution"] = "TRUE"
      v.vmx["gui.fullScreenAtPowerOn"] = "TRUE"
      v.vmx["gui.lastPoweredViewMode"] = "fullscreen"
      v.vmx["gui.viewModeAtPowerOn"] = "fullscreen"
      v.vmx["memsize"] = "4096"
      v.vmx["mks.enable3d"] = "TRUE"
      v.vmx["mks.forceDiscreteGPU"] = "TRUE"
      v.vmx["numvcpus"] = "2"
      v.vmx["RemoteDisplay.vnc.enabled"] = "TRUE"
      v.vmx["RemoteDisplay.vnc.port"] = "5900"
      v.vmx["sound.autodetect"] = "TRUE"
      v.vmx["sound.present"] = "TRUE"
      v.vmx["sound.startConnected"] = "TRUE"
    end
  end
end
