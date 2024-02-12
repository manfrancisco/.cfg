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
      desktop = {
        enable = mkBool {};
        cinnamon.enable = mkBool {};
        gnome.enable = mkBool {};
        hyprland = {
          enable = mkBool {};
          autologin.enable = mkBool {};
        };
        nvidia.enable = mkBool {};
        plasma5.enable = mkBool {};
        steam.enable = mkBool {};
      };
    };
  };
}
