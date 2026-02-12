let
  flake.modules.homeManager.owner = {
    nixpkgs.config = {
      allowUnfree = true;
      allowBroken = false;
      allowInsecure = false;
      allowUnsupportedSystem = false;
    };
  };
in
{
  inherit flake;
}
