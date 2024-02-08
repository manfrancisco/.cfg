{ lib, osConfig, pkgs, ... }:
{
  imports = [
    ../gnome.nix
    ../hyprland.nix
  ];

  config = lib.mkIf osConfig.my.desktop.enable {
    home = {
      packages = with pkgs; [
        firefox
        gimp
        transmission-gtk
        wl-clipboard
      ];

      file = {
        ".config/kitty/kitty.conf".source = ./cfg/kitty.conf;
      };
    };

    programs.browserpass.enable = true;

    services.gpg-agent.pinentryFlavor = "qt";
  };
}
