{
  description = "Home Manager configuration of chukyapin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    
    nix-darwin = {
       url = "github:nix-darwin/nix-darwin";
       inputs.nixpkgs.follows = "nixpkgs";
    };


    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      flake-parts,
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      home-manager,
      treefmt-nix,
      git-hooks,
      ...
      }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."chukyapin" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./nix/modules/home/default.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

      darwinConfigurations."katayamanoMacBook-Pro" = nix-darwin.lib.darwinSystem {

        specialArgs = { inherit self; };
         modules = [
         ./nix/modules/darwin/default.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew 
         ];
       };
    };
}
