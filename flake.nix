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
    modded-minecraft-servers.url = "github:frantisekhanzlikbl/nixos-modded-minecraft-servers/patch-1";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    home-manager,
    modded-minecraft-servers,
    nixos-generators,
    nixos-hardware,
    nixpkgs,
    nixvim,
    sops-nix,
    ...
  }: let
    lib = nixpkgs.lib.extend (final: prev: { my = import ./lib.nix { lib = final; }; } // home-manager.lib);
  in{
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        specialArgs = {
          inherit (nixvim.homeManagerModules) nixvim;
          inherit lib;
        };
        modules = [
          home-manager.nixosModules.home-manager
          modded-minecraft-servers.module
          sops-nix.nixosModules.sops
          ./hosts/desktop.nix
        ];
      };
      nixos-home-server = lib.nixosSystem {
        specialArgs = {
          inherit (nixvim.homeManagerModules) nixvim;
          inherit lib;
        };
        modules = [
          home-manager.nixosModules.home-manager
          modded-minecraft-servers.module
          sops-nix.nixosModules.sops
          ./hosts/home-server.nix
        ];
      };
      nixos-laptop = lib.nixosSystem {
        specialArgs = {
          inherit (nixvim.homeManagerModules) nixvim;
          inherit lib;
        };
        modules = [
          home-manager.nixosModules.home-manager
          modded-minecraft-servers.module
          nixos-hardware.nixosModules.apple-t2
          sops-nix.nixosModules.sops
          ./hosts/laptop.nix
        ];
      };
    };
    packages.x86_64-linux = {
      iso = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "iso";
        specialArgs = {
          inherit (nixvim.homeManagerModules) nixvim;
          inherit lib;
        };
        modules = [
          home-manager.nixosModules.home-manager
          modded-minecraft-servers.module
          ./iso.nix
        ];
      };
    };
  };
}
