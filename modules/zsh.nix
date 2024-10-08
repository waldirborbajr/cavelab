{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ zsh oh-my-zsh fzf ripgrep direnv ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;

    dotDir = ".config/zsh";

    sessionVariables = {
      SHELL = "/home/ubuntu/.nix-profile/bin/zsh";
      ZSH_AUTOSUGGEST_STRATEGY = "history completion";
    };

    history = {
      extended = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      size =  512 * 1024 * 1025;
      save =  512 * 1024 * 1025;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      theme = "lambda";
      plugins = [ "sudo" "common-aliases" "mosh" "ssh-agent" "git" "fzf"  ];
      extraConfig = ''
        zstyle :omz:plugins:ssh-agent agent-forwarding yes
        zstyle :omz:plugins:ssh-agent lazy yes
      '';
    };

    plugins = [
      {
        name = "catppuccin-zsh-syntax-hightlighting";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "zsh-syntax-highlighting";
          rev = "06d519c20798f0ebe275fc3a8101841faaeee8ea";
          sha256 = "1yj916klvzpvwghii7m6qx2ya3p2kx25nydymilvjzbx8z0sdcj3";
        };
        file = "themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        src = pkgs.zsh-syntax-highlighting;
      }
    ];

    shellAliases = {
      hmd = "cd /home/ubuntu/cavelab";
      hmb = "home-manager switch --flake .#cavelab";
      s = "git status --short";
      l = "git lg";
      r = "reset";
      ".." = "cd ..";
      gg = "lazygit";
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

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

}

