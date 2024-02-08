{ pkgs, config, ... }: {
  networking.iproute2.enable = true;
  services.mullvad-vpn.enable = true;
}
