{ lib, pkgs, ... }:
let
  inherit (lib) mkDefault;
in {
  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = mkDefault true;
    };
    desktopManager.plasma5.enable = true;
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    plasma-browser-integration
    print-manager
  ];
}
