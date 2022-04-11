## Formatting the Template

In each of our Packer repositories, you will see a file named `template.json`. This serves as the configuration file that Packer uses when building our boxes. Please follow the guidelines below when formatting a `template.json` file:

- The `"variables"` section should be at the top of the `template.json` file.
- Make sure the variable names are consistent across [our Packer repositories]({{ repository.group.packer }}).
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
