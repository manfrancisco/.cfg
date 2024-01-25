{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, home-manager, nixos-generators, nixos-hardware, sops-nix, ...}:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        modules = [
          home-manager.nixosModules.home-manager
          ./nixos/desktop.nix
        ];
      };
      nixos-home-server = nixpkgs.lib.nixosSystem {
        modules = [
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
          ./nixos/home-server.nix
        ];
      };
      nixos-laptop = nixpkgs.lib.nixosSystem {
        modules = [
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.apple-t2
          ./nixos/laptop.nix
        ];
      };
    };
    packages.x86_64-linux = {
      iso = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "iso";
        modules = [
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.apple-t2
          ./iso
        ];
      };
    };
  };
}
