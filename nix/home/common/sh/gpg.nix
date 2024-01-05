{ lib, pkgs, ... }:
let
  inherit (lib) mkDefault;
in {
  home.packages = [ pkgs.pinentry ];

  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 604800;
    maxCacheTtl = 604800;
    pinentryFlavor = mkDefault "curses";
  };
}
