{ home-manager, pkgs, ... }:
{
  imports =
    [
      home-manager.nixosModules.home-manager
      ./hardware-configuration.nix
      ../common/hyprland.nix
      ../common/sh.nix
      ../common/sound.nix
      ../common/tailscale.nix
    ];

  networking.hostName = "nixos-laptop";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.getty.autologinUser = "me";

  environment.systemPackages = [ pkgs.git ];

  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users.me = import ../../home/nixos-laptop.nix;

  # Broadcom Wi-Fi firmware
  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "brcm-firmware";

      buildCommand = ''
        dir="$out/lib/firmware/brcm";
        mkdir -p "$dir"
        cp -r ${../firmware/brcm} "$dir"
      '';
    })
  ];

  # Recommended setup for T2 Macs
  networking = {
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  # Set your time zone.
  time.timeZone = "US/Pacific";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
