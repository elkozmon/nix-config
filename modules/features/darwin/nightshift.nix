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

  options.features.nightshift = {
    schedule = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable scheduled blue light reduction";
      };

      day = {
        hour = mkOption {
          type = types.int;
          default = 7;
          description = "Hour when day starts (0-23)";
        };

        minute = mkOption {
          type = types.int;
          default = 0;
          description = "Minute when day starts (0-59)";
        };
      };

      night = {
        hour = mkOption {
          type = types.int;
          default = 22;
          description = "Hour when night starts (0-23)";
        };

        minute = mkOption {
          type = types.int;
          default = 0;
          description = "Minute when night starts (0-59)";
        };
      };
    };
  };

  flake.modules.darwin.nightshift =
    { config, pkgs, ... }:
    let
      cfg = config.features.nightshift;
    in
    {
      inherit options;

      config = {
        system.defaults = {
          CustomSystemPreferences = {
            "/var/root/Library/Preferences/com.apple.CoreBrightness.plist" =
              let
                userId = builtins.readFile (
                  pkgs.runCommand "user-id" { }
                    "/usr/bin/dscl . -read /Users/${owner.user} GeneratedUID | /usr/bin/sed 's/GeneratedUID: //' | /usr/bin/tr -d \\\\n > $out"
                );
              in
              {
                "CBUser-${userId}" = {
                  CBBlueLightReductionCCTTargetRaw = "3433.05";
                  CBBlueReductionStatus = {
                    AutoBlueReductionEnabled = 1;
                    BlueLightReductionAlgoOverride = 0;
                    BlueLightReductionDisableScheduleAlertCounter = 3;
                    BlueLightReductionSchedule = {
                      DayStartHour = cfg.schedule.day.hour;
                      DayStartMinute = cfg.schedule.day.minute;
                      NightStartHour = cfg.schedule.night.hour;
                      NightStartMinute = cfg.schedule.night.minute;
                    };
                    BlueReductionAvailable = 1;
                    BlueReductionEnabled = 0;
                    BlueReductionMode = if cfg.schedule.enable then 1 else 0;
                    BlueReductionSunScheduleAllowed = 1;
                    Version = 1;
                  };
                  CBColorAdaptationEnabled = 1;
                };
              };
          };
        };
        system.activationScripts.postActivation.text = ''
          killall cfprefsd
          killall corebrightnessd
        '';
      };
    };
in
{
  inherit flake;
}
