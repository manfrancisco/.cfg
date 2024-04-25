{ config, lib, pkgs, ... }: {
  options.my.mysql = lib.my.mkEnableOption false;

  config = lib.mkIf config.my.mysql.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
      # See https://nixos.wiki/wiki/Mysql for notes about upgrading
    };
  };
}
