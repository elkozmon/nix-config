{ lib, ... }:
let
  flake.modules.homeManager.owner =
    {
      config,
      pkgs,
      ...
    }:
    {
      options.mcp = {
        servers = lib.mkOption {
          type = lib.types.attrsOf (
            lib.types.submodule {
              options = {
                type = lib.mkOption {
                  type = lib.types.str;
                  description = "MCP server type (e.g., stdio)";
                };
                command = lib.mkOption {
                  type = lib.types.str;
                  description = "Command to run the MCP server";
                };
                env = lib.mkOption {
                  type = lib.types.attrsOf lib.types.str;
                  default = { };
                  description = "Environment variables for the MCP server";
                };
              };
            }
          );
          default = { };
          description = "MCP server definitions shared across tools";
        };

        github.tokenFile = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
          description = "Path to a GitHub token file used by the GitHub MCP server.";
        };
      };

      config.mcp.servers = {
        nixos = {
          type = "stdio";
          command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
        };
      }
      // lib.optionalAttrs (config.mcp.github.tokenFile != null) {
        github = {
          type = "stdio";
          command = "${pkgs.writeShellScript "github-mcp" ''
            export GITHUB_PERSONAL_ACCESS_TOKEN="$(cat ${config.mcp.github.tokenFile})"
            exec ${pkgs.github-mcp-server}/bin/github-mcp-server --read-only stdio
          ''}";
        };
      };
    };
in
{
  inherit flake;
}
