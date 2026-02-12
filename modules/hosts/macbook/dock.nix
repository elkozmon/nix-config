{ inputs, ... }:
{
  flake.modules.darwin.macbook = {
    imports = [
      inputs.self.modules.darwin.dock
    ];

    features.dock.entries = [
      { path = "/System/Applications/Mail.app/"; }
      { path = "/System/Applications/Calendar.app/"; }
      { path = "/System/Applications/Messages.app/"; }
      { path = "/System/Applications/Facetime.app/"; }
      { path = "/System/Applications/Photos.app/"; }
      { path = "/Applications/Safari.app/"; }
      { path = "/Applications/WhatsApp.app/"; }
      { path = "/Applications/1Password.app/"; }
    ];
  };
}
