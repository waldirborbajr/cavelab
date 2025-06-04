# {
#   programs.yazi = {
#     enable = true;
#     enableZshIntegration = true;
#   };
# }

{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableZshIntegration = true;
    settings = {
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
        linemode = "owner";
      };

    };
  };
}
