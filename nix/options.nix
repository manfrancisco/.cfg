{ lib, ... }:
{
  options = {
    my = with lib; with types; {
      desktop-env = mkOption {
        type = nullOr (enum [ "gnome" "hyprland" ]);
        default = null;
      };
      cpu = mkOption {
        type = enum [ "amd" "intel" ];
        default = "intel";
      };
      arch = mkOption {
        type = enum [ "x86_64-linux" ];
        default = "x86_64-linux";
      };
    };
  };
}
