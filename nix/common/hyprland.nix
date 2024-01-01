{ lib, pkgs, ... }:
let
  inherit (lib) mkDefault mkOverride;
in {

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };

  hardware = {
    opengl.enable = true;
    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    inotify-tools
    joypixels
    pavucontrol
    pulseaudio
    psmisc # killall
    swaybg
    waybar
    wl-clipboard
    wofi
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FantasqueSansMono" "FiraCode" ]; })
  ];

  nixpkgs.config.joypixels.acceptLicense = true;

}
