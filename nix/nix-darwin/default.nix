{ self, pkgs, ... }:
{
  imports = [
    ./home_manager.nix
    ./homebrew.nix
  ];

  system = {
    # Mac 本体のユーザー名（あとで必要になることが多い）
    primaryUser = "chukyapin";

    # nix-darwin の stateVersion（インストール時に決めた値）
    stateVersion = 6;

    # このシステムがどの Git リビジョンから構築されたかを記録
    configurationRevision = self.rev or self.dirtyRev or null;

    # macOS の defaults 相当
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        KeyRepeat = 1; # リピート速度: 最速
        InitialKeyRepeat = 12; # リピート開始までの時間: 最速
        "com.apple.trackpad.scaling" = 1.0; # 軌跡の速さ (0-3)
      };

      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        # デフォルトの表示形式 ("Nlsv"=リスト, "icnv"=アイコン, "clmv"=カラム, "Flwv"=ギャラリー)
        FXPreferredViewStyle = "Nlsv";
      };
    };
  };

  # unfree を全て許可する場合
  nixpkgs.config.allowUnfree = true;

  # パッケージを指定して許可する場合
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "terraform"
    ];

  # primaryUser のホームディレクトリ
  users.users.chukyapin.home = "/Users/chukyapin";

  # この Mac のアーキテクチャ
  nixpkgs.hostPlatform = "aarch64-darwin";

  # nix-darwin による Nix 自体の管理は無効（とりあえず本の通り）
  nix.enable = false;

  # sudo で Touch ID を使う
  security.pam.services.sudo_local.touchIdAuth = true;

  # 使うシェル（fish 使っていても zsh 有効化はほぼ必須）
  programs.zsh.enable = true;
  programs.fish.enable = true;  # 必要ならあとで追加
}
