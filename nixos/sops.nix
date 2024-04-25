{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ age sops ];

  sops.age.keyFile = "/home/me/.config/sops/age/keys.txt";
}
