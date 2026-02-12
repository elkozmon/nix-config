{
  flake.modules.homeManager.owner =
    { pkgs, ... }:
    {
      programs.tmux = {
        enable = true;
        terminal = "screen-256color";
        prefix = "C-b";
        escapeTime = 10;
        historyLimit = 50000;
        shell = "${pkgs.zsh}/bin/zsh";
        extraConfig = ''
          # Remove Vim mode delays
          set -g focus-events on

          # Enable full mouse support
          set -g mouse on
        '';
      };
    };
}
