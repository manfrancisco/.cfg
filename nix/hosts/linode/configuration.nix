{ home-manager, pkgs, ... }:
{
  imports =
    [
      home-manager.nixosModules.home-manager
      ./hardware-configuration.nix
      ../../common/secrets.nix
      ../../common/sh.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos-linode";

  users.users.me = {
    isNormalUser = true;
    home = "/home/me";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIApAUfrvdzryjaoVwNFB/GRtx0P3n2/FI5AOWBQ8l6Tf me@michael-laptop-arch"
    ];
  };

  home-manager.users.me = import ../../home/me.nix;

  security.sudo.wheelNeedsPassword = false;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
  };

  boot.loader.grub.enable = true;

  # Important for networking on Linode
  networking.usePredictableInterfaceNames = false;
  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  environment.systemPackages = with pkgs; [
    # Recomended for Linode network troubleshooting
    inetutils
    mtr
    sysstat
  ];

  time.timeZone = "America/Los_Angeles";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

