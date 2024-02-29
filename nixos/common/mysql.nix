{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.my.server.mysql.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
      # See https://nixos.wiki/wiki/Mysql for notes about upgrading
    };
  };
}
