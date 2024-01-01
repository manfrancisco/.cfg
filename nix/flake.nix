{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, home-manager, sops-nix, ...}:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      nixos-linode = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager; };
        modules = [ ./hosts/linode/configuration.nix ];
      };
      nixos-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager; };
        modules = [ ./hosts/desktop/configuration.nix ];
      };
      nixos-home-server = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager sops-nix; };
        modules = [ ./hosts/home-server/configuration.nix ];
      };
    };
    homeConfigurations = {
      me = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/me.nix ];
      };
    };
  };
}
