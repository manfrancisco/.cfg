{ lib, ... }:
{
  options = {
    my = with lib; with types; {
      arch = mkOption {
        type = enum [ "x86_64-linux" ];
        default = "x86_64-linux";
      };
      cpu = mkOption {
        type = enum [ "amd" "intel" ];
        default = "intel";
      };
      desktop-env = mkOption {
        type = nullOr (enum [ "gnome" "hyprland" ]);
        default = null;
      };
      nvidia.enable = mkOption {
        type = bool;
        default = false;
      };
    };
  };
}
