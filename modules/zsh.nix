{ config, ... }:

{
  # home.packages = with pkgs;
  #   [
  #
  #     # Make zsh as default shell
  #     # (writeShellScriptBin "init_zsh" ''
  #     #   command -v zsh | sudo tee -a /etc/shells
  #     #   chsh -s $(which zsh)
  #     # '')
  #
  #     # oh-my-zsh
  #   ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;

    dotDir = ".config/zsh";

    sessionVariables = {
      # Make zsh as default shell
      SHELL = "/home/ubuntu/.nix-profile/bin/zsh";
      ZSH_AUTOSUGGEST_STRATEGY = "history completion";
      EDITOR = "vim";
      VISUAL = "vim";
      XDG_CONFIG_HOME = "$HOME/.config";
    };

    history = {
      extended = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      size = 512 * 1024 * 1024;
      save = 512 * 1024 * 1024;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    prezto = {
      enable = true;
      pmodules = [
        "archive"
        "autosuggestions"
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "ssh"
        "completion"
        "git"
        "syntax-highlighting"
        "history-substring-search"
        "node"
        "prompt"
      ];

    };

    shellAliases = {
      hmd = "cd /home/ubuntu/cavelab";
      hmb = "home-manager switch --flake .#cavelab";
      s = "git status --short";
      r = "reset";
      ".." = "cd ..";
      gg = "lazygit";
    };

  };

}

