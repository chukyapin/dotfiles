
# home-manager/home.nix
{ 
  config,
  pkgs,
  ...
  }:
  let
    username = "chukyapin";
  in
  {
  home = {

    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "26.05";  # 本に合わせる
  };
  # とりあえず最小限のパッケージだけ
  home.packages = with pkgs; [
    bottom
    curl
    delta
    deno
    efm-langserver
    ffmpeg_7
    ghq
    git
  ];

  # Home Manager 自身の管理は有効化しておく
  programs.home-manager.enable = true;
}
