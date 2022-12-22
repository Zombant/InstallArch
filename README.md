# InstallArch

### Instructions

This currently only works of EFI systems with 3 partitions: EFI, swap, and root filesystem. The drives must be partitioned before running the script.

Start by backing up any data on your drive that you wish to keep.

To run the scripts, boot to the Arch Linux iso and create your partitions if you have not already. Run the following commands:


```bash
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/arch_install.sh > arch_install.sh

chmod +x arch_install.sh

./arch_install.sh
```
