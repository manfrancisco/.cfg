{ lib, ... }:
let
  inherit (lib) mkDefault mkOverride;
in {
  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = mkOverride 900 "hyprland";
      # AutoLogin is currently borked with hyprland
      autoLogin.enable = mkDefault false;
      autoLogin.user = "me";
    };
    # Touchpad support
    libinput.enable = true;
  };

}
