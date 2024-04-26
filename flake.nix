{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
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
    nixpkgs-unstable,
    nixvim,
    sops-nix,
    ...
  }: let
    mkLib = pkgs: pkgs.lib.extend (final: prev: { my = import ./lib.nix { lib = final; }; } // home-manager.lib);
    lib = mkLib nixpkgs;
    lib-unstable = mkLib nixpkgs-unstable;
    pkgs-unstable = import nixpkgs-unstable {
      system = "x86_64-linux";
      config.allowUnfree = true;
      config.joypixels.acceptLicense = true;
    };
  in{
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        specialArgs = {
          inherit (nixvim.homeManagerModules) nixvim;
          inherit lib lib-unstable pkgs-unstable;
        };
        modules = [
          home-manager.nixosModules.home-manager { home-manager.extraSpecialArgs = { pkgs = pkgs-unstable; }; }
          modded-minecraft-servers.module
          sops-nix.nixosModules.sops
          ./hosts/desktop.nix
        ];
      };
      nixos-home-server = lib.nixosSystem {
        specialArgs = {
          inherit (nixvim.homeManagerModules) nixvim;
          inherit lib lib-unstable pkgs-unstable;
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
          inherit lib lib-unstable pkgs-unstable;
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
          inherit lib lib-unstable pkgs-unstable;
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
