# {
#   home-manager.useGlobalPkgs = true;
#   home-manager.useUserPackages = true;
#   home-manager.users."'chukyapin'" = ../home/default.nix;
# }
#
{ config, pkgs, lib, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users."chukyapin" = { ... }:
    import ../home/default.nix {
      inherit config pkgs lib;
      homeDirectory = "/Users/chukyapin";
      username = "chukyapin";
    };
}
