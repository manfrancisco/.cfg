{
  description = "A flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  outputs = {self, nixpkgs, ...}:
  let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos-linode = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./nixos-linode-configuration.nix ];
      };
    };
  };
}
