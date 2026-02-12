{
  globals,
  inputs,
  ...
}:
let
  inherit (globals) owner;

  flake.modules.darwin.homebrew =
    { config, ... }:
    {
      imports = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
      ];

      nix-homebrew = {
        inherit (owner) user;
        enable = true;
        taps = {
          "homebrew/homebrew-core" = inputs.homebrew-core;
          "homebrew/homebrew-cask" = inputs.homebrew-cask;
          "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
        };
        mutableTaps = false;
        autoMigrate = true;
      };

      homebrew = {
        enable = true;
        onActivation.cleanup = "zap";
        # Pass nix-homebrew taps to nix-darwin
        # https://github.com/zhaofengli/nix-homebrew/issues/5#issuecomment-1878798641
        taps = builtins.attrNames config.nix-homebrew.taps;
      };
    };
in
{
  inherit flake;
}
