# nix-darwin/homebrew.nix
{
  nix-homebrew,
  ...
}:
{
  # nix-homebrew 本体の設定
  nix-homebrew = {
    enable = true;
    # Homebrew を持つ macOS ユーザー名に合わせる
    user = "chukyapin";  # ← ここはあなたの macOS ユーザー名に変更
    enableRosetta = false;
    autoMigrate = true;
  };

  # nix-darwin 側の Homebrew モジュール設定
  homebrew = {
    enable = true;
    user = "chukyapin";  # 同じくユーザー名を合わせる

    brews = [
    ];

    casks = [
    ];

    taps = [
    ];
 # 更新ポリシーなど（好みに応じて）
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      # cleanup = "uninstall";  # すべて転記し終わったら有効にする
    };

    global.autoUpdate = false;
  };
}
