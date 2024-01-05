{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {
  programs.zsh.enable = true;

  home.file = {
    ".zshrc".source = ./cfg/zshrc;
    "${configHome}/zsh/abbr.zsh".source = ./cfg/abbr.zsh;
  };
}
