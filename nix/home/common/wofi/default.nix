{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {
  home = {
    packages = [ pkgs.wofi ];
    file."${configHome}/wofi/style.css".source = ./cfg/style.css;
  };
}
