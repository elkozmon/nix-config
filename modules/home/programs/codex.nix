let
  flake.modules.homeManager.owner =
    { config, ... }:
    {
      home.activation.makeCodexConfigWritable =
        let
          configPath = "${config.home.homeDirectory}/.codex/config.toml";
        in
        {
          after = [ "writeBoundary" ];
          before = [ ];
          data = ''
            install -m 0640 "''$(readlink "${configPath}")" "${configPath}"
          '';
        };

      programs.codex = {
        enable = true;
        settings = {
          mcp_servers = config.mcp.servers;
        };
      };

      home.file.".codex/config.toml".force = true;
    };
in
{
  inherit flake;
}
