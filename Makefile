version:
	git add .
	git commit -m "$(MSG)"
	git push

switch: 
	home-manager switch --impure --flake .#cavelab -b hm-backup-`date +%Y%m%d%H%M%S`

update:
	nix flake update

gc:
	nix-store --gc
	nix-collect-garbage -d
	home-manager expire-generations "-2 days"

start:
	nix run home-manager -- switch --flake .#cavelab -b hm-backup-`date +%Y%m%d%H%M%S`
