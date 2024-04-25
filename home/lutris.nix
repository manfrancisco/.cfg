{ config, lib, pkgs, ... }: {
  options.my.lutris = lib.my.mkEnableOption false;

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
