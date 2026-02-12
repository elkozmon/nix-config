{ inputs, ... }:
{
  flake.modules.darwin.macbook =
    { pkgs, ... }:
    {
      imports = [
        inputs.stylix.darwinModules.stylix
      ];

      stylix = {
        enable = true;

        base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";

        fonts = {
          serif = {
            package = inputs.apple-fonts.packages.${pkgs.stdenvNoCC.hostPlatform.system}.ny-nerd;
            name = "NY Nerd Font";
          };
          sansSerif = {
            package = inputs.apple-fonts.packages.${pkgs.stdenvNoCC.hostPlatform.system}.sf-pro-nerd;
            name = "SFProDisplay Nerd Font";
          };
          monospace = {
            package = inputs.apple-fonts.packages.${pkgs.stdenvNoCC.hostPlatform.system}.sf-mono-nerd;
            name = "SFMono Nerd Font";
          };

          sizes = {
            terminal = 11;
          };
        };
      };
    };
}
