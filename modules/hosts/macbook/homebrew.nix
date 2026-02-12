{ inputs, ... }:
{
  flake.modules.darwin.macbook = {
    imports = [
      inputs.self.modules.darwin.homebrew
    ];

    homebrew = {
      casks = [
        "bettermouse"
        "1password"
        "1password-cli"
        # "yubico-yubikey-manager"
      ];

      masApps = {
        "pages" = 409201541;
        "numbers" = 409203825;
        "keynote" = 409183694;
        "xcode" = 497799835;
        "whatsapp" = 310633997;
        "wireguard" = 1451685025;
        "1password-safari" = 1569813296;
        "yubico-authenticator" = 1497506650;
        # "utm" = 1538878817;
        # "perplexity" = 6714467650;
        # "hidden-bar" = 1452453066;
        # "yoink" = 457622435;
        # "playlisty" = 1459275972;
        # "hotkey" = 975890633;
      };
    };
  };
}
