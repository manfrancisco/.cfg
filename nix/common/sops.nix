{ pkgs, sops-nix, ... }:
{
  imports = [ sops-nix.nixosModules.sops ];

  environment.systemPackages = with pkgs; [ age sops ];

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/me/.config/sops/age/keys.txt";
  };
}
