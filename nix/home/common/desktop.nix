{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    gimp
    transmission-gtk
  ];

  programs.browserpass.enable = true;

  services.gpg-agent.pinentryFlavor = "qt";
}
