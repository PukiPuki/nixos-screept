mkfs.btrfs -L root -f /dev/sda
mount -t btrfs -o noatime,discard,ssd,autodefrag,compress=lzo,space_cache /dev/sda /mnt/
btrfs subvolume create /mnt/nixos
umount /mnt/
mount -t btrfs -o noatime,discard,ssd,autodefrag,compress=lzo,space_cache,subvol=nixos /dev/sda /mnt/
btrfs subvolume create /mnt/var
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/tmp

nixos-generate-config --root /mnt/
vim /mnt/etc/nixos/configuration.nix
