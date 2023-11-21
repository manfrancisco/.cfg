{
  description = "A flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  outputs = {self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos-linode = lib.nixosSystem {
        inherit system;
        modules = [ ./nixos-linode/configuration.nix ];
      };
    };
  };
}
