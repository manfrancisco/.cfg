{ ... }:
{
  home.file = {
    ".bash_profile".source = ./cfg/bash_profile;
    ".bashrc".source = ./cfg/bashrc;
  };
}
