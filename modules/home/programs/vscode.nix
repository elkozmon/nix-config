{ inputs, ... }:
let
  flake.modules.homeManager.owner =
    { config, pkgs, ... }:
    let
      exts = inputs.nix-vscode-extensions.extensions.${pkgs.stdenvNoCC.hostPlatform.system};

      baseDir =
        if pkgs.stdenvNoCC.isDarwin then
          "${config.home.homeDirectory}/Library/Application Support"
        else
          config.xdg.configHome;
      configDirName =
        {
          "vscode" = "Code";
          "vscode-insiders" = "Code - Insiders";
          "vscodium" = "VSCodium";
        }
        .${config.programs.vscode.package.pname};
      configPath = "${baseDir}/${configDirName}/User/settings.json";
    in
    {
      home.activation.makeVSCodeConfigWritable = {
        after = [ "writeBoundary" ];
        before = [ ];
        data = ''
          install -m 0640 "''$(readlink "${configPath}")" "${configPath}"
        '';
      };

      home.file."${configPath}".force = true;

      programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        mutableExtensionsDir = false;
        profiles.default = {
          extensions = [
            exts.vscode-marketplace-release.mkhl.direnv
            exts.vscode-marketplace-release.redhat.vscode-yaml
            exts.vscode-marketplace-release.jnoortheen.nix-ide
            exts.vscode-marketplace-release.scala-lang.scala
            exts.vscode-marketplace-release.scalameta.metals
            exts.vscode-marketplace-release.tamasfe.even-better-toml
          ];
          userSettings = {
            "update.mode" = "none";

            "telemetry.telemetryLevel" = "off";

            "files.autoSave" = "afterDelay";
            "files.autoSaveDelay" = 1000;

            "editor.fontLigatures" = true;
            "editor.tabSize" = 2;
            "editor.insertSpaces" = true;

            "workbench.editor.enablePreview" = false;
            "workbench.activityBar.location" = "top";

            "terminal.integrated.shellIntegration.enabled" = false;
            "terminal.integrated.sendKeybindingsToShell" = false;
            "terminal.integrated.defaultProfile.osx" = "zsh";
            "terminal.integrated.profiles.osx" = {
              "tmux-shell" = {
                "path" = "tmux";
                "args" = [
                  "new-session"
                  "-A"
                  "-s"
                  "vscode:\${workspaceFolder}"
                ];
              };
              "zellij-shell" = {
                "path" = "zellij";
                "args" = [
                  "attach"
                  "--create"
                  "vscode:\${workspaceFolderBasename}"
                ];
              };
            };
          };
        };
      };
    };
in
{
  inherit flake;
}
