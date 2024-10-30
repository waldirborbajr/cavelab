{ pkgs, ... }:
{

  home = {
    packages = with pkgs; [
      nodejs_22
    ];

    # sessionVariables = {
    #   UV_CACHE_DIR = "$HOME/.cache/uv/";
    #   UV_LINK_MODE = "symlink";
    # };
  };
}
