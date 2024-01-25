{ config, pkgs, ... }:
{
  imports = [
    ../options.nix
    ./common/hyprland.nix
    ./common/sh.nix
    ./common/sound.nix
    ./common/tailscale.nix
  ];

  my.desktop-env = "hyprland";

  networking.hostName = "nixos-laptop";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.getty.autologinUser = "me";

  environment.systemPackages = [ pkgs.git ];

  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users.me = import ../home/nixos-laptop.nix;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/108ff579-6add-4f0e-9f29-676e5ff68366";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/D065-CF3D";
      fsType = "vfat";
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      # In megabytes
      size = 10*1024;
    }
  ];

  # The only sleep setting that seems to sort of work
  systemd.sleep.extraConfig = ''
    SuspendState=freeze
  '';

  # Broadcom Wi-Fi firmware
  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "brcm-firmware";

      buildCommand = ''
        dir="$out/lib/firmware/brcm";
        mkdir -p "$dir"
        cp -r ${./common/firmware/brcm}/* "$dir"
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

  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };

  # Set your time zone.
  time.timeZone = "US/Pacific";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "x86_64-linux";
  };

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  system.stateVersion = "23.05";
}
