
# nix-darwin/configuration.nix
{ self, pkgs, ... }:
{
  imports = [
    ./home_manager.nix
    ./homebrew.nix
  ];

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "chukyapin";
  };

  users.users.chukyapin.home = "/Users/chukyapin";

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.enable = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
}
