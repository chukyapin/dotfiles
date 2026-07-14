{ config, pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.chukyapin = import ../home-manager/default.nix;
}
