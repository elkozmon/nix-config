let
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
    allowInsecure = false;
    allowUnsupportedSystem = false;
  };

  flake.modules.nixos.nixpkgs = {
    inherit nixpkgs;
  };

  flake.modules.darwin.nixpkgs = {
    inherit nixpkgs;
  };
in
{
  inherit flake;
}
