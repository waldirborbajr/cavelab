{ pkgs, ... }:
{

  home = {
    packages = with pkgs; [
      nodejs-22
    ];

    # sessionVariables = {
    #   UV_CACHE_DIR = "$HOME/.cache/uv/";
    #   UV_LINK_MODE = "symlink";
    # };
  };
}
