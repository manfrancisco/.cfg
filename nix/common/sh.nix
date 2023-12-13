{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    clang
    eza
    fd
    gh
    git
    home-manager
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
  users.defaultUserShell = pkgs.zsh;

  environment.binsh = "${pkgs.dash}/bin/dash";
}
