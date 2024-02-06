{ pkgs, ... }:
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
    bitwarden-cli
    btop
    clang
    eza
    fd
    fzf
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
