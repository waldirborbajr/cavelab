{ ... }:

{
  programs.lazygit = {
    enable = true;

    settings = {
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --paging=never";
        };
      };
    };

    shellAliases = {
      gg = "lazygit";
    };
  };
}
