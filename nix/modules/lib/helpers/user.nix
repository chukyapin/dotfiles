{ config }:
let
  inherit (config.home) username;
  githubId = "203862188";
  email = "${githubId}+${username}@users.noreply.github.com";
in
{
  inherit username githubId email;
}
