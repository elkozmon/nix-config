{ inputs, ... }:
{
  flake.modules.darwin.macbook.imports = [
    inputs.self.modules.darwin.nightshift
  ];
}
