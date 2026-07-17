{
  config,
  pkgs,
  osConfig ? null,
  ...
}:

{
  imports = [
    ./packages.nix
  ];

  home.username = if osConfig != null then osConfig.hostSpec.username else "chukyapin";
  home.homeDirectory = if osConfig != null then "/Users/${osConfig.hostSpec.username}" else "/Users/chukyapin";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
