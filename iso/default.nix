{ nixvim, pkgs, ... }:
{
  imports = [
    ../nixos/common/sh.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.openssh.enable = true;

  services.getty.autologinUser = "me";

  users.users.me = {
    password = "me";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRZy5DeVFgpAVGG98rYE9goW++AsHIhriELkOAWjuus me@nixos-desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIApAUfrvdzryjaoVwNFB/GRtx0P3n2/FI5AOWBQ8l6Tf me@michael-laptop-arch"
    ];
  };

  home-manager.users.me = { ... }: {
    imports = [ ../home nixvim ];
  };

  environment.systemPackages = with pkgs; [
    git
    python3

    # Allows you to select a boot target without entering BIOS
    efibootmgr
    # For lspci
    pciutils
  ];

  networking.networkmanager.enable = true;

  # For WiFi on some Macs
  # boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  # networking.enableB43Firmware = true;
  # nixpkgs.config.allowUnfree = true;

  # For T2 Linux
  nix.settings = {
    trusted-substituters = [ "https://t2linux.cachix.org" ];
    trusted-public-keys = [ "t2linux.cachix.org-1:P733c5Gt1qTcxsm+Bae0renWnT8OLs0u9+yfaK2Bejw=" ];
  };

  # ZFS is (sometimes) broken and prevents building without this
  nixpkgs.config.allowBroken = true;

  system.stateVersion = "23.11";
}
