{
  lib,
  ...
}:
{
  system.default = {
    NSGlobalDomain = {
      # finder
      finder = {
        AppleShowAllExtensions = true; # ファイル拡張子を常に表示
        AppleShowAllFiles = true; # 隠しファイルを表示
        ShowPassbar = ture; # パスバーを表示
 FXPreferredViewStyle = "Nlsv"; # デフォルトの表示方法をリストビューに設定
      };
    };
  };
}
