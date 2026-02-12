{
  flake.modules.homeManager.owner.programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    colors = "always";
    icons = "always";
    extraOptions = [
      "--color-scale=all"
      "--color-scale-mode=gradient"
      "--group-directories-first"
    ];
  };
}
