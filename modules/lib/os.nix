{ inputs, lib, ... }:
let
  mkNixos =
    system: cls: name:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        inputs.self.modules.nixos.${cls}
        inputs.self.modules.nixos.${name}
        inputs.self.modules.nixos.${system}
        {
          system.stateVersion = lib.mkDefault "25.11";
          networking.hostName = lib.mkDefault name;
          nixpkgs.hostPlatform = lib.mkDefault system;
        }
      ];
    };

  mkDarwin =
    system: name:
    inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        inputs.self.modules.darwin.darwin
        inputs.self.modules.darwin.${name}
        inputs.self.modules.darwin.${system}
        {
          system.stateVersion = lib.mkDefault 6;
          networking.hostName = lib.mkDefault name;
          nixpkgs.hostPlatform = lib.mkDefault system;
        }
      ];
    };

  flake.lib.os = {
    mkNixos = mkNixos "x86_64-linux" "nixos";
    mkNixosArm = mkNixos "aarch64-linux" "nixos";
    mkDarwin = mkDarwin "aarch64-darwin";
    mkDarwinIntel = mkDarwin "x86_64-darwin";
  };
in
{
  inherit flake;
}
