{
  description = "Nix CaveLab from Scratch";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

      nix.settings.experimental-features = "nix-command flakes";
      # home-manager.backupFileExtension = "hm-backup";

      homeConfigurations."cavelab" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
	  ./home.nix 
	  ./modules/bat.nix
	  ./modules/eza.nix
	  ./modules/fzf.nix
	  ./modules/starship.nix
	  # ./modules/tmux.nix
	  ./modules/zsh.nix
	  ./modules/yazi.nix
	];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
