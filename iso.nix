{ nixvim, pkgs, ... }:
{
  imports = [
    ./nixos
  ];

  home-manager.users.me = { ... }: {
    imports = [ ./home nixvim ];
  };

  environment.systemPackages = with pkgs; [
    python3
    efibootmgr
    pciutils # lspci
  ];

  # ZFS is (sometimes) broken and prevents building without this
  nixpkgs.config.allowBroken = true;

  system.stateVersion = "24.05";
}
