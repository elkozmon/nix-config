{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          coreutils
          nixfmt-rfc-style
        ];
      };
    };
}
