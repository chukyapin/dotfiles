{
  nix-homebrew,
  ...
}:
{
  nix-homebrew = ...;
  homebrew = {
    enable = true;
    user = "chukyapin";
    brews = [
    "fzf"
    ];
    casks = [
    ];
  };
}
