{ config, pkgs, ... }:
{
  imports = [
    ./common
    ./common/desktop
    ./common/hyprland
  ];
}
