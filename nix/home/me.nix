{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {

  imports = [
    ./common/desktop
    ./common/gpg.nix
    ./common/hyprland
    ./common/pass.nix
    ./common/ranger.nix
    ./common/sh
  ];

  home = {
    username = "me";
    homeDirectory = "/home/me";

    file = {
      "${configHome}/wofi".source = ../../wofi/.config/wofi;
      "${configHome}/zsh".source = ../../zsh/.config/zsh;
    };

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
