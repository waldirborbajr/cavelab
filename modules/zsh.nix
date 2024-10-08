{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "risto";
      plugins = [ "sudo" "common-aliases" "mosh" "ssh-agent" ];
      extraConfig = ''
        zstyle :omz:plugins:ssh-agent agent-forwarding yes
        zstyle :omz:plugins:ssh-agent lazy yes
      '';
    };

    history = {
      extended = true;
      size =  512 * 1024 * 1025;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    shellAliases = {
      hmd = "cd /home/ubuntu/cavelab";
      hmb = "home-manager switch --flake .#cavelab";
      s = "git status --short";
      l = "git lg";
      r = "reset";
      ".." = "cd ..";
    };

    # initExtra = ''
    #   zstyle ':completion:*' matcher-list "" 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    #   # setopt MENU_COMPLETE
    #   ulimit -n 4096
    #
    #   # fzf
    #   export FZF_COMPLETION_TRIGGER='*'
    #   export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    #   export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    #   _fzf_compgen_path() {
    #     fd --hidden --follow --exclude '.git' . "$1"
    #   }
    #   _fzf_compgen_dir() {
    #     fd --type d --hidden --follow --exclude '.git' . "$1"
    #   }
    #
    #   # pure-prompt
    #   . ${pkgs.pure-prompt}/share/zsh/site-functions/async
    #   . ${pkgs.pure-prompt}/share/zsh/site-functions/prompt_pure_setup
    #   PURE_GIT_PULL=0
    #   RPS1=""
    #
    #   # zsh-fast-syntax-highlighting
    #   . ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
    #
    #   # zsh-history-substring-search
    #   . ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    #   bindkey '^[OA' history-substring-search-up
    #   bindkey '^[OB' history-substring-search-down
    #   bindkey -M emacs '^P' history-substring-search-up
    #   bindkey -M emacs '^N' history-substring-search-down
    #   bindkey -M vicmd 'k' history-substring-search-up
    #   bindkey -M vicmd 'j' history-substring-search-down
    #
    #   # zsh-nix-shell
    #   . ${pkgs.zsh-nix-shell}/share/zsh-nix-shell/nix-shell.plugin.zsh
    # '';
  };
}

