{ pkgs, ... }:
{

  home.packages = with pkgs; [
    stylua
    lua
    sumneko-lua-language-server # Lua.
    luarocks-nix
    luarocks
    # shellcheck
    # shfmt
    # vale
  ];
}
