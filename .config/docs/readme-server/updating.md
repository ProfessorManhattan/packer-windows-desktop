## Updating Your Box

If a new release of the {{ variables.description }} system is available, you can update your VagrantUp box. You can do this by changing the `"iso_checksum_url"`, `"iso_url"`, and `"iso_version"` variables in the `template.json` file. After that, run `packer build -only=virtualbox-iso template.json` to build the image again.

You can also automate the process of retrieving the latest ISO and checksum URL by leveraging our [LatestOS](https://pypi.org/project/latestos/) Python package. This can be accomplished by running the following code with [Python](https://github.com/ProfessorManhattan/ansible-python) and pip already installed:

```shell
pip3 install latestos
latestos {{ variables.latestos_tag }} # Options include arch, centos, debian, fedora, and ubuntu
packer build -only=virtualbox-iso template.json
```
