{ config, lib, ... }:
{
  config = lib.mkIf config.my.steam.enable {
    programs.steam.enable = true;
  };
}
