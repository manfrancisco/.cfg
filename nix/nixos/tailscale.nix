{ config, lib, ... }: {
  options.my.tailscale = lib.my.mkEnableOption true;

  config = lib.mkIf config.my.tailscale.enable {
    services.tailscale.enable = true;

    # Allow connections through mullvad exit nodes
    networking.firewall.checkReversePath = "loose";
  };
}
