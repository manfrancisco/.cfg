{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    eza
    fd
    git
    gh
    joypixels
    kitty
    lazygit
    man
    neovim
    ripgrep
    starship
    stow
    tldr
    unzip
    wget
    zoxide
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
