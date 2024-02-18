{ osConfig, lib, pkgs, ... }: {
  config = lib.mkIf osConfig.my.desktop.lutris.enable {
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
