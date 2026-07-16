
{ pkgs, lib,  homedir ? "/Users/chukyapin", ... }:
let
  fishPath = lib.getExe pkgs.fish;
  username = "chukyapin";
in
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  documentation.doc.enable = false;
  system.tools.darwin-uninstaller.enable = false;

  nix = {
    enable = false;
  };

  security.pam.services.sudo_local.text = ''
    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so
    auth       sufficient     pam_tid.so
    auth       sufficient     ${pkgs.pam-watchid}/lib/pam/pam_watchid.so
  '';

  system = {
    stateVersion = 7;
    primaryUser  = username;

    activationScripts.homebrew.text = lib.mkBefore ''
      if ! /usr/sbin/pkgutil --pkg-info com.apple.pkg.RosettaUpdateAuto >/dev/null 2>&1; then
        /usr/sbin/softwareupdate --install-rosetta --agree-to-license
      fi

      xcodebuild=/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild
      if [ -x "$xcodebuild" ] && ! "$xcodebuild" -license check >/dev/null 2>&1; then
        "$xcodebuild" -license accept
      fi

      if [ -t 0 ]; then
        /usr/bin/sudo --user=${username} --set-home /usr/bin/sudo --validate
      fi
    '';

    activationScripts.postActivation.text = ''
      echo "Setting login shell to fish..."
      sudo chsh -s ${fishPath} ${username} || true

      if [ -e "/Applications/Arto.app" ]; then
        echo "Removing quarantine from Arto.app..."
        xattr -dr com.apple.quarantine /Applications/Arto.app 2>/dev/null || true
      fi
    '';

    defaults = {
      dock = {
        autohide  = true; # 自動的に隠す
        launchanim = true;
        magnification = false; # 拡大機能OFF
        tilesize  = 40; # アイコンサイズ
        persistent-apps = [ ];
        show-recents = false; # 最近使ったアプリを非表示
        show-process-indicators = true;
        mineffect    = "genie";
        orientation  = "left"; # 左に配置
        showAppExposeGestureEnabled    = true;
        showDesktopGestureEnabled      = true;
        showMissionControlGestureEnabled = true;
      };

      finder = {
        AppleShowAllExtensions = true; # 拡張子を表示
        AppleShowAllFiles      = true; # 隠しファイルを表示
        ShowPathbar            = true; # パスバーを表示
        ShowStatusBar          = true; # ステータスバーを表示
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle   = "Nlsv"; # リスト表示
      };

      NSGlobalDomain = {
        AppleInterfaceStyle    = "Dark"; # ダークモード
        AppleShowAllExtensions = true;
        AppleShowScrollBars    = "Automatic";
        AppleScrollerPagingBehavior = false;
        NSTableViewDefaultSizeMode = 2;

        ApplePressAndHoldEnabled = true;
        KeyRepeat          = 2;
        InitialKeyRepeat   = 25;

        AppleEnableSwipeNavigateWithScrolls = true;
        "com.apple.swipescrolldirection"    = true;
        "com.apple.trackpad.forceClick"     = true;
        "com.apple.trackpad.scaling"        = 1.3;

        NSAutomaticCapitalizationEnabled   = false; # 自動大文字化
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false; # 自動ピリオド挿入
        NSAutomaticQuoteSubstitutionEnabled  = false;
        NSAutomaticSpellingCorrectionEnabled = false; # 自動スペル修正

        NSStatusItemSpacing          = 2;
        NSStatusItemSelectionPadding = 2;
      };

      screensaver = {
        askForPassword      = true;
        askForPasswordDelay = 0;
      };

      trackpad = {
        Clicking  = true; # タップでクリック
        ActuationStrength = 1;
        ActuateDetents    = true;
        FirstClickThreshold  = 0;
        ForceSuppressed      = false;
        SecondClickThreshold = 0;
        TrackpadFourFingerHorizSwipeGesture = 2;
        TrackpadFourFingerPinchGesture      = 2;
        TrackpadFourFingerVertSwipeGesture  = 2;
        TrackpadPinch         = true;
        TrackpadRightClick    = true; # ２本指で右クリック
        TrackpadRotate        = true;
        TrackpadThreeFingerDrag          = true;
        TrackpadThreeFingerHorizSwipeGesture = 2;
        TrackpadThreeFingerTapGesture    = 0;
        TrackpadThreeFingerVertSwipeGesture = 2;
        TrackpadTwoFingerDoubleTapGesture   = true;
        TrackpadTwoFingerFromRightEdgeSwipeGesture = 3;
      };

      CustomUserPreferences = {
        NSGlobalDomain = {
          AppleAccentColor          = -1;
          AppleReduceDesktopTinting = false;
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = false;
          EnableTilingByEdge         = false;
          EnableTopTilingByEdge      = false;
          EnableTilingOptionAccelerator = false;
          EnableTiledWindowMargins   = false;
          GloballyEnabled            = false;
          StageManagerHideDesktopIcons = true;
          StageManagerHideWidgets      = true;
          StandardHideDesktopIcons     = true;
          StandardHideWidgets          = true;
        };
        "com.apple.dock" = {
          appswitcher-all-displays = true;
          wvous-br-corner          = 1;
        };
      };
    };
  };

  users.users.${username} = {
    home  = homedir;
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };

  environment.shells = [ pkgs.fish ];

  programs = {
    nix-index.enable = true;
    # nix-index-database.comma.enable = true;
  };

  homebrew = {
    enable = true;

    brews = [
      "mas"
    ];

    casks = [
      "1password"
      "alfred"
      "raycast"
    ];

    masApps = {
      "LINE"  = 539883307;
      "Slack" = 803453959;
      "Xcode" = 497799835;
    };
  };
}
