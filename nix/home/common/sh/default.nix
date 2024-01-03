{ pkgs, ... }:
{
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
      ".gitconfig".source = ./gitconfig;
      ".tmux.conf".source = ./tmux.conf;
      ".vimrc".source = ./vimrc;
      ".zshrc".source = ./zshrc;
    };
  };
}
