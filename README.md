# InstallArch
A collection of scripts to install Arch Linux, with an optional script that installs other packages.

### Instructions

Note: This currently only works of EFI systems with 3 partitions: EFI, swap, and root filesystem. The drives must be partitioned before running the script.

To run the scripts, boot to the Arch Linux iso and create your partitions if you have not already. Run the following commands:

```bash
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/arch_install.sh > arch_install.sh

chmod +x arch_install.sh

./arch_install.sh
```

Follow the prompts to select your drive partitions, computer hostname, root password, set up a new user, and choose whether to install the optional set of packages.
