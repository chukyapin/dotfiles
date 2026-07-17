{
  description = "Home Manager configuration of chukyapin";

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

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nix-homebrew,
      ...
    }:
    {
      # nix-darwin（macOS システム設定＋Home Manager＋Homebrew）
      darwinConfigurations."katayamanoMacBook-Pro" =
        nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";

          specialArgs = {
            inherit self nix-homebrew;
          };

          modules = [
            # darwin 側メインモジュール
            ./nix/modules/darwin/default.nix

            # Home Manager を nix-darwin に組み込む
            home-manager.darwinModules.home-manager

            # nix-homebrew を組み込む
            nix-homebrew.darwinModules.nix-homebrew

            # ホスト固有の設定
            {
              hostSpec = {
                hostName = "katayamanoMacBook-Pro";
                username = "chukyapin";
                system = "aarch64-darwin";
                isDarwin = true;
                isMinimal = false;
                isWork = false;
                enableGUI = true;
              };
            }
          ];
        };
    };
}
