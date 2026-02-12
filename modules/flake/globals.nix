{ config, lib, ... }:
let
  inherit (lib)
    mkOption
    types
    ;
in
{
  options.globals = mkOption {
    type = types.submodule {
      options = {
        owner = lib.mkOption {
          type = lib.types.submodule {
            options = {
              user = lib.mkOption {
                type = lib.types.str;
              };
              name = lib.mkOption {
                type = lib.types.str;
              };
              email = lib.mkOption {
                type = lib.types.str;
              };
            };
          };
          default = { };
        };
      };
    };
  };

  config = {
    _module.args = {
      inherit (config) globals;
    };

    flake = {
      inherit (config) globals;
    };
  };
}
