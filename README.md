# InstallArch

This only works of EFI systems with 3 partitions: EFI, swap, and root filesystem. The drives must be partitioned before running the script.

To run the scripts, boot to the Arch Linux iso, create the partitions, and run:

```bash
curl -L https://raw.githubusercontent.com/Zombant/InstallArch/master/arch_install.sh > arch_install.sh

chmod +x arch_install.sh

./arch_install.sh
```
