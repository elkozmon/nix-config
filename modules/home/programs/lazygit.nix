{
  flake.modules.homeManager.owner.programs.lazygit = {
    enable = true;
    settings = {
      git = {
        overrideGpg = true;
        autoFetch = false;
      };
    };
  };
}
