{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, home-manager, ...}:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      nixos-linode = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager; };
        modules = [ ./nixos-linode/configuration.nix ];
      };
      nixos-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager; };
        modules = [ ./nixos-desktop/configuration.nix ];
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
