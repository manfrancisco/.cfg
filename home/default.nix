{ ... }:
{

  imports = [
    ./sh
    ./desktop
    ./lutris.nix
    ./nvim.nix
  ];

  home = {
    username = "me";
    homeDirectory = "/home/me";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
