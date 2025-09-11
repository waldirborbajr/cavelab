# Nix CaveLab Home-Manager with Determinate

This is my new dotfiles configuration based on NIX. Currently I'm migrating from my old one (https://github.com/waldirborbajr/dotfiles) and refactoring into a new and more modern one based on Nix and Home-Manager.

Feel free to use or copy what you need from this repo.



``` url
https://github.com/DeterminateSystems/nix-installer
```

``` sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Start from scratch

``` sh
nix run home-manager -- init --switch .

```
## Dowload from GIT and start using

``` sh

git clone git@github.com:waldirborbajr/cavelab.git

make init

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

## Fix zsh auto start

``` sh
nano ~/.bashrc
exec /home/borba/.nix-profile/bin/zsh
```


WiFI

```sh
sudo nala update
sudo apt-get purge bcmwl-kernel-source
sudo nala install firmware-b43-installer

reboot

lspci -nn | grep Network
```

## WIFI Alternative
```sh
sudo apt install broadcom-sta-dkms
sudo sed -i 's/wifi.powersave = 3/wifi.powersave = 2/' /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
```



