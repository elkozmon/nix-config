{
  flake.modules.darwin.macbook =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        zoom-us
        winbox4
      ];
    };
}
