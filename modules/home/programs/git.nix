{ globals, config, ... }:
let
  inherit (globals)
    owner
    ;

  flake.modules.homeManager.owner =
    { config, ... }:
    {
      programs.git = {
        enable = true;
        ignores = [ "*.swp" ];
        settings = {
          user = {
            inherit (owner) name email;
          };
          init.defaultBranch = "main";
          core = {
            editor = "vim";
            autocrlf = "input";
          };
          pull.rebase = true;
          rebase.autoStash = true;
          gpg.format = "ssh";
        };
        lfs = {
          enable = true;
        };
        signing = {
          key = "${config.home.homeDirectory}/.ssh/id_ed25519_sk_signing.pub";
          signByDefault = true;
        };
      };
    };
in
{
  inherit flake;
}
