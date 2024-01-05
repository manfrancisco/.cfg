{ pkgs, ... }:
{
  home = {
    packages = [ pkgs.vim ];
    file.".vimrc".source = ./cfg/vimrc;
  };
}
