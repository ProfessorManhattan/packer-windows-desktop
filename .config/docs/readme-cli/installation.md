## Installation

There are several ways you can install this CLI. You can:

1. Use our bash scripts which will handle everything automatically with as few dependencies as possible
2. Compile the program using Go and add it to your `PATH`
3. Install it via an NPM convienience wrapper
4. Download the pre-built binary from the GitLab or GitHub releases page and then place it in your `PATH`

### Quick Method

If you are looking to install the CLI as quickly as possible then you can run the following script which will install the binary to your `/usr/local/bin` folder on macOS or Linux:

```
curl -sS https://install.doctor/{{binName}} | bash
```

Or, if you are on Windows, you can install it by running:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://install.doctor/{{binName}}?os=win'))
```

### Compile Program with Go

You can install the CLI by compiling it from the source as long as you have a recent version of Go installed:

```
git clone {{repository.github}}.git
cd {{#withLast (split repository.github "/")}}{{this}}{{/withLast}}
{{build_command}}
sudo mv {{build_command_output}} /usr/local/bin
```

After you compile the program, you should then move the binary file to a location that is in your `PATH` (which is what the last line does in the snippet above).

### NPM Install Method

Every release is bundled into an NPM package that you can install by running the following command:

```
npm install -g {{binName}}
```

### Pre-Built Binary

If you trust us (and you should not.. trust.. anybody.. EVER), then you can also download the binary directly from the {{ name }} GitLab release page or the GitHub release page. After you download the release, you will have to either place the binary somewhere in your `PATH` or run the installer (in the case of the `.deb` or `.rpm` releases, for instance).
