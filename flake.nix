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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    home-manager,
    nixos-generators,
    nixos-hardware,
    nixpkgs,
    nixvim,
    sops-nix,
    ...
  }: {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit (nixvim.homeManagerModules) nixvim; };
        modules = [
          home-manager.nixosModules.home-manager
          ./nixos/desktop.nix
        ];
      };
      nixos-home-server = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit (nixvim.homeManagerModules) nixvim; };
        modules = [
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
          ./nixos/home-server.nix
        ];
      };
      nixos-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit (nixvim.homeManagerModules) nixvim; };
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
        specialArgs = { inherit (nixvim.homeManagerModules) nixvim; };
        modules = [
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.apple-t2
          ./iso
        ];
      };
    };
  };
}
