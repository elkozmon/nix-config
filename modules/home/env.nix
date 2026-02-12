{ lib, ... }:
let
  flake.modules.homeManager.owner.imports = [
    common
    darwin
  ];

  common =
    { config, ... }:
    {
      home.sessionPath = [
        "/usr/local/bin"
        "${config.home.homeDirectory}/.local/bin"
        "${config.home.homeDirectory}/.local/share/bin"
      ];

      home.shellAliases = {
        # nix
        shell = "nix-shell -p";

        # list
        ls = "ls --color=auto";

        # eza
        l = "eza";
        ll = "eza -l --git -h";
        la = "eza -a";
        lla = "eza -a -l --git -h";

        # shortcuts
        c = "clear";
        h = "history";
        lg = "lazygit";
        g = "git";
        zj = "zellij";
        zjcd = "zellij attach --create \"$(basename $(pwd))\"";

        # misc
        cafe = "caffeinate -s";
        dateiso = "date -uIs | sed 's/+00:00/Z/'";
        sshtmp = "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
      };
    };

  darwin =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenvNoCC.isDarwin {
      home.sessionPath = [
        "/opt/homebrew/bin"
      ];
    };
in
{
  inherit flake;
}
