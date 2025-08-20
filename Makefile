version:
	git add .
	git commit -m "$(MSG)"
	git push

switch: 
	home-manager switch --update --impure --flake .#cavelab -b hm-backup-`date +%Y%m%d%H%M%S`

build: 
	home-manager build --impure --flake .#cavelab

update:
	nix flake update

channel-stable:
	nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager

channel-unstable:
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

channel-update:
	nix-store --verify --check-contents
	nix-channel --update
	nix-env -u
	home-manager switch --update

channel-rollback:
	nix-env --uninstall home-manager
	nix-shell -p home-manager --run "home-manager --version"
	home-manager switch

gc:
	nix-store --gc
	nix-collect-garbage -d
	nix-store --verify --check-contents 
	nix store optimise
	home-manager expire-generations "-2 days"

## ?? -----------------------------------------------------------------------
#  ?? Use only at first time
## ?? -----------------------------------------------------------------------

start:
	nix run home-manager -- init switch --flake .#cavelab -b hm-backup-`date +%Y%m%d%H%M%S`
