{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.my.desktop.steam.enable {
    programs.steam.enable = true;
  };
}
