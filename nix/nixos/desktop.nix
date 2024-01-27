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

  home-manager.users.me = { lib, ... }: {
    imports = [ ../home ];

    wayland.windowManager.hyprland.settings = {
      monitor = [
        "DP-1, 1920x1080, 0x0, 1"
        "HDMI-A-1, 1920x1080, 1920x0, 1"
      ];
      workspace = [
        "1, monitor:DP-1"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
      ];
    };
  };

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

  system.stateVersion = "23.05";
}
