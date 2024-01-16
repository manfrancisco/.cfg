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
      nixos-linode = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager; };
        modules = [ ./nixos/linode/configuration.nix ];
      };
      nixos-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager; };
        modules = [ ./nixos/desktop/configuration.nix ];
      };
      nixos-home-server = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager sops-nix; };
        modules = [ ./nixos/home-server/configuration.nix ];
      };
      nixos-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager; };
        modules = [
          nixos-hardware.nixosModules.apple-t2
          ./nixos/laptop/configuration.nix
        ];
      };
    };
    packages.x86_64-linux = {
      iso = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "iso";
        specialArgs = { inherit nixos-hardware; };
        modules = [
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.apple-t2
          ./iso
        ];
      };
    };
    homeConfigurations = {
      arch-laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/arch-laptop.nix ];
      };
    };
  };
}
