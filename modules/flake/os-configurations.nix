{ inputs, ... }:
let
  inherit (inputs.self.lib.os)
    mkDarwin
    ;

  flake.darwinConfigurations = {
    macbook = mkDarwin "macbook";
  };
in
{
  inherit flake;
}
