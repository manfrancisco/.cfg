{ pkgs, ... }:
{
  imports = [ ./gpg.nix ];

  home.packages = [ pkgs.pass ];
}
