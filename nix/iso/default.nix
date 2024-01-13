{ home-manager, pkgs, ... }:
{
  imports = [
    ../nixos/common/sh.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.openssh.enable = true;

  users.users.nixos = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRZy5DeVFgpAVGG98rYE9goW++AsHIhriELkOAWjuus me@nixos-desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIApAUfrvdzryjaoVwNFB/GRtx0P3n2/FI5AOWBQ8l6Tf me@michael-laptop-arch"
    ];
  };

  home-manager.users.nixos = { lib, ... }: {
    imports = [
      ../home/common
    ];
    home = {
      username = lib.mkForce "nixos";
      homeDirectory = lib.mkForce "/home/nixos";
    };
  };

  environment.systemPackages = with pkgs; [
    git
    python3

    # Allows you to select a boot target without entering BIOS
    efibootmgr
  ];

  networking = {
    networkmanager.enable = true;

    useDHCP = true;
    enableIPv6 = false;
  };

  # For T2 Linux
  nix.settings = {
    trusted-substituters = [ "https://t2linux.cachix.org" ];
    trusted-public-keys = [ "t2linux.cachix.org-1:P733c5Gt1qTcxsm+Bae0renWnT8OLs0u9+yfaK2Bejw=" ];
  };

  # ZFS is (sometimes) broken and prevents building without this
  nixpkgs.config.allowBroken = true;
}
