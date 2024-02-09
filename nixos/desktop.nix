{ nixvim, ... }:
{
  imports = [
    ../options.nix
    ./common/sops.nix
    ./common
  ];

  networking.hostName = "nixos-desktop";

  my.desktop = {
    enable = true;
    hyprland.enable = true;
    hyprland.autologin.enable = true;
    nvidia.enable = true;
    steam.enable = true;
  };

  home-manager.users.me = { lib, osConfig, pkgs, ... }:
  let
    ifHyprland = lib.mkIf osConfig.my.desktop.hyprland.enable;
    ifGnome = lib.mkIf osConfig.my.desktop.gnome.enable;
  in {
    imports = [ ../home nixvim ];

    home.packages = with pkgs; [
      btrfs-progs
      chromium
      libreoffice
      vscode
    ];

    wayland.windowManager.hyprland.settings = ifHyprland {
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

    dconf.settings = ifGnome {
      "org/gnome/desktop/input-sources" = {
        # Switch left Alt with left Win
        xkb-options = [ "altwin:swap_lalt_lwin" ];
      };
    };
  };

  sops.secrets.luks-key-data = {
    sopsFile = ../secrets/nixos-desktop.yaml;
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
    "/data" = {
      device = "/dev/mapper/data";
      fsType = "btrfs";
      options = [ "subvol=data" "compress=zstd" "noatime" ];
    };
  };

  environment.etc.crypttab.text = ''
    data /dev/disk/by-uuid/d955c8ca-ba4e-4cf7-b487-e93f2bad16d3 /run/secrets/luks-key-data
  '';

  system.stateVersion = "23.05";
}
