
# home-manager/home.nix
{ config, pkgs, ... }:

{
  home.username = "chukyapin";
  home.homeDirectory = "/Users/chukyapin";
  home.stateVersion = "26.05";  # 本に合わせる

  # とりあえず最小限のパッケージだけ
  home.packages = with pkgs; [
    git
  ];

  # Home Manager 自身の管理は有効化しておく
  programs.home-manager.enable = true;
}
