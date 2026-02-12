{ inputs, ... }:
let
  flake.modules.nixos.nixos.imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.self.modules.nixos.nixpkgs
    inputs.self.modules.nixos.programs
    inputs.self.modules.nixos.user
  ];
in
{
  inherit flake;
}
