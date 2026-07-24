{
  description = "Home Manager configuration of chukyapin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

   flake-parts.url = "github:hercules-ci/flake-parts";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

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
    }@inputs:
   let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
      # neovim-nightly は flake update で最新コミット(= CI の cachix push 前)を掴むと
      # ローカルビルドになる。aarch64-darwin もキャッシュ対象だが数コミット分ラグがある。
      # nix-community.cachix.org に実在する最新コミットを探して pin し、常に「最新の cache」を使う。
      pinNeovim = ''
        echo "Pinning neovim-nightly to latest cached build..."
        nvim_rev=""
        revs=$(${pkgs.gh}/bin/gh api "repos/nix-community/neovim-nightly-overlay/commits?per_page=20" --jq '.[].sha' 2>/dev/null || true)
        for rev in $revs; do
          out=$(nix eval --raw "github:nix-community/neovim-nightly-overlay/$rev#packages.${system}.default.outPath" 2>/dev/null) || continue
          if nix path-info --store https://nix-community.cachix.org "$out" >/dev/null 2>&1; then
            nvim_rev="$rev"
            break
          fi
        done
        if [ -n "$nvim_rev" ]; then
          echo "  neovim-nightly -> $nvim_rev (cached)"
          nix flake lock --override-input neovim-nightly-overlay "github:nix-community/neovim-nightly-overlay/$nvim_rev"
        else
          echo "  no cached neovim-nightly found in recent commits; keeping latest (local build)"
        fi
      '';
    in
    {
      apps.${system} = {
        update = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              ${pinNeovim}
              # nix-darwin を先に。/etc/nix/nix.conf(substituters, trusted-users,
              # max-jobs 等)を先に反映させ、home-manager のビルドがその設定下で走るようにする。
              echo "Updating nix-darwin..."
              nix run nix-darwin -- switch --flake .#kawarimidoll-darwin
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#myHomeConfig
              echo "Update complete!"
            ''
          );
        };
        };
    # {
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
