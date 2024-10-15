{ pkgs, config, ... }:

let

  homeDir = config.home.homeDirectory;

in

{
  home.packages = with pkgs; [
    ripgrep-all
    # zsh
    # zsh-autosuggestions
    # zsh-completions
    # zsh-history-substring-search
    # zsh-syntax-highlighting
    # zsh-powerlevel10k
    # zsh-vi-mode
  ];

  programs = {
    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
      enableNushellIntegration = false;
      # Themes available https://ohmyposh.dev/docs/themes
      useTheme = "catppuccin_frappe";

      # settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ~/cavelab/modules/varo.json ));
      settings = builtins.fromTOML (builtins.readFile ~/cavelab/modules/omp.toml);
    };

    ripgrep = {
      enable = true;
      arguments = [ "--hidden" ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = false;
      tmux.enableShellIntegration = true;
      defaultOptions = [
        "--preview 'bat -p -f {}'"
        "--height 50%"
        "--layout=reverse"
        "--border"
        "--inline-info"
      ];
    };

    bat = {
      enable = true;
      config = {
        theme = "base16";
        style = "numbers,changes,header,grid";
        italic-text = "always";
        pager = "less -FR";
        map-syntax = [ "h:cpp" ".ignore:.gitignore" ];
      };
    };

    zoxide = {
      enable = true;
      # enableFishIntegration = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = true;
    };

    zsh = {
      enable = true;
      defaultKeymap = "viins";
      autocd = true;
      enableCompletion = true;
      autosuggestion.enable = true;
    };
 };
}
