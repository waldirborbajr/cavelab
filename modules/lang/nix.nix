{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # alejandra
    # nixfmt-classic
    # deadnix
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    nixd
    # statix
    # vulnix
  ];
}
