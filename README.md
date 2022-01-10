# InstallArch
A collection of scripts to install Arch Linux, with an optional script that installs other packages.

### Instructions

Note: This currently only works of EFI systems with 3 partitions: EFI, swap, and root filesystem. The drives must be partitioned before running the script.

Start by backing up any data on your drive that you wish to keep.

To run the scripts, boot to the Arch Linux iso and create your partitions if you have not already. Run the following commands:

_Before running the scripts, it is a good idea to read them to make sure there is nothing spooky in the code!!_

```bash
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/arch_install.sh > arch_install.sh

chmod +x arch_install.sh

./arch_install.sh
```

Follow the prompts to select your drive partitions, computer hostname, root password, set up a new user, and choose whether to install the optional set of packages.
