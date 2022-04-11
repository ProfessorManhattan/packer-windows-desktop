## Overview

Our VM images aim to be minimal, performant, and pretty. They are minimal because they remove unnecessary files and are compressed before uploading them to [VagrantUp](https://www.vagrantup.com/). Our images are performant because we choose the right configurations. We also ensure there is a seamless experience by including the Plymouth boot loader (which makes them _prettier_).

A popular repository on GitHub called [chef/bento](https://github.com/chef/bento/tree/master/packer_templates) has already done most of the work we are trying to accomplish. They have Packer templates for everything we aim to support except [Archlinux]({{ repository.group.packer }}/base-archlinux-desktop) and [Mac OS X]({{ repository.group.packer }}/base-mac-desktop). Since it has a huge following, updates are likely to be provided. We use chef/bento's source wherever possible. They provide shell scripts that do a lot of the setup needed to initialize boxes. In each of our repositories (except Archlinux and Mac OS X), you can see that we symlink to a chef/bento submodule. By doing this, we are able to receive updates directly from our upstream code provider.

However, chef/bento's work is not perfect for our use case. There are a few changes we make to each of our repositories. The `template.json` is reformatted to be neater and slightly easier to read. There are also additional scripts we run to convert the distribution into a desktop environment. These scripts that we make and add to the build routine all end with `.custom.sh` and are located in the `scripts/` folder.

Ideally, five years from now, if you go to [our VagrantUp repositories]({{ profile.vagrant }}) you will be able to browse through all the various releases in any OS distribution. Our goal is to accomplish this through automation by:

- Including the [vagrant-cloud post-processor](https://www.packer.io/docs/post-processors/vagrant-cloud)
- Leveraging [LatestOS](https://pypi.org/project/latestos/) to automatically detect the latest release of the Linux variants we build boxes for
- Running the builds on a cronjob

### Virtualization Platforms

We aim to support the following virtualization platforms:

- [Hyper-V]({{ repository.group.ansible_roles }}/hyperv)
- [KVM]({{ repository.group.ansible_roles }}/kvm)
- [Parallels]({{ repository.group.ansible_roles }}/parallels)
- [VirtualBox]({{ repository.group.ansible_roles }}/virtualbox)
- [VMWare]({{ repository.group.ansible_roles }}/vmware)
