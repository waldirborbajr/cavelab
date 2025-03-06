{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    envExtra = "";

    shellAliases = {
      ls = "lsd";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";
    };
    history = {
      size = 10000;
      path = "${config.xdg.configHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      custom = "${config.xdg.configHome}/zsh/custom";
      plugins = [
        "git"
        "sudo"
        "fzf"
        "colorize"
        "command-not-found"
        "colored-man-pages"
        "cp"
        "docker"
        "emoji-clock"
        "emoji"
        "sudo"
        "zoxide"
        "navi"
        "rust"
        "tmuxinator"
      ];
      theme = "cat";
    };
  };
}
