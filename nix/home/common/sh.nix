{ pkgs, ... }:
{
  home.packages = with pkgs; [
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

  programs.zsh.enable = true;
}
