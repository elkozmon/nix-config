{ globals, inputs, ... }:
let
  inherit (globals)
    owner
    ;

  flake.modules.darwin.user.imports = [
    darwin
    user
    home
  ];

  flake.modules.nixos.user.imports = [
    user
    home
  ];

  darwin.system.primaryUser = owner.user;

  user =
    { pkgs, ... }:
    {
      home-manager.backupFileExtension = "backup";

      programs.zsh.enable = true;

      users.users.${owner.user} = {
        description = "${owner.user}";
        home = "/Users/${owner.user}";
        shell = pkgs.zsh;
        isHidden = false;
      };
    };

  home.home-manager.users.${owner.user}.imports = [
    inputs.self.homeModules.owner
  ];
in
{
  inherit flake;
}
