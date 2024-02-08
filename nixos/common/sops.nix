{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ age sops ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/me/.config/sops/age/keys.txt";

    secrets.luks-key-data = {};
  };
}
