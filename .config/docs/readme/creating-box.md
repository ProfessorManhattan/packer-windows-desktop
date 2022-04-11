## Creating Your Own Box

You can quickly use this project to create your own minimal {{ template_json.variables.description }} box by:

1. Creating a box on VagrantUp titled {{ template_json.variables.box_basename }} (Note: The VagrantUp box name should match the `"box_basename"` in the `template.json` file.)
2. Changing the `"vagrantup_user"` variable in `template.json` to your VagrantUp username
3. Acquiring a VagrantUp API token from the settings page
4. Running the following code

```shell
bash start.sh # Ensures Bodega is installed
export VAGRANT_CLOUD_TOKEN=YourTokenHere
task packer:build
```
_[What is Bodega?](https://github.com/ProfessorManhattan/Bodega)_

After running the code above, you will kick off a parallelized build for all the virtualization platforms that your computer currently has installed. If you want to install all of the virtualization platforms that your computer could potentially support then you can run `task packer:install:platforms`.

After building the VM images, the example above will upload your images to your VagrantUp box repository _(that you have to create before running the script that is above)_. If you want to build the box for another provider then look at the `template.json` in the `"builders"` section for the types of boxes you can create (e.g. `virtualbox-iso`, `vmware-iso`, `parallels-iso`, `qemu`).

If you do not want your box to be automatically uploaded to VagrantUp after you build it with Packer then you will need to remove the `"vagrant-cloud"` section under `"post-processors"`. The section is wrapped in a nested array. If you are removing the `vagrant-cloud` post-processor, then the section no longer has to be placed in a nested array.
