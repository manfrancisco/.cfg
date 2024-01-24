{ config, lib, ... }:
{
  imports = [
    ../options.nix
    ./common
    ./common/desktop
    ./common/hyprland.nix
  ];

  config = lib.mkIf (config.my.desktop-env == "hyprland" ){
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
}
