# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ inputs, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      ../common/hyprland.nix
      ../common/mullvad.nix
      ../common/plasma.nix
      ../common/secrets.nix
      ../common/sh.nix
      ../common/sound.nix
    ];

  networking.hostName = "nixos-desktop";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Autologin is currently borked with Hyprland and SDDM
  services.xserver.displayManager.autoLogin.enable = false;

  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      me = import ../home/me.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    clang
    firefox
    home-manager
    mullvad-vpn
    rustup
  ];

  services.openssh.enable = true;

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

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

