{
  description = "My dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nix-darwin, ... }:
    let
      system = "aarch64-darwin"; # Intel Mac なら "x86_64-darwin"
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."chukyapin" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
          ];
        };

      darwinConfigurations."katayamanoMacBook-Pro" =
        nix-darwin.lib.darwinSystem {
          system = system;
          modules = [
            ./nix-darwin/configuration.nix
          ];
        };
    };
}
