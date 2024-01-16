{ ... }:
{
  imports = [
    ./common
    ./common/desktop
    ./common/hyprland.nix
  ];

  wayland.windowManager.hyprland.settings."$mod" = "Super";
}
