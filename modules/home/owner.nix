{
  globals,
  config,
  inputs,
  lib,
  ...
}:
let
  inherit (globals)
    owner
    ;

  flake.homeModules.owner.imports = [
    inputs.self.modules.homeManager.owner
  ];

  flake.modules.homeManager.owner =
    { pkgs, ... }:
    {
      home.username = lib.mkDefault owner.user;
      home.homeDirectory = lib.mkDefault (
        if pkgs.stdenvNoCC.isDarwin then "/Users/${owner.user}" else "/home/${owner.user}"
      );
      home.stateVersion = lib.mkDefault "25.11";
    };

in
{
  inherit flake;
}
