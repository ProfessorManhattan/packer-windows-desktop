<!-- ⚠️ This README has been generated from the file(s) ".config/docs/blueprint-contributing.md" ⚠️--><div align="center">
  <center><h1 align="center">Contributing Guide</h1></center>
</div>

First of all, thanks for visiting this page 😊 ❤️ ! We are _stoked_ that you may be considering contributing to this project. You should read this guide if you are considering creating a pull request or plan to modify the code for your own purposes.

<a href="#table-of-contents" style="width:100%"><img style="width:100%" src="https://gitlab.com/megabyte-labs/assets/-/raw/master/png/aqua-divider.png" /></a>

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Overview](#overview)
  - [Virtualization Platforms](#virtualization-platforms)
- [Philosophy](#philosophy)
- [Getting Started](#getting-started)
  - [NPM Tasks Available](#npm-tasks-available)
- [Pull Requests](#pull-requests)
  - [How to Commit Code](#how-to-commit-code)
  - [Pre-Commit Hook](#pre-commit-hook)
- [Formatting the Template](#formatting-the-template)
  - [Conversion to HCL](#conversion-to-hcl)

<a href="#code-of-conduct" style="width:100%"><img style="width:100%" src="https://gitlab.com/megabyte-labs/assets/-/raw/master/png/aqua-divider.png" /></a>

## Code of Conduct

This project and everyone participating in it is governed by the [Code of Conduct](https://github.com/megabyte-labs/packer-windows-desktop/blob/master/docs/CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [help@megabyte.space](mailto:help@megabyte.space).

<a href="#overview" style="width:100%"><img style="width:100%" src="https://gitlab.com/megabyte-labs/assets/-/raw/master/png/aqua-divider.png" /></a>

## Overview

Our VM images aim to be minimal, performant, and pretty. They are minimal because they remove unnecessary files and are compressed before uploading them to [VagrantUp](https://www.vagrantup.com/). Our images are performant because we choose the right configurations. We also ensure there is a seamless experience by including the Plymouth boot loader (which makes them _prettier_).

A popular repository on GitHub called [chef/bento](https://github.com/chef/bento/tree/master/packer_templates) has already done most of the work we are trying to accomplish. They have Packer templates for everything we aim to support except [Archlinux](https://gitlab.com/megabyte-labs/packer/base-archlinux-desktop) and [Mac OS X](https://gitlab.com/megabyte-labs/packer/base-mac-desktop). Since it has a huge following, updates are likely to be provided. We use chef/bento's source wherever possible. They provide shell scripts that do a lot of the setup needed to initialize boxes. In each of our repositories (except Archlinux and Mac OS X), you can see that we symlink to a chef/bento submodule. By doing this, we are able to receive updates directly from our upstream code provider.

However, chef/bento's work is not perfect for our use case. There are a few changes we make to each of our repositories. The `template.json` is reformatted to be neater and slightly easier to read. There are also additional scripts we run to convert the distribution into a desktop environment. These scripts that we make and add to the build routine all end with `.custom.sh` and are located in the `scripts/` folder.

Ideally, five years from now, if you go to [our VagrantUp repositories](ProfessorManhattan) you will be able to browse through all the various releases in any OS distribution. Our goal is to accomplish this through automation by:

- Including the [vagrant-cloud post-processor](https://www.packer.io/docs/post-processors/vagrant-cloud)
- Leveraging [LatestOS](https://pypi.org/project/latestos/) to automatically detect the latest release of the Linux variants we build boxes for
- Running the builds on a cronjob

### Virtualization Platforms

We aim to support the following virtualization platforms:

- [Hyper-V](https://gitlab.com/megabyte-labs/ansible-roles/hyperv)
- [KVM](https://gitlab.com/megabyte-labs/ansible-roles/kvm)
- [Parallels](https://gitlab.com/megabyte-labs/ansible-roles/parallels)
- [VirtualBox](https://gitlab.com/megabyte-labs/ansible-roles/virtualbox)
- [VMWare](https://gitlab.com/megabyte-labs/ansible-roles/vmware)

<a href="#philosophy" style="width:100%"><img style="width:100%" src="https://gitlab.com/megabyte-labs/assets/-/raw/master/png/aqua-divider.png" /></a>

## Philosophy

We create these Packer images because the desktop versions of operating systems on VagrantUp are sparse. During development it is useful to be able to navigate through an operating system using a GUI. Also, if you want to test some of your software on various operating systems then you should use what your end-user is using. Sometimes that means using a desktop.

There are a few core principles that we stick to when designing these Packer projects. All of our desktop VM images should be:

- **Minimal** and include no bloatware
- **Compact** in size so people can download/provision their VM quicker
- **Pretty** (e.g. the Plymouth loader should be installed so that the boot screen looks good)
- **Performant**

<a href="#getting-started" style="width:100%"><img style="width:100%" src="https://gitlab.com/megabyte-labs/assets/-/raw/master/png/aqua-divider.png" /></a>

## Getting Started

This repository leverages Node.js to provide linting, auto-fixing, and streamline the commit process. With Node.js (version 12 or higher) installed, you can start up the project's development environment by running:

```
npm i
```

This will install all the Node.js dependencies and automatically register a pre-commit hook.

### NPM Tasks Available

With the dependencies installed, you can see a list of the available commands by running `npm run info`. This will log a help menu to the console informing you about the available commands and what they do. After running the command, you will see something that looks like this:

```
❯ npm run info

> packer-project@1.0.0 info
> npm-scripts-info

build:
  Build all of the images
build:hyperv:
  Build a Hyper-V image
build:kvm:
  Build a QEMU/KVM image
build:parallels:
  Build a Parallels image
build:virtualbox:
  Build a VirtualBox image
build:vmware:
  Build a VMWare image
commit:
  The preferred way of running git commit (instead of git commit, we prefer running 'npm run commit')
info:
  Logs descriptions of all the npm tasks
fix:
  Automatically fix formatting errors
launch:
  Runs 'vagrant up' to automatically spin up the VM
prepare-release:
  Updates the CHANGELOG with commits made using 'npm run commit'
test:
  Validates the Packer configuration file (i.e. template.json) and performs some other linting
update:
  Runs .update.sh to automatically update meta files and documentation
version:
  Used by 'npm run prepare-release' to update the CHANGELOG
```

According to the help menu above, `npm run build` will run the `build` step described above. You can see exactly what each command is doing by checking out the `package.json` file.

<a href="#pull-requests" style="width:100%"><img style="width:100%" src="https://gitlab.com/megabyte-labs/assets/-/raw/master/png/aqua-divider.png" /></a>

## Pull Requests

All pull requests should be associated with issues. You can find the [issues board on GitLab](https://gitlab.com/megabyte-labs/packer/variables.box_basename/-/issues). The pull requests should be made to [the GitLab repository](https://gitlab.com/megabyte-labs/packer/variables.box_basename) instead of the [GitHub repository](ProfessorManhattan/packer-variables.box_basename). This is because we use GitLab as our primary repository and mirror the changes to GitHub for the community.

### How to Commit Code

Instead of using `git commit`, we prefer that you use `npm run commit`. You will understand why when you try it but basically it streamlines the commit process and helps us generate better CHANGELOG.md files.

### Pre-Commit Hook

Even if you decide not to use `npm run commit`, you will see that `git commit` behaves differently because there is a pre-commit hook that installs automatically after you run `npm i`. This pre-commit hook is there to test your code before committing and help you become a better coder. If you need to bypass the pre-commit hook, then you may add the `--no-verify` tag at the end of your `git commit` command (e.g. `git commit -m "Commit" --no-verify`).

<a href="#formatting-the-template" style="width:100%"><img style="width:100%" src="https://gitlab.com/megabyte-labs/assets/-/raw/master/png/aqua-divider.png" /></a>

## Formatting the Template

In each of our Packer repositories, you will see a file named `template.json`. This serves as the configuration file that Packer uses when building our boxes. Please follow the guidelines below when formatting a `template.json` file:

- The `"variables"` section should be at the top of the `template.json` file.
- Make sure the variable names are consistent across [our Packer repositories](https://gitlab.com/megabyte-labs/packer).
- Prefer naming the variables after the section they will be placed.
  - For example, the variable used for `"ssh_password"` should also be named `"ssh_password"`.
- All the JSON objects should be in alphabetical order with the following exceptions:
  - The `"variables"` section should be at the top of the file.
  - The `"type"` field should be at the top of its section.
- All environment variables should be referenced in capitals. For example, `http_proxy` should be `HTTP_PROXY`. However, the actual user variables in the `"variables"` section should be all lowercased.
- Any text that is shared between multiple builders should be stored as a variable. The only exception is data that is specific to each builder (e.g. `"guest_os_type"` which is only used for Parallels builds).
- Use the https://mirror.arizona.edu as the download location.
- All the variables should start with {{ and then a space. The same is true for the opposite side of the variable.
  - **GOOD:** `{{ user 'variable' }}`
  - **BAD:** `{{user 'variable'}}`
- In general, the `template.json` file should look nearly identical across our different Packer repositories.

### Conversion to HCL

We chose JSON for the template because nearly all the examples on the internet are written in JSON. However, the Packer team is rolling out a new markup language for creating templates called HCL. Some newer features will only be provided for use by HCL templates. Eventually, we plan on porting our templates over to HCL. If you can help with this then please open a pull request! You can actually do a lot of the work automatically by running `packer hcl2_upgrade template.json` but some manual oversight is necessary to keep the configuration neat.
