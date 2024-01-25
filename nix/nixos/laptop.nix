{ pkgs, ... }:
{
  imports = [
    ../options.nix
    ./common
    ./common/hyprland.nix
    ./common/sound.nix
  ];

  networking.hostName = "nixos-laptop";

  my.desktop-env = "hyprland";

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
    networkmanager.wifi.backend = "iwd";
  };

  hardware.cpu.intel.updateMicrocode = true;

  system.stateVersion = "23.05";
}
