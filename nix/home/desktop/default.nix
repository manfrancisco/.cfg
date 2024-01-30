{ lib, osConfig, pkgs, ... }:
{
  imports = [ ../hyprland.nix ];

  config = lib.mkIf (osConfig.my.desktop-env != null) {
    home = {
      packages = with pkgs; [
        chromium
        firefox
        gimp
        transmission-gtk
      ];

      file = {
        ".config/kitty/kitty.conf".source = ./cfg/kitty.conf;
      };
    };

    programs.browserpass.enable = true;

    services.gpg-agent.pinentryFlavor = "qt";
  };
}
