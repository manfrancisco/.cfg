{ config, lib, pkgs, ... }:
let
  lib' = import ../lib.nix { inherit lib; };
in {
  options.my.lutris = lib'.mkEnableOption false;

  config = lib.mkIf config.my.lutris.enable {
    home.packages = with pkgs; [
      (lutris.override {
        extraLibraries = pkgs: [ ];
        extraPkgs = pkgs: [ ];
      })
      wineWowPackages.stable
      winetricks
    ];
  };
}
