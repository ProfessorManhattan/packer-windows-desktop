## Updating Your Box

If a new release of the {{ template_json.variables.description }} system is available, you can update your VagrantUp box. You can do this by changing the `"iso_checksum_url"`, `"iso_url"`, and `"iso_version"` variables in the `template.json` file. After that, run `packer build -only=virtualbox-iso template.json` to build the image again.

You can also automate the process of retrieving the latest ISO and checksum URL by leveraging our [LatestOS](https://github.com/megabyte-labs/latestos/) Python package. This can be accomplished by running the following code with Python and pip already installed:

```shell
pip3 install latestos
latestos {{ template_json.variables.latestos_tag }} # Options include arch, centos, debian, fedora, and ubuntu
packer build -only=virtualbox-iso template.json
```
