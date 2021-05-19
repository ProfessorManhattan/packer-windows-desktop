New-Item -ItemType directory -Path C:\Users\vagrant\.ssh
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub" -OutFile "C:\Users\vagrant\.ssh\authorized_keys"
