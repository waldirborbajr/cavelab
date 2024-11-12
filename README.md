# Nix CaveLab Home-Manager with Determinate

This is my new dotfiles configuration based on NIX. Currently I'm migrating from my old one (https://github.com/waldirborbajr/dotfiles) and refactoring into a new and more modern one based on Nix and Home-Manager.

``` url
https://github.com/DeterminateSystems/nix-installer
```

``` sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

``` sh
nix run home-manager -- init --switch .

or

nix run home-manager -- switch  --impure --flake .#cavelab -b hm-backup

or

nix run home-manager --switch --flake github:<user>/cavelab-config@cavelab
```

# Nix & home-manager from scratch

``` sh
 ssh-keygen -t ed25519 -b 8196 -C "NixScratch"
```

```sh
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

``` sh
nano ~/.config/nix/nix.conf

# fallback
# Almost always set
connect-timeout = 5

# log-lines = 25 # Updated: This is now the default!
min-free = 128000000
max-free = 1000000000

max-jobs = auto

# Set if understood
experimental-features = nix-command flakes
always-allow-substitutes = true
fallback = true
warn-dirty = false
auto-optimise-store = true
build-users-group = nixbld

# Set for developers
keep-outputs = true
```

``` sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
```

``` sh
nix-channel --update
```

``` sh
nix-shell '<home-manager>' -A install
```

``` sh
home-manager init .
```

``` sh
home-manager switch --flake .#cavelab
```

### Update Packages

``` sh
nix flake update
git diff flake.lock
home-manager switch --flake .#cavelab -b hm-backup
nix-store --gc && nix-collect-garbage -d && home-manager expire-generations -2 days
```
