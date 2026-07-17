{ 
  lib,
  config,
  pkgs,
  hostSpec,
  ...
}:

{
  imports = [
    ./packages.nix
  ];

  # home.username = "chukyapin";
  home.username = hostSpec.username;
  home.homeDirectory = "/Users/chukyapin";

  home.stateVersion = "26.05"; # Please read the comment before changing.


  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
