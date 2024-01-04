{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {
  programs.zsh.enable = true;

  home = {
    packages = with pkgs; [
      bat
      btop
      clang
      eza
      fd
      gh
      git
      kitty
      lazygit
      man
      neovim
      ouch
      psmisc # killall
      ripgrep
      rustup
      starship
      stow
      tldr
      unzip
      wget
      zoxide
    ];
    file = {
      ".bash_profile".source = ./bash_profile;
      ".bashrc".source = ./bashrc;
      ".gitconfig".source = ./gitconfig;
      ".tmux.conf".source = ./tmux.conf;
      ".vimrc".source = ./vimrc;
      ".zshrc".source = ./zshrc;
      "${configHome}/zsh/abbr.zsh".source = ./abbr.zsh;
    };
  };
}
