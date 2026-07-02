{
  description = "Home Manager configuration of chukyapin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
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

  outputs =
    { nixpkgs, home-manager, ... }:
    {
      nixpkgs,
      home-manage,
      nix-darwin.
      ...
    }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."chukyapin" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./nix/home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      darwinConfiguration."katayamanoMacBook-Pro" = nix-darwin.lib.darwinSystem {
        module = [ ./nix/nix-darwin/configuration.nix ];
      };
    };
}
