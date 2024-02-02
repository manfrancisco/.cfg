{ pkgs, ... }:
{
  imports = [
    ../options.nix
    ./common
  ];

  networking.hostName = "nixos-laptop";

  my.desktop-env = "hyprland";

  home-manager.users.me = { pkgs, ... }: {
    imports = [ ../home ];

    wayland.windowManager.hyprland.settings = {
      "$mod" = "Super";
      bind = [
          # Screen backlight controls
          ",XF86MonBrightnessUp, exec, brightnessctl set 10%+"
          ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"

          # Keyboard backlight controls
          '',XF86KbdBrightnessUp, exec, brightnessctl -d "apple::kbd_backlight" set 20%+''
          '',XF86KbdBrightnessDown, exec, brightnessctl -d "apple::kbd_backlight" set 20%-''
      ];
    };

    home.packages = [ pkgs.brightnessctl ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/108ff579-6add-4f0e-9f29-676e5ff68366";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/D065-CF3D";
      fsType = "vfat";
    };
  };

  # The only sleep setting that seems to sort of work
  systemd.sleep.extraConfig = ''
    SuspendState=freeze
  '';

  # Broadcom Wi-Fi firmware
  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "brcm-firmware";

      buildCommand = ''
        dir="$out/lib/firmware/brcm";
        mkdir -p "$dir"
        cp -r ${./common/firmware/brcm}/* "$dir"
      '';
    })
  ];

  # Recommended setup for T2 Macs
  networking = {
    wireless.iwd.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  system.stateVersion = "23.05";
}
