{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      gh
      git
    ];
    file.".gitconfig".source = ./cfg/gitconfig;
  };
}
