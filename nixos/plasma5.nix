{ config, lib, pkgs, ... }: {
  options.my.plasma5 = lib.my.mkEnableOption false;

  config = lib.mkIf config.my.plasma5.enable {
    services.xserver = {
      enable = true;
      displayManager = { sddm.enable = lib.mkDefault true; };
      desktopManager.plasma5.enable = true;
      # Touchpad support
      libinput.enable = true;
    };

    environment.plasma5.excludePackages = with pkgs.libsForQt5; [ elisa ];
  };
}
