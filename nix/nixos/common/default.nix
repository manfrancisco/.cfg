{ config, lib, pkgs, ... }:
{
  imports = [
    ./cinnamon.nix
    ./gnome.nix
    ./hyprland.nix
    ./nvidia.nix
    ./nvim.nix
    ./sh.nix
    ./sound.nix
    ./steam.nix
    ./tailscale.nix
  ];

  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRZy5DeVFgpAVGG98rYE9goW++AsHIhriELkOAWjuus me@nixos-desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGnz/RaxMk01+oDfSQVdpX2P7vHWVSpbcqhrThd9U88O me@nixos-home-server"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN6rt0HTZ0Ncov1M2rd2uvfEiKpYJmF3/x8bA6QQ+emC me@nixos-laptop"
    ];
  };

  networking.networkmanager.enable = true;

  services = {
    getty.autologinUser = "me";

    openssh = {
      enable = true;
      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    printing.enable = true;
  };

  environment.systemPackages = [ pkgs.git ];

  boot = {
    initrd.availableKernelModules = [
      "ahci"
      "ehci_pci"
      "nvme"
      "sd_mod"
      "usbhid"
      "usb_storage"
      "xhci_pci"
    ];
    kernelModules = [ "kvm-${config.my.cpu}" ];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  swapDevices = lib.mkDefault [
    {
      device = "/var/lib/swapfile";
      # In megabytes
      size = 10*1024;
    }
  ];

  hardware = {
    enableRedistributableFirmware = true;
    cpu."${config.my.cpu}".updateMicrocode = true;
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = config.my.arch;
  };

  time.timeZone = "America/Los_Angeles";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
