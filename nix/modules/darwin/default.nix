{ config, ... }:

{
  # unfree を全て許可する場合
  nixpkgs.config.allowUnfree = true;

  # Nix デーモンの設定
  nix.enable = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users."${config.hostSpec.username}" = {
    home = "/Users/${config.hostSpec.username}";
  };

  # 関連モジュールのインポート
  imports = [
    ../hostSpec.nix
    ./system.nix
    ./home-manager.nix
    ./homebrew.nix
  ];

  # nix-darwin の標準オプション
  system.primaryUser = config.hostSpec.username;
}
