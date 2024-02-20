{ config, lib, ... }:
{
  config = lib.mkIf config.my.desktop.hyprland.enable {
    hardware = {
      opengl.enable = true;
      # Most wayland compositors need this
      nvidia.modesetting.enable = true;
    };
  };
}
