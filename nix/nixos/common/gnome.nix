{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.my.desktop.gnome.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = lib.mkDefault true;
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
      gedit
      gnome-photos
      gnome-tour
    ]) ++ (with pkgs.gnome; [
      atomix
      cheese
      epiphany
      evince
      iagno
      gnome-characters
      gnome-music
      gnome-terminal
      hitori
      tali
      totem
    ]);

    hardware.pulseaudio.enable = false;
  };
}
