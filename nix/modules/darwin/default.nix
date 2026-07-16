{ config, pkgs, ... }:

{
  # ここでだけ hostSpec を定義
  hostSpec = {
    username = "chukyapin";
  };

  # いつもの nix-darwin 設定
  system.primaryUser = "chukyapin";
  # ほかの darwin モジュールや imports...
  imports = [
    ./system.nix
  ];
}
