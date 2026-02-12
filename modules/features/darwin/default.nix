{ inputs, ... }:
let
  flake.modules.darwin.darwin =
    { pkgs, ... }:
    {
      imports = [
        inputs.home-manager.darwinModules.home-manager
        inputs.self.modules.darwin.nixpkgs
        inputs.self.modules.darwin.programs
        inputs.self.modules.darwin.user
      ];

      # Determinate uses its own daemon to manage the Nix installation
      nix.enable = false;

      system = {
        # Turn off NIX_PATH warnings now that we're using flakes
        checks.verifyNixPath = false;
        stateVersion = 6;
        defaults = {
          NSGlobalDomain = {
            AppleShowAllExtensions = true;
            ApplePressAndHoldEnabled = false;

            AppleInterfaceStyle = "Dark";

            # 120, 90, 60, 30, 12, 6, 2
            KeyRepeat = 2;

            # 120, 94, 68, 35, 25, 15
            InitialKeyRepeat = 15;

            # Disable spelling correction
            NSAutomaticSpellingCorrectionEnabled = false;

            "com.apple.mouse.tapBehavior" = 1;
            "com.apple.sound.beep.volume" = 0.0;
            "com.apple.sound.beep.feedback" = 0;
          };

          LaunchServices = {
            LSQuarantine = true;
          };

          WindowManager = {
            EnableStandardClickToShowDesktop = false;
          };

          dock = {
            autohide = true;
            show-recents = false;
            launchanim = true;
            orientation = "bottom";
            tilesize = 48;
          };

          finder = {
            AppleShowAllFiles = true;
            AppleShowAllExtensions = true;
            ShowPathbar = true;
            FXEnableExtensionChangeWarning = false;
            _FXShowPosixPathInTitle = false;
            CreateDesktop = false;
          };

          loginwindow = {
            GuestEnabled = false;
          };

          screensaver = {
            askForPassword = true;
            askForPasswordDelay = 0;
          };

          trackpad = {
            Clicking = true;
            TrackpadThreeFingerDrag = true;
          };

          CustomUserPreferences = {
            "com.apple.Safari" = {
              AutoFillPasswords = false;
              ShowStandaloneTabBar = false;
              ShowFullURLInSmartSearchField = true;
              WebKitExperimentalHTTPSByDefaultEnabled = true;
              HomePage = "https://www.google.com/";
            };
            "com.apple.finder" = {
              ShowExternalHardDrivesOnDesktop = false;
              ShowHardDrivesOnDesktop = false;
              ShowMountedServersOnDesktop = true;
              ShowRemovableMediaOnDesktop = true;
              _FXSortFoldersFirst = true;
              # When performing a search, search the current folder by default
              FXDefaultSearchScope = "SCcf";
            };
            "com.apple.desktopservices" = {
              # Avoid creating .DS_Store files on network or USB volumes
              DSDontWriteNetworkStores = true;
              DSDontWriteUSBStores = true;
            };
            "com.apple.spaces" = {
              # Display have seperate spaces
              "spans-displays" = 0;
            };
            "com.apple.WindowManager" = {
              # Click wallpaper to reveal desktop
              EnableStandardClickToShowDesktop = 0;
              # Show items on desktop
              StandardHideDesktopIcons = 1;
              # Do not hide items on desktop & stage manager
              HideDesktop = 0;
              StageManagerHideWidgets = 0;
              StandardHideWidgets = 0;
            };
            "com.apple.AdLib" = {
              allowApplePersonalizedAdvertising = false;
            };
            "com.apple.ImageCapture" = {
              # Prevent Photos from opening automatically when devices are plugged in
              disableHotPlug = true;
            };
            "com.apple.SoftwareUpdate" = {
              AutomaticCheckEnabled = true;
              # Check for software updates daily, not just once per week
              ScheduleFrequency = 1;
              # Download newly available updates in background
              AutomaticDownload = 1;
              # Install System data files & security updates
              CriticalUpdateInstall = 1;
            };
            "com.apple.commerce" = {
              # Turn on app auto-update
              AutoUpdate = true;
            };
          };
        };

        keyboard = {
          enableKeyMapping = true;
          remapCapsLockToControl = true;
        };
      };

      environment.systemPackages = with inputs.nix-darwin.packages.${pkgs.system}; [
        darwin-option
        darwin-rebuild
        darwin-version
        darwin-uninstaller
      ];
    };
in
{
  inherit flake;
}
