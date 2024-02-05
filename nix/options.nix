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
      desktop = {
        enable = mkOption {
          type = bool;
          default = false;
        };
        cinnamon.enable = mkOption {
          type = bool;
          default = false;
        };
        gnome.enable = mkOption {
          type = bool;
          default = false;
        };
        hyprland.enable = mkOption {
          type = bool;
          default = false;
        };
        nvidia.enable = mkOption {
          type = bool;
          default = false;
        };
        steam.enable = mkOption {
          type = bool;
          default = false;
        };
      };
    };
  };
}
