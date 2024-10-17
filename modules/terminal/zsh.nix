{ pkgs, config, ... }:

{
  home.packages = with pkgs;
    [
      ripgrep-all
      # zsh
      # zsh-autosuggestions
      # zsh-completions
      # zsh-history-substring-search
      # zsh-syntax-highlighting
      # zsh-powerlevel10k
      # zsh-vi-mode
    ];

  # environment.shells = with pkgs; [ zsh ];
  # users.defaultUserShell = pkgs.zsh;

  programs = {
    # oh-my-posh = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   enableBashIntegration = false;
    #   enableFishIntegration = false;
    #   enableNushellIntegration = false;
    #   # Themes available https://ohmyposh.dev/docs/themes
    #   useTheme = "catppuccin_frappe";
    #
    #   # settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ~/cavelab/modules/omp.json ));
    #   # settings = builtins.fromTOML (builtins.readFile ~/cavelab/modules/omp.toml);
    #   settings = {
    #     version = 2;
    #     auto_upgrade = false;
    #     disable_notice = true;
    #     final_space = true;
    #     terminal_background = "#1E1E2E";
    #     palette = {
    #       os = "#ACB0BE";
    #       closer = "p:os";
    #       pink = "#F5C2E7";
    #       lavender = "#B4BEFE";
    #       blue = "#89B4FA";
    #       error = "#D0164A";
    #     };
    #     secondary_prompt = {
    #       template = " ";
    #       foreground = "p:closer";
    #     };
    #     blocks = [
    #       {
    #         type = "prompt";
    #         alignment = "left";
    #         newline = true;
    #         segments = [
    #           {
    #             type = "os";
    #             template = "{{ if .WSL }}WSL at {{ end }}{{ .Icon }}";
    #             style = "plain";
    #             foreground = "p:os";
    #           }
    #           {
    #             type = "session";
    #             style = "plain";
    #             foreground = "p:blue";
    #           }
    #           {
    #             type = "path";
    #             template =
    #               "{{ if not .Writable }}<p:error> </>{{ end }}{{ .Path }} ";
    #             style = "plain";
    #             foreground = "p:pink";
    #             properties = {
    #               style = "full";
    #               home_icon = "~";
    #             };
    #           }
    #           {
    #             type = "git";
    #             template =
    #               "{{ .UpstreamIcon }}{{ .HEAD }}{{ if .BranchStatus }} {{ .BranchStatus }}{{ end }}"
    #               + "{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}"
    #               + "{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }}  {{ .StashCount }}{{ end }}";
    #             style = "plain";
    #             foreground = "p:lavender";
    #             properties = {
    #               git_icon = " ";
    #               branch_icon = " ";
    #               cherry_pick_icon = " ";
    #               commit_icon = " ";
    #               fetch_status = true;
    #               fetch_upstream_icon = true;
    #               merge_icon = " ";
    #               no_commits_icon = " ";
    #               rebase_icon = " ";
    #               revert_icon = " ";
    #               tag_icon = " ";
    #             };
    #           }
    #         ];
    #       }
    #       {
    #         type = "prompt";
    #         alignment = "left";
    #         newline = true;
    #         segments = [{
    #           type = "kubectl";
    #           template = ''
    #             {{ if eq "true" .Env.SHOW_KUBERNETES_INFO_IN_PROMPT }}󱃾 {{ .Context }}::{{ if .Namespace }}{{ .Namespace }}{{ else }}default{{ end }}{{ end }}'';
    #           style = "plain";
    #           foreground = "p:blue";
    #           propterties = { parse_kubeconfig = false; };
    #         }];
    #       }
    #       {
    #         type = "prompt";
    #         alignment = "left";
    #         newline = true;
    #         segments = [
    #           {
    #             type = "root";
    #             style = "plain";
    #             foreground = "p:error";
    #           }
    #           {
    #             type = "text";
    #             template = "";
    #             style = "plain";
    #             foreground = "p:closer";
    #           }
    #         ];
    #       }
    #     ];
    #   };
    # };
    #
    # ripgrep = {
    #   enable = true;
    #   arguments = [ "--hidden" ];
    # };
    #
    # fzf = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   enableFishIntegration = false;
    #   tmux.enableShellIntegration = true;
    #   defaultCommand = "find .";
    #   defaultOptions = [
    #     "--bind '?:toggle-preview'"
    #     "--bind 'ctrl-a:select-all'"
    #     "--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'"
    #     "--bind 'ctrl-y:execute-silent(echo {+} | wl-copy)'"
    #     "--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'"
    #     "--height=40%"
    #     "--info=inline"
    #     "--layout=reverse"
    #     "--multi"
    #     "--preview '([[ -f {}  ]] && (bat --color=always --style=numbers,changes {} || cat {})) || ([[ -d {}  ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
    #     "--preview-window=:hidden"
    #     "--prompt='~ ' --pointer='▶' --marker='✓'"
    #   ];
    # };
    #
    # bat = {
    #   enable = true;
    #   config = {
    #     theme = "base16";
    #     style = "numbers,changes,header,grid";
    #     italic-text = "always";
    #     pager = "less -FR";
    #     map-syntax = [ "h:cpp" ".ignore:.gitignore" ];
    #   };
    # };
    #
    # zoxide = {
    #   enable = true;
    #   # enableFishIntegration = true;
    #   enableZshIntegration = true;
    # };
    #
    # eza = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   git = true;
    #   icons = true;
    # };

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
      };

      initExtra = ''
        export EDITOR=nvim

        # if [ -n "$TTY" ]; then
        #   export GPG_TTY=$(tty)
        # else
        #   export GPG_TTY="$TTY"
        # fi
        #
        # # SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.
        # export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
        # gpgconf --launch gpg-agent
        #
        # bindkey -e
        #
        # bindkey '^[w' kill-region
        #
        # zle_highlight+=(paste:none)

        # setopt appendhistory
        # setopt sharehistory
        # setopt hist_ignore_space
        # setopt hist_ignore_all_dups
        # setopt hist_save_no_dups
        # setopt hist_ignore_dups
        # setopt hist_find_no_dups

        # Force UTF-8
        export LC_ALL=en_US.UTF-8
        export LANG=en_US.UTF-8

        # Set fzf options
        # export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
        # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --no-ignore"
        # export FZF_DEFAULT_OPTS='--bind ctrl-y:preview-up,ctrl-e:preview-down,left:toggle+up,right:toggle+down'
        # export FZF_DEFAULT_OPTS=" \
        # --multi \
        # --cycle \
        # --reverse \
        # --bind='ctrl-space:toggle,pgup:preview-up,pgdn:preview-down' \
        # --ansi \
        # --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        # --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        # --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
        # "

        # eval "$(zoxide init zsh)"
      '';

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

      history = {
        path = "${config.xdg.dataHome}/zsh/history";
        expireDuplicatesFirst = true;
        extended = true;
        ignoreAllDups = true;
        ignoreDups = true;
        ignoreSpace = true;
        # save = 512 * 1024 * 1024; # Save more.
        # size = 512 * 1024 * 1024; # Save more.
        share = true;
      };

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        ff = "fastfetch";

        syshealth =
          "sudo nala update && sudo rm /var/lib/apt/lists/lock && sudo nala upgrade -y && sudo nala autoremove -y && sudo nala autopurge -y && sudo nala clean && flatpak update -y && flatpak uninstall --unused -y && sudo snap refresh";

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

        ld = "lazydocker";
        lg = "lazygit";

        repo = "cd $HOME/Documents/repositories";
        temp = "cd $HOME/Downloads/temp";

        v = "nvim";
        vi = "nvim";
        vim = "nvim";

        ls = "eza --icons always"; # default view
        ll = "eza -bhl --icons --group-directories-first"; # long list
        la = "eza -abhl --icons --group-directories-first"; # all list
        lt = "eza --tree --level=2 --icons"; # tree
      };
    };
  };
}
