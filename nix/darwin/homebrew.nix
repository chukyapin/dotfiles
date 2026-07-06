{
  nix-homebrew,
  ...
}:
{
  homebrew = {
    enable = true;
    user = "chukyapin";

    global.autoUpdate = false;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      # cleanup = "uninstall";  # Homebrew からの移行完了後に設定
    };

    brews = [
      # brew install nginx
      "nginx"
    ];
    casks = [
      # brew install --cask microsoft-office
      "fantastical"
    ];
  };
}
