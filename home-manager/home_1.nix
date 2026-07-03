{ config, pkgs, ... }:

{
  home.username = "chukyapin";
  home.homeDirectory = "/Users/chukyapin";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
  git
  ];

  home.file = {
    
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
