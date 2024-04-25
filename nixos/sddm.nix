{ config, lib, ... }: {
  options.my.sddm = lib.my.mkEnableOption false;

  config = lib.mkIf config.my.sddm.enable {
    services.xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
        defaultSession = lib.mkOverride 900 "hyprland";
        # AutoLogin is currently borked with hyprland
        autoLogin.enable = lib.mkDefault false;
        autoLogin.user = "me";
      };
      # Touchpad support
      libinput.enable = true;
    };
  };
}
