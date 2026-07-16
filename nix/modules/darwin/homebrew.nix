{
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    user = "chukyapin";
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    user = "chukyapin";
  };
}
