{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        programs = {
          nixfmt.enable = true;
          nixfmt.package = pkgs.nixfmt-rfc-style;
          prettier.enable = true;
          shfmt.enable = true;
          statix.enable = true;
        };
        settings.formatter = {
          prettier = {
            includes = [
              "*.json"
              "*.md"
            ];
            excludes = [
              ".claude/*.json"
              ".vscode/*.json"
              ".codex/*.toml"
              ".mcp.json"
            ];
          };
          shfmt.includes = [
            "*.sh"
          ];
        };
      };
    };
}
