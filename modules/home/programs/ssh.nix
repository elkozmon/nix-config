{
  flake.modules.homeManager.owner = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
          identityAgent = "none";
        };
      };
    };

    # Unset SSH_AUTH_SOCK to prevent using macOS's SSH agent
    home.sessionVariables = {
      SSH_AUTH_SOCK = "";
    };
  };
}
