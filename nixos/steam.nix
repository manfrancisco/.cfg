{ config, lib, ... }: {
  options.my.steam = lib.my.mkEnableOption false;

  config = lib.mkIf config.my.steam.enable {
    programs.steam.enable = true;
  };
}
