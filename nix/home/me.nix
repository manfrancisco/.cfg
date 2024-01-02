{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {

  imports = [
    ./common/ranger.nix
    ./common/desktop.nix
    ./common/gpg.nix
  ];

  home = {
    username = "me";
    homeDirectory = "/home/me";

    file = {
      ".gitconfig".source = ../../git/.gitconfig;
      ".tmux.conf".source = ../../tmux/.tmux.conf;
      ".vimrc".source = ../../vim/.vimrc;
      ".zshrc".source = ../../zsh/.zshrc;
      "${configHome}/hypr/hyprland.conf".source = ../../hyprland-nix/.config/hypr/hyprland.conf;
      # "${configHome}/nvim/".source = ../../nvim/.config/nvim;
      "${configHome}/waybar".source = ../../waybar/.config/waybar;
      "${configHome}/wofi".source = ../../wofi/.config/wofi;
      "${configHome}/zsh".source = ../../zsh/.config/zsh;

      # ".gnupg/gpg-agent.conf".text = ''
      #   default-cache-ttl 604800
      #   max-cache-ttl 604800
      # '';
    };

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
