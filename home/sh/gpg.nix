{ lib, pkgs, ... }: {
  home.packages = [ pkgs.pinentry ];

  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 604800;
    maxCacheTtl = 604800;
    pinentryPackage = lib.mkDefault pkgs.pinentry-curses;
  };
}
