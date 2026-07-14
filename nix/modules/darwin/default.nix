{ self, pkgs, ... }:
{
  nix = {
    enable = false;  # ★ ここを false に

    # ★ 以下は全部コメントアウト or 削除
    # gc = {
    #   automatic = true;
    #   interval = {
    #     Hour = 9;
    #     Minute = 0;
    #   };
    #   options = "--delete-older-than 7d";
    # };
    #
    # optimise.automatic = true;
    #
    # settings = {
    #   experimental-features = "nix-command flakes";
    #   download-buffer-size = 134217728;
    #   trusted-users = [
    #     "root"
    #     "chukyapin"
    #   ];
    # };
  };

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "chukyapin";

    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        KeyRepeat = 1;
        InitialKeyRepeat = 12;
        "com.apple.trackpad.scaling" = 1.0;
      };

      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "Nlsv";
      };

      # dock = {
      #   autohide = true;
      #   show-recents = false;
      #   orientation = "left";
      # };
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [ "terraform" ];

  users.users.chukyapin.home = "/Users/chukyapin";

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh.enable = true;
  programs.fish.enable = true;

  imports = [
    ./home_manager.nix
    ./homebrew.nix
  ];
}
