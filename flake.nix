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
      # Home Manager (ユーザー環境)
      homeConfigurations."chukyapin" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./nix/modules/home/default.nix
          ];
        };

      # nix-darwin (macOS システム設定)
      darwinConfigurations."katayamanoMacBook-Pro" =
        nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./nix/modules/darwin/default.nix
          ];
        };
    };
}
