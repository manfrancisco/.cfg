{ lib, pkgs, ... }:
let
  inherit (lib) mkDefault;
in {
  services.xserver = {
    displayManager.gdm.enable = mkDefault true;
    desktopManager.gnome.enable = true;
    # Touchpad support
    libinput.enable = true;
  };

  # services.gnome.gnome-browser-connector.enable = true;
  # nixpkgs.config.firefox.enableGnomeExtensions = true;
  # services.gnome.chrome-gnome-shell.enable = true;

  environment.systemPackages = with pkgs.gnome; [
    adwaita-icon-theme
    gnome-tweaks
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    atomix
    cheese
    epiphany
    evince
    iagno
    gedit
    gnome-characters
    gnome-music
    gnome-terminal
    hitori
    tali
    totem
  ]);

  hardware.pulseaudio.enable = false;
}
