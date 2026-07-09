{
  description = "Home Manager configuration of chukyapin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/8809585e6937d0b07fc066792c8c9abf9c3fe5c4";
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
    { 
      nixpkgs,
      home-manager,
      nix-darwin,
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
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      darwinConfigurations."katayamanoMacBook-Pro" = nix-darwin.lib.darwinSystem {
         modules = [ ./nix-darwin/configuration.nix ];
       };
    };
}
