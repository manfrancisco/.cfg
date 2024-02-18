{ lib, ... }:

let
  mkBool = attrs: lib.mkOption { type = lib.types.bool; default = false; } // attrs;
in {
  options = with lib; {
    my = {
      arch = mkOption {
        type = types.enum [ "x86_64-linux" ];
        default = "x86_64-linux";
      };
      cpu = mkOption {
        type = types.enum [ "amd" "intel" ];
        default = "intel";
      };
      server = {
        nextcloud = {
          enable = mkBool {};
          domain = mkOption {
            type = types.str;
            default = "";
          };
        };
      };
      desktop = {
        enable = mkBool {};
        cinnamon.enable = mkBool {};
        gnome.enable = mkBool {};
        hyprland = {
          enable = mkBool {};
          # Do not enable when other DE's are enabled
          autologin.enable = mkBool {};
        };
        lutris.enable = mkBool {};
        nvidia.enable = mkBool {};
        plasma5.enable = mkBool {};
        steam.enable = mkBool {};
      };
    };
  };
}
