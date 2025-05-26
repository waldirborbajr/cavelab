{
  pkgs,
  lib,
  config,
  ...
}:
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

  home.sessionPath = [
    "$HOME/development/flutter/bin"
    "$HOME/development/android-studio/bin"
  ];

  programs = {

    # oh-my-posh = {
    #   enable = true;
    #   useTheme = "robbyrussell";
    # };

    # ripgrep = {
    #   enable = true;
    #   arguments = [ "--hidden" ];
    # };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    # starship = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   settings = {
    #     palette = "foo";
    #     scan_timeout = 10;
    #
    #     palettes.foo = {
    #       mustard = "#af8700";
    #       time = "#778485";
    #       directory = "#A7A5AB";
    #       identity = "#778485";
    #       git_branch = "#778485";
    #       deleted = "#a05050";
    #       added = "#208020";
    #     };
    #
    #     fill.symbol = " ";
    #
    #     shell = {
    #       format = "[$indicator]($style) ";
    #       bash_indicator = "bsh";
    #       cmd_indicator = "cmd";
    #       elvish_indicator = "esh";
    #       fish_indicator = "";
    #       ion_indicator = "ion";
    #       nu_indicator = "nu";
    #       powershell_indicator = "_";
    #       style = "white bold";
    #       tcsh_indicator = "tsh";
    #       unknown_indicator = "mystery shell";
    #       xonsh_indicator = "xsh";
    #       zsh_indicator = "zsh";
    #       disabled = false;
    #     };
    #
    #     username = {
    #       format = "[$user]($style) ";
    #       show_always = true;
    #       style_root = "red bold bg:0x9A348E";
    #       style_user = "yellow bold bg:0x9A348E";
    #       disabled = false;
    #     };
    #
    #     hostname = {
    #       ssh_only = false;
    #       ssh_symbol = " 📞";
    #       style = "identity bold";
    #       format = "@[$hostname]($style)$ssh_symbol ";
    #     };
    #
    #     directory = {
    #       truncation_length = 3;
    #       truncation_symbol = ".../";
    #       truncate_to_repo = false;
    #       format = "[$read_only]($read_only_style)[$path]($style) ";
    #       read_only = "🔒 ";
    #       style = "directory bold";
    #     };
    #
    #     git_branch = {
    #       style = "git_branch bold";
    #       format = "[$symbol$branch(:$remote_branch)]($style) ";
    #     };
    #
    #     git_metrics = {
    #       disabled = false;
    #       added_style = "added bold";
    #       deleted_style = "deleted bold";
    #     };
    #
    #     rust = {
    #       # symbol = "";
    #       format = "[$symbol($version )]($style)";
    #       version_format = "v$raw";
    #       symbol = "🦀 ";
    #       style = "bold red bg:0x86BBD8";
    #       disabled = false;
    #       detect_extensions = ["rs"];
    #       detect_files = ["Cargo.toml"];
    #       detect_folders = [];
    #     };
    #
    #     golang = {
    #       format = "[$symbol($version )]($style)";
    #       version_format = "v$raw";
    #       symbol = " ";
    #       style = "bold cyan bg:0x86BBD8";
    #       disabled = false;
    #       detect_extensions = ["go"];
    #       detect_files = [
    #         "go.mod"
    #         "go.sum"
    #         "glide.yaml"
    #         "Gopkg.yml"
    #         "Gopkg.lock"
    #         ".go-version"
    #       ];
    #       detect_folders = ["Godeps"];
    #     };
    #
    #     nix_shell = {
    #       format = "[$symbol$state( ($name))]($style) ";
    #       disabled = false;
    #       impure_msg = "[impure](bold red)";
    #       pure_msg = "[pure](bold green)";
    #       style = "bold blue";
    #       symbol = " ";
    #     };
    #
    #     python = {
    #       symbol = "";
    #       format = "[$symbol ($version) (($virtualenv) )]($style)";
    #       python_binary = [
    #         "python"
    #         "python3"
    #         "python2"
    #       ];
    #       # pyenv_version_name = true;
    #       style = "yellow bold";
    #       disabled = false;
    #       detect_extensions = ["py"];
    #       detect_files = [
    #         "requirements.txt"
    #         ".python-version"
    #         "pyproject.toml"
    #         "Pipfile"
    #         "tox.ini"
    #         "setup.py"
    #         "__init__.py"
    #       ];
    #       detect_folders = [];
    #     };
    #
    #     time = {
    #       disabled = false;
    #       format = "[$time]($style)";
    #       style = "time bold";
    #     };
    #
    #     cmd_duration = {
    #       style = "mustard bold";
    #       format = "[$duration]($style) ";
    #     };
    #
    #     jobs = {
    #       format = "[$number$symbol]($style)";
    #       symbol = "⚙ ";
    #       style = "mustard bold";
    #     };
    #
    #     format =
    #       let
    #         who = [
    #           "$username"
    #           "$hostname"
    #           "$directory"
    #         ];
    #
    #         git = [
    #           "$git_branch"
    #           "$git_state"
    #           "$git_status"
    #           "$git_metrics"
    #         ];
    #
    #         fill = [ "$fill" ];
    #
    #         duration = [
    #           "$cmd_duration"
    #         ];
    #
    #         time = [
    #           "$jobs"
    #           "$time"
    #         ];
    #
    #         languages = [
    #           "$nix_shell"
    #           "$nodejs"
    #           "$golang"
    #           "$rust"
    #           "$python"
    #           "$lua"
    #         ];
    #
    #
    #         prompt = [
    #           "$line_break"
    #           "❯ "
    #         ];
    #       in
    #       lib.concatStrings (who ++ git ++ fill ++ duration ++ languages ++ time ++ prompt);
    #   };
    # };

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

    # bat = {
    #   enable = true;
    #   config = {
    #     theme = "base16";
    #     style = "numbers,changes,header,grid";
    #     italic-text = "always";
    #     pager = "less -FR";
    #     map-syntax = [
    #       "h:cpp"
    #       ".ignore:.gitignore"
    #     ];
    #   };
    # };

    # zoxide = {
    #   enable = true;
    #   # enableFishIntegration = true;
    #   enableZshIntegration = true;
    # };

    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
    };

    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      autosuggestion.enable = true;
      enableCompletion = true;
      defaultKeymap = "viins";
      autocd = true;

      sessionVariables = {
        # SHELL = pkgs.zsh;
        DIRENV_LOG_FORMAT = "";
        LC_ALL = "en_US.UTF-8";
        NIXPKGS_ALLOW_UNFREE = 1;
        TERM = "xterm-256color";
      };

      history = {
        expireDuplicatesFirst = true;
        extended = true;
        ignoreAllDups = true;
        ignoreDups = true;
        ignoreSpace = true;
        share = true;
        ignorePatterns = [ "*.private*" ];

        # path = "${config.xdg.dataHome}/zsh/history";
        path = "${config.xdg.cacheHome}/zsh/zsh_history";

        save = 512 * 1024 * 1024; # Save more.
        size = 512 * 1024 * 1024; # Save more.
        # share = true;
      };

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        ff = "fastfetch";

        syshealth = "sudo nala update && sudo rm /var/lib/apt/lists/lock && sudo nala upgrade -y && sudo nala autoremove -y && sudo nala autopurge -y && sudo nala clean && flatpak update -y && flatpak uninstall --unused -y && sudo snap refresh";

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
        d = "docker";
        da = "docker ps -a";
        di = "docker images";
        de = "docker exec -it";
        dr = "docker run --rm -it";
        drma = "docker stop $(docker ps -aq) && docker rm -f $(docker ps -aq)";
        drmi = "di | grep none | awk '{print $3}' | sponge | xargs docker rmi";

        # drmd = "docker rmi $(docker images -q --filter 'dangling=true')";
        # drmc = "docker rm $(docker ps -aq)";
        drmii = "docker rmi $(docker images -a -q)";

        docker_clean = "docker builder prune -a --force";
        drmd = "docker rmi $(docker images -a --filter=dangling=true -q)";
        drmc = "docker rm $(docker ps --filter=status=exited --filter=status=created -q)";

        ld = "lazydocker";
        lg = "lazygit";

        repo = "cd $HOME/Documents/repositories";
        temp = "cd $HOME/Downloads/temp";

        v = "nvim";
        vi = "nvim";
        vim = "nvim";

        rmvim = "rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim && rm -rf ~/.local/state/nvim";

        # l = "eza --icons";
        # ls = "eza --icons";
        # ll = "eza -lg --icons --group-directories-first";
        # la = "eza -lag --icons --group-directories-first";
        # lt = "eza -lTg --icons";
        # lt1 = "eza -lTg --level=1 --icons";
        # lt2 = "eza -lTg --level=2 --icons";
        # lt3 = "eza -lTg --level=3 --icons";
        # lta = "eza -lTag --icons";
        # lta1 = "eza -lTag --level=1 --icons";
        # lta2 = "eza -lTag --level=2 --icons";
        # lta3 = "eza -lTag --level=3 --icons";

        ls = "lsd";
        l = "ls -l";
        la = "ls -a";
        lla = "ls -la";
        lt = "ls --tree";

        tmc = "clear; tmux clear-history; clear";
        tmk = "tmux kill-session";

        zj = "zellij a -c 'B+ DevOps'";
        zlcahe = "rm -rf ~/.cache/zellij";

        aq = "asciiquarium -s";

        xterm = "sudo update-alternatives --config x-terminal-emulator";

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
        ZVM_VI_INSERT_ESCAPE_BINDKEY = "jk";
        ZSH_AUTOSUGGEST_STRATEGY = [
          "history"
          "completion"
        ];
      };

      # profileExtra = ''
      #   export ANDROID_HOME=$HOME/development/Android/sdk/
      # '';

      initContent= ''

        export ANDROID_SDK_ROOT=$HOME/development/Android/Sdk/
        export ANDROID_HOME=$HOME/development/Android/Sdk/
        # export ANDROID_AVD_HOME=/Volumes/home/VMS/Android-Emulator
        export PATH=$ANDROID_SDK_ROOT/tools:$PATH
        export PATH=$ANDROID_SDK_ROOT/tools/bin:$PATH
        export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
        # \"Android SDK Command-line Tools (latest)\" needs to be installed (See SETUP_MACOS.md)
        export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH
        export CHROME_EXECUTABLE=/home/borba/.nix-profile/bin/chromium
        # export CHROME_EXECUTABLE=/snap/bin/chromium

        # export GOPATH=$(mise exec go --command 'go env GOPATH')
        # export GOROOT=$(mise exec go --command 'go env GOROOT')
        # export GOBIN=$(mise exec go --command 'go env GOBIN')

        export PATH=$PATH:$GOPATH/bin
        export PATH=$PATH:$GOROOT/bin
        export PATH=$PATH:$GOBIN
        export PATH=$PATH:$HOME/.local/bin
        export PATH=$PATH:$HOME/snap/multipass/common/bin

        function cd() {
          builtin cd $*
          lsd
        }

        function mkd() {
          mkdir $1
          builtin cd $1
        }

        function _list_zellij_sessions () {
          zellij list-sessions 2>/dev/null | sed -e 's/\x1b\[[0-9;]*m//g'
        }

        function zja() {
          zj_session=$(_list_zellij_sessions | rg -v '(EXITED -|\(current\))' | awk '{print $1}' | fzf)
          if [[ -n $zj_session ]]; then
            wezterm start -- zsh --login -c "zellij attach $session"
          fi
        }

        function zjl() {
          layout=$(fd '.*' "$HOME/.config/zellij/layouts" | xargs -I{} basename {} .kdl | fzf)
          if [[ -n $layout ]]; then
            wezterm start -- zsh --login -c "zellij --layout $layout attach -c $layout"
          fi
        }

        function zjgc() {
          sessions=$(_list_zellij_sessions | awk '/EXITED -/ {print $1}' )
          if [[ -n $sessions ]]; then
            echo $sessions | xargs -n1 zellij d
          fi
        }

        function zjd() {
          sessions=$(_list_zellij_sessions | awk '{print $1}' | fzf -m)
          if [[ -n $sessions ]]; then
            echo $sessions | xargs -n1 zellij d --force
          fi
        }

        function chirpinstall() {

          URL="$1"

          FILENAME=$(basename "$URL")

          cd $HOME/Downloads/
          
          curl -O $URL
          pipx install --system-site-packages --force $FILENAME
        }

        function ghpr() {
          GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
        }

        function venvnew() {

          if [[ -z  "$1" ]]; then
            exit 1;
          fi

          mkdir $1
          cd $1
          uv init --bare
          # uv add 'flet[all]' --dev
          # uv run flet create
          source .venv/bin/activate
        }

        function venvon() {
          source .venv/bin/activate
        }

        function venvoff() {
          deactivate
        }

        # # Starship initialization
        # eval "($starship init zsh)"
        # eval "$(${pkgs.starship}/bin/starship init zsh)"

        # Zoxide initialization
        # eval "($zoxide init zsh)"
      '';
    };
  };
}
