{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
  ];

  programs.browserpass.enable = true;
}
