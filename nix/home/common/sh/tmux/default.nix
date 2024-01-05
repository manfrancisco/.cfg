{ pkgs, ... }:
{
  home = {
    packages = [ pkgs.tmux ];
    file.".tmux.conf".source = ./cfg/tmux.conf;
  };
}
