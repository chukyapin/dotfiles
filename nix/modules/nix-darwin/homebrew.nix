# nix/nix-darwin/homebrew.nix
{ nix-homebrew, ... }:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    autoMigrate = true;

    # ★ これを追加する
    user = "chukyapin";
  };

  homebrew = {
    enable = true;
    user = "chukyapin";

    onActivation = {
      autoUpdate = true;
      # cleanup = "uninstall";
    };

    brews = [
      # "pinentry-mac"
    ];

    casks = [
      # "sublime-text"
    ];
  };
}
