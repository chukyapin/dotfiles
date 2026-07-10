
{
  description = "Home Manager configuration of chukyapin (minimal)";

  inputs = {
    # macOS なので nixpkgs-* ブランチを使う
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin";  # Intel Mac なら "x86_64-darwin"
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    # Home Manager Standalone 用
    homeConfigurations."chukyapin" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}
