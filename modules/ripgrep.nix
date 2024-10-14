# rg: modern and fast grep
{ pkgs, ... }: {
  
  home.packages = with pkgs; [
    ripgrep-all
  ];

  programs.ripgrep = {
    enable = true;
    arguments = [ "--hidden" ];
  };
}
