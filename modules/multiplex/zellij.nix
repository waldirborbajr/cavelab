{ ... }:

{
  programs = {
    zellij = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        theme = "kanagawa";
        themes = {
          kanagawa = {
            fg = "#DCD7BA";
            bg = "#1F1F28";
            red = "#FFA066"; # "#C34043";
            green = "#76946A";
            yellow = "#FF9E3B";
            blue = "#7E9CD8";
            magenta = "#957FB8";
            orange =
              "#16161D"; # original orange "#FFA066" but makes compact bar unreadable
            cyan = "#7FB4CA";
            black = "#16161D";
            white = "#DCD7BA";
          };
        };
        # theme = "gruvbox-dark";
        # themes = {
        #   gruvbox-dark = {
        #     fg = "#D5C4A1";
        #     bg = "#282828";
        #     black = "#3C3836";
        #     red = "#CC241D";
        #     green = "#98971A";
        #     yellow = "#D79921";
        #     blue = "#3C8588";
        #     magenta = "#B16286";
        #     cyan = "#689D6A";
        #     white = "#FBF1C7";
        #     orange = "#D65D0E";
        #   };
        # };
      };
    };
  };
}
