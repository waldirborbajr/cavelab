{ pkgs, ... }:
{

  programs.go.enable = true;

  home.packages = with pkgs; [
    python312
    python312Packages.pip
    pipenv
    uv
  ];

}
