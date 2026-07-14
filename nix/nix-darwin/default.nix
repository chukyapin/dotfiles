{ self, pkgs, ... }:
{
  system = {
    # nix-darwin の stateVersion（インストール時に決めた値）
    stateVersion = 6;

    # このシステムがどの Git リビジョンから構築されたかを記録
    configurationRevision = self.rev or self.dirtyRev or null;

    # Mac 本体のユーザー名（あとで必要になることが多い）
    primaryUser = "chukyapin";

    # macOS の各種 defaults（スペル注意）
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        KeyRepeat = 1; # リピート速度: 最速
        InitialKeyRepeat = 12; # リピート開始速度: 最速
        "com.apple.trackpad.scaling" = 1.0; # 軌跡の速さ(0~3)
      };

      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "Nlsv";
      };

      dock = {
        autohide = true;
        show-recents = false;
        orientation = "left";
      };
    };
  };

  # unfree 全許可
  nixpkgs.config.allowUnfree = true;

  # パッケージを指定して許可する場合（どちらか片方にするのがスッキリ）
  nixpkgs.config.allowUnfreePredicate = pkg:
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
  programs.fish.enable = true;

  imports = [ ./home_manager.nix ];
}
