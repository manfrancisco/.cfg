{ config, lib, ... }:
{
  config = lib.mkIf config.my.desktop.cinnamon.enable {
    services.xserver = {
      enable = true;
      libinput.enable = true;
      desktopManager.cinnamon.enable = true;
      displayManager = {
        lightdm.enable = lib.mkDefault true;
        defaultSession = lib.mkDefault "cinnamon";
      };
    };
    hardware.pulseaudio.enable = false;
  };
}
