{ lib, ... }:

let
  mkBool = attrs: lib.mkOption { type = lib.types.bool; default = false; } // attrs;
in {
  options = with lib; with types; {
    my = {
      arch = mkOption {
        type = enum [ "x86_64-linux" ];
        default = "x86_64-linux";
      };
      cpu = mkOption {
        type = enum [ "amd" "intel" ];
        default = "intel";
      };
      server = {
        nextcloud = {
          enable = mkBool {};
          domain = mkOption {
            type = str;
            default = "";
          };
          extraTrustedDomains = mkOption {
            type = listOf str;
            default = [];
          };
        };
        minecraft = {
          vanilla.enable = mkBool {};
          atm9.enable = mkBool {};
        };
        mysql.enable = mkBool {};
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
      sh = {
        nixvim.enable = mkBool { default = true; };
      };
    };
  };
}
