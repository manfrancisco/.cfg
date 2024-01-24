{ config, lib, pkgs, ... }:
{
  config = lib.mkIf (config.my.desktop-env == "hyprland") {
    hardware = {
      opengl.enable = true;
      # Most wayland compositors need this
      nvidia.modesetting.enable = true;
    };
  };
}
