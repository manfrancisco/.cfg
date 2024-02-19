{ config, lib, ... }:
{
  config = lib.mkIf config.my.desktop.steam.enable {
    programs.steam.enable = true;
  };
}
