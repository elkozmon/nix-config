{ lib, ... }:
let
  flake.modules.homeManager.owner.imports = [
    common
    darwin
  ];

  common =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        bat
        neofetch
        difftastic
        jq
        yq
        tmux
        gh
        yubikey-manager
      ];
    };

  darwin =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenvNoCC.isDarwin {
      home.packages = with pkgs; [
        monitorcontrol
        aldente
      ];
    };
in
{
  inherit flake;
}
