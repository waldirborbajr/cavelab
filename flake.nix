{
  description = "Waldir Borba Junior - CaveLab";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noshell = {
      url = "github:viperML/noshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # outputs = { nixpkgs, home-manager, noshell, ... }:
  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nix.settings.experimental-features = "nix-command flakes";

      # ALLOW SOFTWARE WITH UNFREE LICENSE
      nixpkgs.config.allowUnfree = true;

      homeConfigurations."cavelab" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          # ({ lib, ... }: {
          #   home.packages = [ noshell.packages.${system}.default ];
          #   xdg.configFile."shell".source = lib.getExe pkgs.nushell;
          # })

          ./home.nix
          # ./modules/multiplex/tmux.nix
          # ./modules/multiplex/zellij.nix
          # ./modules/devops/docker.nix
          # ./modules/terminal/wezterm.nix
          # ./modules/terminal/alacritty.nix
          ./modules/devops/k8s.nix
          ./modules/editor/neovim.nix
          ./modules/lang/go.nix
          ./modules/lang/lua.nix
          ./modules/lang/nix.nix
          ./modules/lang/nodejs.nix
          ./modules/lang/python.nix
          ./modules/lang/rust.nix
          ./modules/terminal/nerdfonts.nix
          ./modules/tools/btop.nix
          ./modules/tools/discord.nix
          ./modules/tools/git.nix
          ./modules/tools/gpg.nix
          ./modules/tools/yazi.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
