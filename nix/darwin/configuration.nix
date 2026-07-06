# /Users/chukyapin/ghq/github.com/chukyapin/dotfiles/config/nix/darwin/configuration.nix

{ self, nix-homebrew, ... }:
{
  # 他の nix-darwin モジュールをまとめて読み込む
  imports = [
    ./home-manager.nix
    ./homebrew.nix
  ];

  # この Mac のプラットフォーム
  nixpkgs.hostPlatform = "aarch64-darwin";

  # 後方互換用の stateVersion（本どおり 6）
  system.stateVersion = 6;

  # 旧 Nix デーモンは無効化（本の最小構成）
  nix.enable = false;

  # sudo に Touch ID を使う
  security.pam.services.sudo_local.touchIdAuth = true;

  # Home Manager モジュールが要求するユーザー home
  users.users."chukyapin".home = "/Users/chukyapin";
}
