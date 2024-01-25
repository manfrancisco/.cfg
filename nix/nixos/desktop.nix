{ ... }:
{
  imports = [
    ../options.nix
    ./common
    ./common/hyprland.nix
    ./common/sound.nix
  ];

  networking.hostName = "nixos-desktop";

  my.desktop-env = "hyprland";

  home-manager.users.me = import ../home/nixos-desktop.nix;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/932f6805-4b68-4391-92af-1256c022449a";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/549B-E4CE";
      fsType = "vfat";
    };
  };

  hardware.cpu.intel.updateMicrocode = true;

  system.stateVersion = "23.05";
}
