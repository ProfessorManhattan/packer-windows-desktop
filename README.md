<!-- ⚠️ This README has been generated from the file(s) "./.modules/docs/blueprint-readme.md" ⚠️--><h1 align="center" style="text-align:center;">Packer Template: Windows 10 Desktop</h1>

<div align="center">
  <h4>
    <a href="https://app.vagrantup.com/ProfessorManhattan">VagrantUp Profile</a>
    <span> | </span>
    <a href="https://app.vagrantup.com/ProfessorManhattan/boxes/Base-Windows-Desktop">VagrantUp Box</a>
    <span> | </span>
    <a href="https://gitlab.com/megabyte-space/packer/Base-Windows-Desktop/-/blob/master/CONTRIBUTING.md">Contributing</a>
    <span> | </span>
    <a href="https://app.slack.com/client/T01ABCG4NK1/C01NN74H0LW/details/">Chat</a>
    <span> | </span>
    <a href="https://megabyte.space">Website</a>
  </h4>
</div>
<p style="text-align:center;">
  <a href="https://gitlab.com/megabyte-space/packer/Base-Windows-Desktop">
    <img alt="Version" src="https://img.shields.io/badge/version-10.0.19043-blue.svg?cacheSeconds=2592000" />
  </a>
  <a href="https://megabyte.space/docs/packer" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://gitlab.com/megabyte-space/packer/Base-Windows-Desktop/-/raw/master/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/PrfssrManhattan" target="_blank">
    <img alt="Twitter: PrfssrManhattan" src="https://img.shields.io/twitter/follow/PrfssrManhattan.svg?style=social" />
  </a>
</p>

<p align="center" style="text-align:center;">
  <b>A Packer project that builds a minimal, compact, and performant VagrantUp Windows 10 Desktop boxes</b></br>
</p>


[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)](#table-of-contents)

## ➤ Table of Contents

* [➤ Overview](#-overview)
	* [Supported Virtualization Platforms](#supported-virtualization-platforms)
* [➤ Requirements](#-requirements)
* [➤ Quick Start](#-quick-start)
* [➤ Creating Your Own Box](#-creating-your-own-box)
* [➤ Updating Your Box](#-updating-your-box)
* [➤ Contributing](#-contributing)
* [➤ License](#-license)

[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)](#overview)

## ➤ Overview

This repository contains the source code used to automatically build minimal Windows 10 Desktop VM images. The build process closely imitates the same process used by [chef/bento](https://github.com/chef/bento). In fact, you will see that most of the `scripts/` folder is symlinked to a chef/bento submodule.

This repository automates most of the process of keeping our [Windows 10 Desktop VM images](https://app.vagrantup.com/ProfessorManhattan/boxes/Base-Windows-Desktop) up-to-date with the latest upstream source by:

* Using the vagrant-cloud post-processor to automatically upload the box after it is built
* Automating the retrieval of the source ISO file and checksum file by using another project of ours called [LatestOS](https://pypi.org/project/latestos/)
* Running the Packer build with a cronjob

### Supported Virtualization Platforms

Most of our repositories support creating boxes for the following virtualization platforms:

* [Hyper-V](https://gitlab.com/megabyte-space/ansible-roles/hyperv)
* [KVM](https://gitlab.com/megabyte-space/ansible-roles/kvm)
* [Parallels](https://gitlab.com/megabyte-space/ansible-roles/parallels)
* [VirtualBox](https://gitlab.com/megabyte-space/ansible-roles/virtualbox)
* [VMWare](https://gitlab.com/megabyte-space/ansible-roles/vmware)

Please note that not all of [our Packer projects](https://gitlab.com/megabyte-space/packer) support building for all of the virtualization platforms listed above. You can check out exactly what platforms this repository supports by browsing through the types in the `"builders"` section of the `template.json` file found in the root of this repository.


[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)](#requirements)

## ➤ Requirements

* At least one of the above virtualization platforms installed ([VirtualBox](https://gitlab.com/megabyte-space/ansible-roles/virtualbox) is a good starting point if you do not already have one of the platforms installed)
* [Packer](https://gitlab.com/megabyte-space/ansible-roles/packer)
* [Vagrant](https://gitlab.com/megabyte-space/ansible-roles/vagrant)


[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)](#quick-start)

## ➤ Quick Start

If you have VirtualBox and Vagrant installed, you can quickly spin up the finished product of this repository by running the following code in the root directory of this repository:

```shell
vagrant up
```

The default username and password are both *vagrant*.


[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)](#creating-your-own-box)

## ➤ Creating Your Own Box

You can quickly use this project to create your own minimal Windows 10 Desktop box by:

1. Creating a box on VagrantUp titled Base-Windows-Desktop - *Note: You can change the title by modifying the `"box_basename"` variable in `template.json`*
2. Changing the `"vagrantup_user"` variable in `template.json` to your VagrantUp username
3. Acquiring a VagrantUp API token from the settings page
4. Running the following code

```shell
bash .update.sh # Ensures your repository is up-to-date
export VAGRANT_CLOUD_TOKEN=YourTokenHere
packer build -only=virtualbox-iso template.json
```

The example above will build a VirtualBox Windows 10 Desktop box and upload it to your VagrantUp box repository *(that you have to create before running the script that is above)*. If you want to build the box for another provider then look at the `template.json` in the `"builders"` section for the types of boxes you can create (e.g. `virtualbox-iso`, `vmware-iso`, `parallels-iso`, `qemu`).

If you do not want your box to be automatically uploaded to VagrantUp after you build it with Packer then you will need to remove the `"vagrant-cloud"` section under `"post-processors"`. The section is wrapped in a nested array. If you are removing the `vagrant-cloud` post-processor, then the section no longer has to be placed in a nested array.


[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)](#updating-your-box)

## ➤ Updating Your Box

If a new release of the Windows 10 Desktop system is available, you can update your VagrantUp box. You can do this by changing the `"iso_checksum_url"`, `"iso_url"`, and `"iso_version"` variables in the `template.json` file. After that, run `packer build -only=virtualbox-iso template.json` and you should be golden.

You can also automate the process of retrieving the latest ISO and checksum URL by leveraging our [LatestOS](https://pypi.org/project/latestos/) Python package. This can be accomplished by running the following code with Python and pip already installed:

```shell
pip3 install latestos
latestos variables.latestos_tag # Options include arch, centos, debian, fedora, and ubuntu
packer build -only=virtualbox-iso template.json
```


[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)](#contributing)

## ➤ Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://gitlab.com/megabyte-space/packer/Base-Windows-Desktop/-/issues). If you would like to contribute, please take a look at the [contributing guide](https://gitlab.com/megabyte-space/packer/Base-Windows-Desktop/-/blob/master/CONTRIBUTING.md).

<details>
<summary>Sponsorship</summary>
<br/>
<blockquote>
<br/>
I create open source projects out of love. Although I have a job, shelter, and as much fast food as I can handle, it would still be pretty cool to be appreciated by the community for something I have spent a lot of time and money on. Please consider sponsoring me! Who knows? Maybe I will be able to quit my job and publish open source full time.
<br/><br/>Sincerely,<br/><br/>

***Brian Zalewski***<br/><br/>
</blockquote>

<a href="https://www.patreon.com/ProfessorManhattan">
  <img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>

</details>


[![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)](#license)

## ➤ License

Copyright © 2021 [Megabyte LLC](https://megabyte.space). This project is [MIT](https://gitlab.com/megabyte-space/packer/Base-Windows-Desktop/-/raw/master/LICENSE) licensed.

