{ pkgs, ... }:

{
  programs.discord = {
    enable = true;
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (pkgs.llb.getName pkg) [ "discord" ];
  };
}

