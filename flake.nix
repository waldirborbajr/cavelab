{
  description = "CaveLAB Home Manageru";

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
      homeConfigurations."cavelab" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
        ./home.nix
        ./modules/eza.nix
        ./modules/fzf.nix
        ./modules/lazygit.nix
        ./modules/zellij.nix
        ./modules/git.nix
        ./modules/go.nix
        ./modules/gh.nix
        ./modules/neovim.nix
        ./modules/rust.nix
        ./modules/starship.nix
        ./modules/tmux.nix
        ./modules/wezterm.nix
        ./modules/zsh.nix
        ./modules/yazi.nix
      ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
