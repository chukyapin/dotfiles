# { self, pkgs, ... }:
# {
#   nix = {
#     enable = false;
#
#     gc = {
#       automatic = true;
#       interval = {
#         Hour = 9;
#         Minute = 0;
#       };
#       options = "--delete-older-than 7d";
#     };
#
#     optimise.automatic = true;
#
#     settings = {
#       experimental-features = "nix-command flakes";
#       download-buffer-size = 134217728; # 128MiB
#       trusted-users = [
#         "root"
#         "chukyapin"
#       ];
#     };
#   };
#
#   system = {
#     # nix-darwin の stateVersion（インストール時に決めた値）
#     stateVersion = 6;
#
#     # このシステムがどの Git リビジョンから構築されたかを記録
#     configurationRevision = self.rev or self.dirtyRev or null;
#
#     # Mac 本体のユーザー名（あとで必要になることが多い）
#     primaryUser = "chukyapin";
#
#     # macOS の各種 defaults（スペル注意）
#     defaults = {
#       NSGlobalDomain = {
#         AppleShowAllExtensions = true;
#         KeyRepeat = 1; # リピート速度: 最速
#         InitialKeyRepeat = 12; # リピート開始速度: 最速
#         "com.apple.trackpad.scaling" = 1.0; # 軌跡の速さ(0~3)
#       };
#
#       finder = {
#         AppleShowAllFiles = true;
#         AppleShowAllExtensions = true;
#         FXPreferredViewStyle = "Nlsv";
#       };
#
#       dock = {
#         autohide = true;
#         show-recents = false;
#         orientation = "left";
#       };
#     };
#   };
#
#   # unfree 全許可
#   nixpkgs.config.allowUnfree = true;
#
#   # パッケージを指定して許可する場合（どちらか片方にするのがスッキリ）
#   nixpkgs.config.allowUnfreePredicate = pkg:
#     builtins.elem (pkgs.lib.getName pkg) [
#       "terraform"
#     ];
#
#   # primaryUser のホームディレクトリ
#   users.users.chukyapin.home = "/Users/chukyapin";
#
#   # この Mac のアーキテクチャ
#   nixpkgs.hostPlatform = "aarch64-darwin";
#
#   # sudo で Touch ID を使う
#   security.pam.services.sudo_local.touchIdAuth = true;
#
#   # 使うシェル（fish 使っていても zsh 有効化はほぼ必須）
#   programs.zsh.enable = true;
#   programs.fish.enable = true;
#
#   # Home Manager 連携
#   imports = [
#     ./home_manager.nix
#     ./homebrew.nix
#   ];
# }

{ self, pkgs, ... }:
{
  nix = {
    enable = false;  # ★ ここを false に

    # ★ 以下は全部コメントアウト or 削除
    # gc = {
    #   automatic = true;
    #   interval = {
    #     Hour = 9;
    #     Minute = 0;
    #   };
    #   options = "--delete-older-than 7d";
    # };
    #
    # optimise.automatic = true;
    #
    # settings = {
    #   experimental-features = "nix-command flakes";
    #   download-buffer-size = 134217728;
    #   trusted-users = [
    #     "root"
    #     "chukyapin"
    #   ];
    # };
  };

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "chukyapin";

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        KeyRepeat = 1;
        InitialKeyRepeat = 12;
        "com.apple.trackpad.scaling" = 1.0;
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

  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [ "terraform" ];

  users.users.chukyapin.home = "/Users/chukyapin";

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh.enable = true;
  programs.fish.enable = true;

  imports = [
    ./home_manager.nix
    ./homebrew.nix
  ];
}
