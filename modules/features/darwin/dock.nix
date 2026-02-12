{
  globals,
  config,
  lib,
  ...
}:
let
  inherit (globals)
    owner
    ;
  inherit (lib)
    mkOption
    types
    ;

  options.features.dock = {
    entries = mkOption {
      type =
        with types;
        listOf (submodule {
          options = {
            path = mkOption {
              type = str;
            };
            section = mkOption {
              type = str;
              default = "apps";
            };
            options = mkOption {
              type = str;
              default = "";
            };
          };
        });
      readOnly = true;
      description = "Entries on the Dock";
    };
  };

  flake.modules.darwin.dock =
    { config, pkgs, ... }:
    let
      inherit (pkgs)
        dockutil
        coreutils
        ;

      cfg = config.features.dock;

      normalize = path: if lib.strings.hasSuffix ".app" path then path + "/" else path;
      entryURI =
        path:
        "file://"
        + (lib.strings.replaceStrings
          [
            " "
            "!"
            "\""
            "#"
            "$"
            "%"
            "&"
            "'"
            "("
            ")"
          ]
          [
            "%20"
            "%21"
            "%22"
            "%23"
            "%24"
            "%25"
            "%26"
            "%27"
            "%28"
            "%29"
          ]
          (normalize path)
        );
      wantURIs = lib.strings.concatMapStrings (entry: "${entryURI entry.path}\n") cfg.entries;
      createEntries = lib.strings.concatMapStrings (
        entry:
        "${dockutil}/bin/dockutil --no-restart --add '${entry.path}' --section ${entry.section} ${entry.options}\n"
      ) cfg.entries;
    in
    {
      inherit options;

      config = {
        system.activationScripts.postActivation.text = ''
          echo >&2 "Setting up the Dock for ${owner.user}..."
          su ${owner.user} -s /bin/sh <<'USERBLOCK'
          haveURIs="$(${dockutil}/bin/dockutil --list | ${coreutils}/bin/cut -f2)"
          if ! diff -wu <(echo -n "$haveURIs") <(echo -n '${wantURIs}') >&2 ; then
            echo >&2 "Resetting Dock."
            ${dockutil}/bin/dockutil --no-restart --remove all
            ${createEntries}
            killall Dock
          else
            echo >&2 "Dock setup complete."
          fi
          USERBLOCK
        '';
      };
    };
in
{
  inherit flake;
}
