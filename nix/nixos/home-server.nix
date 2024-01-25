{ ... }:
{
  imports = [
    ./common/sh.nix
    ./common/sops.nix
    ./common/tailscale.nix
    ./common/ssh-luks.nix
  ];

  networking = {
    hostName = "nixos-home-server";
    networkmanager.enable = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRZy5DeVFgpAVGG98rYE9goW++AsHIhriELkOAWjuus me@nixos-desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIApAUfrvdzryjaoVwNFB/GRtx0P3n2/FI5AOWBQ8l6Tf me@michael-laptop-arch"
    ];
  };

  home-manager.users.me = import ../home/nixos-home-server.nix;

  time.timeZone = "America/Los_Angeles";

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
      luks.devices."root".device = "/dev/disk/by-uuid/a4422541-92d3-4c39-8a04-8d06479bd716";
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c2a26166-1cef-4611-9984-22e390190788";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/79CE-3C58";
      fsType = "vfat";
    };
  };

  swapDevices = [ ];

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = true;
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "x86_64-linux";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11";
}
