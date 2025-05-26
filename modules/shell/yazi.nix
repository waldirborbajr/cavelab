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
      manager = {
        show_hidden = true;
        sort_dir_first = true;
        linemode = "owner";
      };

    };
  };
}
