{ pkgs, config, ... }:
let

  promptChar = "ᛥ";
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
    zsh-vi-mode
  ];

  programs = {

    # oh-my-posh = {
    #   enable = true;
    #   useTheme = "robbyrussell";
    # };

    ripgrep = {
      enable = true;
      arguments = [ "--hidden" ];
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;

      # starship config
      starship = {
        enable = true;
        settings = {
          add_newline = false;
          character = {
            success_symbol = "[${promptChar}](bright-green)";
            error_symbol = "[${promptChar}](bright-red)";
          };
          golang = {
            style = "fg:#00ADD8";
            symbol = "go ";
          };
          directory.style = "fg:#d442f5";
          nix_shell = {
            pure_msg = "";
            impure_msg = "";
            format = "via [$symbol$state]($style) ";
          };
          kubernetes = {
            disabled = false;
            style = "fg:#326ce5";
          };
          terraform = {
            disabled = false;
            format = "via [$symbol $version]($style) ";
            symbol = "🌴";
          };
          nodejs = {
            symbol = "⬡ ";
          };

          # disabled plugins
          aws.disabled = true;
          cmd_duration.disabled = true;
          gcloud.disabled = true;
          package.disabled = true;
        };
      };
    };

    # starship = {
    #   enable = true;
    #   enableZshIntegration = false;
    #   settings = {
    #     command_timeout = 350; # It's very noticable and anoying beyond this
    #     add_newline = false;
    #     right_format = "$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$nix_shell$cmd_duration";
    #     directory = {
    #       read_only = " ";
    #       style = "bold fg:dark_blue";
    #       format = "[$path ]($style)";
    #       truncation_length = 3;
    #       truncation_symbol = "…/";
    #       truncate_to_repo = false;
    #     };
    #     cmd_duration = {
    #       min_time = 500;
    #       style = "fg:gray";
    #       format = "[$duration]($style)";
    #     };
    #     character = {
    #       success_symbol = "[λ](bold green)";
    #       error_symbol = "[λ](bold red)";
    #     };
    #     username = {
    #       disabled = false;
    #       show_always = true;
    #       style_root = "bold red";
    #       style_user = "blue yellow";
    #       format = "[$user]($style)";
    #     };
    #     hostname = {
    #       disabled = false;
    #       ssh_only = false;
    #       style = "bold dimmed green";
    #       format = "[@$hostname]($style)";
    #     };
    #     git_branch.symbol = " ";
    #     git_commit.tag_disabled = false;
    #     git_status = {
    #       format = "[](fg:#232526 bg:none)[$all_status $ahead_behind]($style)[](fg:#232526 bg:#232526)[](fg:#67afc1 bg:#232526)[  ](fg:#232526 bg:#67afc1)[](fg:#67afc1 bg:none)";
    #       style = "fg:#D4BE98 bg:#232526";
    #       conflicted = "=";
    #       ahead = "⇡$\{count\}";
    #       behind = "⇣$\{count\}";
    #       diverged = "⇕⇡$\{ahead_count\}⇣$\{behind_count\}";
    #       up_to_date = "";
    #       untracked = "?$\{count\}";
    #       stashed = "";
    #       modified = "!$\{count\}";
    #       staged = "+$\{count\}";
    #       renamed = "»$\{count\}";
    #       deleted = "$\{count\}";
    #     };
    #     golang = {
    #       style = "blue";
    #       symbol = "";
    #       format = "[ $symbol( $version) ]($style)";
    #       detect_files = [ "go.mod" ];
    #     };
    #     nix_shell = {
    #       format = "via [$symbol$state]($style) ";
    #       impure_msg = "ι";
    #       pure_msg = "﻿ρ";
    #       symbol = " ";
    #     };
    #     lua = {
    #       format = "[$symbol($version )]($style)";
    #       symbol = " ";
    #     };
    #     docker_context = {
    #       symbol = " ";
    #       style = "fg:#06969";
    #       format = "[$symbol]($style) ($path)";
    #       detect_extensions = [ "Dockerfile" ];
    #     };
    #     cmake.disabled = true;
    #     python.disabled = true;
    #     aws.symbol = "  ";
    #     rust.symbol = " ";
    #     nodejs.symbol = " ";
    #   };
    # };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = false;
      tmux.enableShellIntegration = true;
      defaultCommand = "find .";
      defaultOptions = [
        "--bind '?:toggle-preview'"
        "--bind 'ctrl-a:select-all'"
        "--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'"
        "--bind 'ctrl-y:execute-silent(echo {+} | wl-copy)'"
        "--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'"
        "--height=40%"
        "--info=inline"
        "--layout=reverse"
        "--multi"
        "--preview '([[ -f {}  ]] && (bat --color=always --style=numbers,changes {} || cat {})) || ([[ -d {}  ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
        "--preview-window=:hidden"
        "--prompt='~ ' --pointer='▶' --marker='✓'"
      ];
    };

    bat = {
      enable = true;
      config = {
        theme = "base16";
        style = "numbers,changes,header,grid";
        italic-text = "always";
        pager = "less -FR";
        map-syntax = [
          "h:cpp"
          ".ignore:.gitignore"
        ];
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
      icons = "auto";
    };

    zsh = {
      enable = true;

      defaultKeymap = "viins";
      autocd = true;
      enableCompletion = true;
      autosuggestion.enable = true;

      dotDir = ".config/zsh";

      sessionVariables = {
        # SHELL = pkgs.zsh;
        DIRENV_LOG_FORMAT = "";
        LC_ALL = "en_US.UTF-8";
        NIXPKGS_ALLOW_UNFREE = 1;
        TERM = "xterm-256color";
      };

      history = {
        path = "${config.xdg.dataHome}/zsh/history";
        expireDuplicatesFirst = true;
        extended = true;
        ignoreAllDups = true;
        ignoreDups = true;
        ignoreSpace = true;
        save = 512 * 1024 * 1024; # Save more.
        size = 512 * 1024 * 1024; # Save more.
        share = true;
      };

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        ff = "fastfetch";

        syshealth = "sudo nala update && sudo rm /var/lib/apt/lists/lock && sudo nala upgrade -y && sudo nala autoremove -y && sudo nala autopurge -y && sudo nala clean && flatpak update -y && flatpak uninstall --unused -y && sudo snap refresh";

        # git
        # gaa = "git add --all";
        # gcam = "git commit --all --message";
        # gcl = "git clone";
        # gco = "git checkout";
        # ggl = "git pull";
        # ggp = "git push";

        # kubectl
        k = "kubectl";
        kgno = "kubectl get node";
        kdno = "kubectl describe node";
        kgp = "kubectl get pods";
        kep = "kubectl edit pods";
        kdp = "kubectl describe pods";
        kdelp = "kubectl delete pods";
        kgs = "kubectl get svc";
        kes = "kubectl edit svc";
        kds = "kubectl describe svc";
        kdels = "kubectl delete svc";
        kgi = "kubectl get ingress";
        kei = "kubectl edit ingress";
        kdi = "kubectl describe ingress";
        kdeli = "kubectl delete ingress";
        kgns = "kubectl get namespaces";
        kens = "kubectl edit namespace";
        kdns = "kubectl describe namespace";
        kdelns = "kubectl delete namespace";
        kgd = "kubectl get deployment";
        ked = "kubectl edit deployment";
        kdd = "kubectl describe deployment";
        kdeld = "kubectl delete deployment";
        kgsec = "kubectl get secret";
        kdsec = "kubectl describe secret";
        kdelsec = "kubectl delete secret";

        # docker
        # docker
        d = "docker";
        da = "docker ps -a";
        di = "docker images";
        de = "docker exec -it";
        dr = "docker run --rm -it";
        drma = "docker stop $(docker ps -aq) && docker rm -f $(docker ps -aq)";
        drmi = "di | grep none | awk '{print $3}' | sponge | xargs docker rmi";

        drmd = "docker rmi $(docker images -q --filter 'dangling=true')";
        drmc = "docker rm $(docker ps -aq)";
        drmii = "docker rmi $(docker images -a -q)";

        ld = "lazydocker";
        lg = "lazygit";

        repo = "cd $HOME/Documents/repositories";
        temp = "cd $HOME/Downloads/temp";

        v = "nvim";
        vi = "nvim";
        vim = "nvim";

        l = "eza --icons";
        ls = "eza --icons";
        ll = "eza -lg --icons --group-directories-first";
        la = "eza -lag --icons --group-directories-first";
        lt = "eza -lTg --icons";
        lt1 = "eza -lTg --level=1 --icons";
        lt2 = "eza -lTg --level=2 --icons";
        lt3 = "eza -lTg --level=3 --icons";
        lta = "eza -lTag --icons";
        lta1 = "eza -lTag --level=1 --icons";
        lta2 = "eza -lTag --level=2 --icons";
        lta3 = "eza -lTag --level=3 --icons";

        tmc = "clear; tmux clear-history; clear";
        tmk = "tmux kill-session";

        zj = "zellij a -c 'B+ DevOps'";
        zlcahe = "rm -rf ~/.cache/zellij";

        aq = "asciiquarium -s";

      };

      completionInit = ''
        # Load Zsh modules
        zmodload zsh/zle
        zmodload zsh/zpty
        zmodload zsh/complist

        # Initialize colors
        autoload -Uz colors
        colors

        # Initialize completion system
        autoload -U compinit
        compinit
        _comp_options+=(globdots)

        # Load edit-command-line for ZLE
        autoload -Uz edit-command-line
        zle -N edit-command-line
        bindkey "^e" edit-command-line

        # General completion behavior
        zstyle ':completion:*' completer _extensions _complete _approximate

        # Use cache
        zstyle ':completion:*' use-cache on
        zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

        # Complete the alias
        zstyle ':completion:*' complete true

        # Autocomplete options
        zstyle ':completion:*' complete-options true

        # Completion matching control
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
        zstyle ':completion:*' keep-prefix true

        # Group matches and describe
        zstyle ':completion:*' menu select
        zstyle ':completion:*' list-grouped false
        zstyle ':completion:*' list-separator '''
        zstyle ':completion:*' group-name '''
        zstyle ':completion:*' verbose yes
        zstyle ':completion:*:matches' group 'yes'
        zstyle ':completion:*:warnings' format '%F{red}%B-- No match for: %d --%b%f'
        zstyle ':completion:*:messages' format '%d'
        zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
        zstyle ':completion:*:descriptions' format '[%d]'

        # Colors
        zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

        # Directories
        zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
        zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
        zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
        zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
        zstyle ':completion:*' special-dirs true
        zstyle ':completion:*' squeeze-slashes true

        # Sort
        zstyle ':completion:*' sort false
        zstyle ":completion:*:git-checkout:*" sort false
        zstyle ':completion:*' file-sort modification
        zstyle ':completion:*:eza' sort false
        zstyle ':completion:complete:*:options' sort false
        zstyle ':completion:files' sort false

        # fzf-tab
        zstyle ':fzf-tab:complete:*:*' fzf-preview 'preview $realpath'
        zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
        zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'
        zstyle ':fzf-tab:*' fzf-command fzf
        zstyle ':fzf-tab:*' fzf-pad 4
        zstyle ':fzf-tab:*' fzf-min-height 100
        zstyle ':fzf-tab:*' switch-group ',' '.'
      '';

      localVariables = {
        TZ = "America/Sao_Paulo";
      };

      initExtra = ''
        # # Starship initialization
        # eval "($starship init zsh)"
        eval "$(${pkgs.starship}/bin/starship init zsh)"

        # Zoxide initialization
        eval "($zoxide init zsh)"
      '';
    };
  };
}
