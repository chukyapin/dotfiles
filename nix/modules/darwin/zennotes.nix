# ./nix/modules/darwin/zennotes.nix
{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    inputs.zennotes.packages.${pkgs.system}.zennotes-desktop
    inputs.zennotes.packages.${pkgs.system}.zennotes-server
  ];
}

