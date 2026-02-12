{
  flake.modules.darwin.macbook.networking = {
    computerName = "Mac";
    hostName = "macbook";

    applicationFirewall = {
      enable = true;
      enableStealthMode = true;
    };
  };
}
