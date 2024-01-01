{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {
  home.username = "me";
  home.homeDirectory = "/home/me";

  programs.browserpass.enable = true;

  home.packages = with pkgs; [];

  home.file = {
    ".gitconfig".source = ../../git/.gitconfig;
    ".tmux.conf".source = ../../tmux/.tmux.conf;
    ".vimrc".source = ../../vim/.vimrc;
    ".zshrc".source = ../../zsh/.zshrc;
    "${configHome}/hypr/hyprland.conf".source = ../../hyprland-nix/.config/hypr/hyprland.conf;
    # "${configHome}/nvim/".source = ../../nvim/.config/nvim;
    "${configHome}/waybar".source = ../../waybar/.config/waybar;
    "${configHome}/wofi".source = ../../wofi/.config/wofi;
    "${configHome}/zsh".source = ../../zsh/.config/zsh;

    ".gnupg/gpg-agent.conf".text = ''
      default-cache-ttl 604800
      max-cache-ttl 604800
    '';
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
