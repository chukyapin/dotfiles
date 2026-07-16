{
  ...
}:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nix.enable = false;

system.primaryUser = "chukyapin";

  imports = [
    ./system.nix
  ];
}
