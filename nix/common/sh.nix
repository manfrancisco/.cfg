{ pkgs, ... }:
{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.binsh = "${pkgs.dash}/bin/dash";
}
