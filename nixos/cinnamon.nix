{ config, lib, ... }: {
  options.my.cinnamon = lib.my.mkEnableOption false;

  config = lib.mkIf config.my.cinnamon.enable {
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
