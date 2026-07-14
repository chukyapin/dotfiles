{
  self,
  pkgs,
  ...
}:
{
  system = {
    # nix-darwin の stateVersion（インストール時に決めた値）
    stateVersion = 6;

    # このシステムがどの Git リビジョンから構築されたかを記録
    configurationRevision = self.rev or self.dirtyRev or null;

    # Mac 本体のユーザー名（あとで必要になることが多い）
    primaryUser = "chukyapin";
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

  imports = [ ./home_manager.nix ];
}
