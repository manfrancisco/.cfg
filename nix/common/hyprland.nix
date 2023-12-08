{ lib, pkgs, ... }:
let
  inherit (lib) mkDefault mkOverride;
in {

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };

  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = mkDefault true;
      defaultSession = mkOverride 900 "hyprland";
      autoLogin.enable = mkDefault true;
      autoLogin.user = "me";
    };
    # Touchpad support
    libinput.enable = true;
  };

  hardware = {
    opengl.enable = true;
    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    inotify-tools
    fantasque-sans-mono
    fira-code-nerdfont
    pavucontrol
    pulseaudio
    psmisc # killall
    swaybg
    waybar
    wl-clipboard
    wofi
  ];

  nixpkgs.config.joypixels.acceptLicense = true;

}
