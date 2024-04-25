{ nixvim, ... }:
{
  imports = [
    ./nixos
  ];

  networking.hostName = "nixos-home-server";

  my.cpu = "amd";

  my.ssh-luks.enable = true;
  my.sops.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
  };

  home-manager.users.me = { ... }: {
    imports = [
      nixvim
      ../home
    ];
  };

  my.minecraft.server.atm9.enable = true;

  my.nextcloud.server = {
    enable = true;
    domain = "nixos-home-server.shetland-pangolin.ts.net";
    extraTrustedDomains = [
      "nixos-home-server"
      "10.0.0.2"
    ];
  };

  sops.secrets = {
    luks-key-data = {
      sopsFile = ../secrets/nixos-home-server.yaml;
    };
    nextcloud-admin-pass = {
      sopsFile = ../secrets/nixos-home-server.yaml;
      owner = "nextcloud";
      group = "nextcloud";
      # Restart units when the password changes
      restartUnits = [ "phpfpm-nextcloud.service" ];
    };
  };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/a4422541-92d3-4c39-8a04-8d06479bd716";

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c2a26166-1cef-4611-9984-22e390190788";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/79CE-3C58";
      fsType = "vfat";
    };
    "/data" = {
      device = "/dev/mapper/data";
      fsType = "ext4";
    };
  };

  environment.etc.crypttab.text = ''
    data /dev/disk/by-uuid/92d5b37e-e417-4a09-9cca-2c78ff15c32e /run/secrets/luks-key-data
  '';

  system.stateVersion = "23.11";
}
