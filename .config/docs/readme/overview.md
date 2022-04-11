## Overview

{{overview}}

This project:

* Currently builds a minimal {{ variables.description }} VM image by default
* May contain multiple templates which will all end in `template.json` and be present in the root of the project
* Automates the process of keeping our [{{ variables.description }} VM images](https://app.vagrantup.com/{{ variables.vagrantup_user }}/boxes/{{ variables.box_basename }}) up-to-date with the latest upstream source by (1) using the `vagrant-cloud` post-processor to automatically upload the box after it is built and (2) running the build with a cronjob
* In some cases, [LatestOS](https://pypi.org/project/latestos/) is used to automatically update the link to the base image / checksums to the latest release

### Supported Virtualization Platforms

This project supports creating boxes for the following virtualization platforms:

- [Hyper-V]({{ repository.group.ansible_roles }}/hyperv) <!-- SUPPORTED_OS_hyperv-iso -->
- [KVM]({{ repository.group.ansible_roles }}/kvm) <!-- SUPPORTED_OS_qemu -->
- [Parallels]({{ repository.group.ansible_roles }}/parallels) <!-- SUPPORTED_OS_parallels-iso -->
- [VirtualBox]({{ repository.group.ansible_roles }}/virtualbox) <!-- SUPPORTED_OS_virtualbox-iso -->
- [VMWare]({{ repository.group.ansible_roles }}/vmware) <!-- SUPPORTED_OS_vmware-iso -->
