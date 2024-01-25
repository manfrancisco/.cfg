{ home-manager, ... }:
{
  imports = [
    ../options.nix
    ./common/hyprland.nix
    ./common/sh.nix
    ./common/sound.nix
    ./common/tailscale.nix
  ];

  my.desktop-env = "hyprland";

  networking = {
    hostName = "nixos-desktop";
    networkmanager.enable = true;
  };

  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.me = import ../home/nixos-desktop.nix;

  services = {
    getty.autologinUser = "me";
    printing.enable = true;
    openssh.enable = true;
  };

  time.timeZone = "US/Pacific";

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/932f6805-4b68-4391-92af-1256c022449a";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/549B-E4CE";
      fsType = "vfat";
    };
  };

  swapDevices = [];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "x86_64-linux";
  };

  system.stateVersion = "23.05";
}
