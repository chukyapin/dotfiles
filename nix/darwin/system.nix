{
  pkgs,
  lib,
  username,
  homedir,
  ...
}:
{
  # Set primary user for homebrew
  system.primaryUser = "chukyapin";
  system.defaults = {
    NSGlobalDomain = {
 # マウス/トラックパッド
      "com.apple.swipescrolldirection" = true; # ナチュラルスクロールを有効化
      # キーボード
      NSAutomaticCapitalizationEnabled = false; # 文頭の自動大文字化を無効化
      NSAutomaticPeriodSubstitutionEnabled = false; # ピリオドの自動置換を無効化
      NSAutomaticSpellingCorrectionEnabled = false; # スペル自動修正を無効化
      NSAutomaticDashSubstitutionEnabled = false; # ダッシュの自動置換を無効化
      NSAutomaticQuoteSubstitutionEnabled = false; # クォートの自動置
      # UI
      AppleInterfaceStyle = "Dark"; # ダークモードを有効化
      NSWindowResizeTime = 0.001; # ウィンドウのリサイズ速度を高速化
    };
    
      # finder settings
      finder = {
        AppleShowAllExtensions = true; # ファイル拡張子を常に表示
        AppleShowAllFiles = true; # 隠しファイルを表示
        ShowPathbar = true; # パスバーを表示
        ShowStatusBar = true; # ステータスバーを表示
 FXPreferredViewStyle = "Nlsv"; # デフォルトの表示方法をリストビューに設定
      };
# Dock
      dock = {
        show-recents = false; # 最近使ったアプリを非表示
        launchanim = false; # アプリ起動時のアニメーションを無効化
      };
    };
  }
