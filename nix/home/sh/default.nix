{ config, pkgs, ... }:
{
  imports = [
    ./bash
    ./git
    ./gpg.nix
    ./pass.nix
    ./ranger.nix
    ./tmux
    ./vim
    ./zsh
  ];

  home.packages = with pkgs; [
    bat
    btop
    clang
    eza
    fd
    kitty
    lazygit
    man
    neovim
    nix-diff
    nvd
    ouch
    psmisc # killall
    ripgrep
    rustup
    starship
    stow
    tldr
    wget
    zoxide
  ];
}
