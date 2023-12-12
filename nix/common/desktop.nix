{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    transmission-gtk
  ];
}
