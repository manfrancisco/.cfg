{ config, lib, pkgs, ... }:
{
  config = lib.mkIf (config.my.desktop-env != null) {
    programs.steam.enable = true;
  };
}
