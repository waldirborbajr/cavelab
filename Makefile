version:
	git add .
	git commit -m "$(MSG)"
	git push

switch: 
	home-manager switch --impure --flake .#cavelab -b hm-backup-`date +%Y%m%d%H%M%S`

build: 
	home-manager build --impure --flake .#cavelab

update:
	nix flake update

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
