{
  description = "Nix CaveLab from Scratch";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noshell = {
      url = "github:viperML/noshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, noshell, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

      nix.settings.experimental-features = "nix-command flakes";

      # ALLOW SOFTWARE WITH UNFREE LICENSE
      nixpkgs.config.allowUnfree = true;

      homeConfigurations."cavelab" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ({ lib, ... }: {
            home.packages = [ noshell.packages.${system}.default ];
            xdg.configFile."shell".source = lib.getExe pkgs.nushell;
          })
          ./home.nix
          # ./modules/starship.nix
          ./modules/btop.nix
          ./modules/git.nix
          ./modules/gpg.nix
          ./modules/lua.nix
          ./modules/neovim.nix
          ./modules/yazi.nix
          ./modules/zsh.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
