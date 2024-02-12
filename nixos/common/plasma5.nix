{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.my.desktop.plasma5.enable {
    services.xserver = {
      enable = true;
      displayManager = {
        sddm.enable = lib.mkDefault true;
      };
      desktopManager.plasma5.enable = true;
      # Touchpad support
      libinput.enable = true;
    };

    environment.plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
    ];
  };
}
