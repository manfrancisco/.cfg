{... }:
{
  services.tailscale.enable = true;

  # Allow connections through mullvad exit nodes
  networking.firewall.checkReversePath = "loose";
}
