{ ... }:
{
  imports = [
    ./common
    ./common/sops.nix
    ./common/ssh-luks.nix
  ];

  networking.hostName = "nixos-home-server";

  home-manager.users.me = import ../home;

  my.cpu = "amd";

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/a4422541-92d3-4c39-8a04-8d06479bd716";

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c2a26166-1cef-4611-9984-22e390190788";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/79CE-3C58";
      fsType = "vfat";
    };
  };

  system.stateVersion = "23.11";
}
