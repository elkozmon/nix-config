# Quick start

First change the settings in `globals.nix`.

## MacOS

Install Determinate Nix from [determinate.systems](https://docs.determinate.systems).[^1]

For initial setup use the following:

```sh
# using flake from github
sudo nix run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake "git+ssh://git@github.com/elkozmon/nix-config?ref=main#macbook"

# using local flake
sudo nix run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake .#macbook
```

I recommend rebooting the machine after that.[^2]

Then once nix-darwin is installed you may use the `darwin-rebuild` command:

```sh
# using flake from github
sudo darwin-rebuild switch --flake "git+ssh://git@github.com/elkozmon/nix-config?ref=main#macbook"

# using local flake
sudo darwin-rebuild switch --flake .#macbook
```

To generate SSH keys run:

```sh
nix run .#create-keys
```

[^1]: This flake configures nix-darwin for Determinate Nix. If you choose another distro, update the [nix-darwin config](https://nix-darwin.github.io/nix-darwin/manual/#opt-nix.enable).

[^2]: Some settings take effect only after a reboot.
