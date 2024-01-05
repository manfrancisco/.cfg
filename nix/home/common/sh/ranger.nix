{ config, pkgs, ... }:
let
  configHome = config.xdg.configHome;
in {
  home.packages = [ pkgs.ranger ];

  home.file = {
    "${configHome}/ranger/rc.conf".text = ''
      set preview_images_method kitty
    '';
  };
}
