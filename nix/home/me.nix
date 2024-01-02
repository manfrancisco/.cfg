{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {

  imports = [
    ./common/desktop.nix
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
      ".gitconfig".source = ../../git/.gitconfig;
      ".tmux.conf".source = ../../tmux/.tmux.conf;
      ".vimrc".source = ../../vim/.vimrc;
      ".zshrc".source = ../../zsh/.zshrc;
      # "${configHome}/nvim/".source = ../../nvim/.config/nvim;
      "${configHome}/waybar".source = ../../waybar/.config/waybar;
      "${configHome}/wofi".source = ../../wofi/.config/wofi;
      "${configHome}/zsh".source = ../../zsh/.config/zsh;
    };

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
