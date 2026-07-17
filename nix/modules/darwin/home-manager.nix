{ config, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users."${config.hostSpec.username}" = import ../home;
}

