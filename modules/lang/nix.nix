{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    nixfmt-rfc-style
    nixpkgs-fmt
    nixd
    # statix
    # vulnix
  ];
}
