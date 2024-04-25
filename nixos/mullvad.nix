{ config, lib, ... }: {
  options.my.mullvad = lib.my.mkEnableOption false;

  config = lib.mkIf config.my.mullvad.enable {
    networking.iproute2.enable = true;
    services.mullvad-vpn.enable = true;
  };
}
