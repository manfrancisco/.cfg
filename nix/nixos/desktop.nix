{ ... }:
{
  imports = [
    ../options.nix
    ./common
  ];

  networking.hostName = "nixos-desktop";

  my.desktop = {
    enable = true;
    gnome.enable = true;
    nvidia.enable = true;
    steam.enable = true;
  };

  home-manager.users.me = { lib, pkgs, ... }: {
    imports = [ ../home ];

    home.packages = [ pkgs.chromium ];

    wayland.windowManager.hyprland.settings = {
      monitor = [
        "DP-3, 1920x1080, 0x0, 1"
        "HDMI-A-1, 1920x1080, 1920x0, 1"
      ];
      workspace = [
        "1, monitor:DP-3"
        "2, monitor:DP-3"
        "3, monitor:DP-3"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
      ];
    };
    # Gnome settings
    dconf.settings = {
      "org/gnome/desktop/input-sources" = {
        # Switch left Alt with left Win
        xkb-options = [ "altwin:swap_lalt_lwin" ];
      };
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
