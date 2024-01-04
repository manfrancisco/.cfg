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
      ".bash_profile".source = ./cfg/bash_profile;
      ".bashrc".source = ./cfg/bashrc;
      ".gitconfig".source = ./cfg/gitconfig;
      ".tmux.conf".source = ./cfg/tmux.conf;
      ".vimrc".source = ./cfg/vimrc;
      ".zshrc".source = ./cfg/zshrc;
      "${configHome}/zsh/abbr.zsh".source = ./cfg/abbr.zsh;
    };
  };
}
