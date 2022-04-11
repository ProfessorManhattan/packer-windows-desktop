## Philosophy

We create these Packer images because the desktop versions of operating systems on VagrantUp are sparse. During development it is useful to be able to navigate through an operating system using a GUI. Also, if you want to test some of your software on various operating systems then you should use what your end-user is using. Sometimes that means using a desktop.

There are a few core principles that we stick to when designing these Packer projects. All of our desktop VM images should be:

- **Minimal** and include no bloatware
- **Compact** in size so people can download/provision their VM quicker
- **Pretty** (e.g. the Plymouth loader should be installed so that the boot screen looks good)
- **Performant**
