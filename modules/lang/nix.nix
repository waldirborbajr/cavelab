{ pkgs, ... }: {
  home.packages = with pkgs; [
    alejandra
    deadnix
    nil
    nixfmt-classic
    nixpkgs-fmt
    statix
    vulnix
  ];
}
