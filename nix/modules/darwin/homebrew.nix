{ config, ... }:
{
  nix-homebrew = {
    enable = true;
    user = config.hostSpec.username;
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    user = config.hostSpec.username;
  };
}
