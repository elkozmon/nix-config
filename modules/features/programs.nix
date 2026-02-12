let
  programs =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        coreutils
        killall
        openssh
        wget
        zip
        unzip
        unrar
        tree
        fzf
        htop
        gnupg
        smartmontools
        libfido2
      ];
    };

  flake.modules.nixos.programs.imports = [ programs ];
  flake.modules.darwin.programs.imports = [ programs ];
in
{
  inherit flake;
}
