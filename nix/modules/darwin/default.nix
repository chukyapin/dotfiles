# nix/modules/darwin/default.nix みたいなイメージ
{ config, pkgs, lib, ... }:

{

nix.enable = false;

users.users."chukyapin".home = "/Users/chukyapin";
  # home.packages = with pkgs; [
  # nixfmt
  # git
  # ];

  # 先に hostSpec オプションを定義するモジュールを読み込む
  imports = [
    ../hostspec.nix
    ./system.nix
    ./home-manager.nix
    ./homebrew.nix
  ];

  # ここで hostSpec に「値」を入れる
  hostSpec = {
    username = "chukyapin";
    # 必要なら他もここで上書き
    hostName = "katayamanoMacBook-Pro";
    system = "aarch64-darwin";
  };

  # nix-darwin の標準オプション
  system.primaryUser = config.hostSpec.username;
}
