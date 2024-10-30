{ pkgs, ... }:
{

  home = {
    packages = with pkgs; [
      python312
      python312Packages.pip
      pipenv
      uv
    ];

    sessionVariables = {
      UV_CACHE_DIR = "$HOME/.cache/uv/";
      UV_LINK_MODE = "symlink";
    };
  };
}
