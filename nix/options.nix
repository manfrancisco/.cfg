{ lib, ... }:
{
  options = {
    my.desktop-env = lib.mkOption {
      type = with lib.types; nullOr (enum [ "gnome" "hyprland" ]);
      default = "hyprland";
    };
  };
}
