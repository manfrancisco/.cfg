{ config, lib, ... }: {
  options.my.sound = lib.my.mkEnableOption false;

  config = lib.mkIf config.my.sound.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
