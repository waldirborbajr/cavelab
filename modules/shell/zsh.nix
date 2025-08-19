{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./jq.nix
    ./ripgrep.nix
    ./starship.nix
    ./zoxide.nix
    ./yazi.nix
  ];

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    defaultKeymap = "viins";

    enableCompletion = true;

    autosuggestion = {
      enable = true;
      strategy = ["history" "completion"];
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "cursor" "regexp" "root" "line"];
    };

    historySubstringSearch = {
      enable = true;
      searchUpKey = ["^[[A"];
      searchDownKey = ["^[[B"];
    };

    dirHashes = {
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      wks = "$HOME/wks";
      cav = "$HOME/cavelab";
      pics = "$HOME/Pictures";
      vids = "$HOME/Videos";
      nixpkgs = "$HOME/Documents/code/git/nixpkgs";
    };

    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      save = 512 * 1024 * 1024; # Save more.
      size = 512 * 1024 * 1024; # Save more.
      append = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      extended = true;
      share = true;
    };

    completionInit = ''
      zmodload zsh/complist
      autoload -U compinit; compinit
      _comp_options+=(globdots)
    '';

    initContent = ''

      function chirpinstall() {

        URL="$1"

        FILENAME=$(basename "$URL")

        cd $HOME/Downloads/
        
        curl -O $URL
        pipx install --system-site-packages --force $FILENAME
      }

      # which starship >/dev/null && eval "$(starship init zsh)"
      which zoxide >/dev/null && eval "$(zoxide init zsh --cmd cd)"

      while read -r option; do
        setopt $option
      done <<-EOF
      ALWAYS_TO_END
      AUTO_CD
      AUTO_LIST
      AUTO_MENU
      AUTO_PARAM_SLASH
      AUTO_PUSHD
      CDABLE_VARS
      COMPLETE_IN_WORD
      HASH_LIST_ALL
      INTERACTIVE_COMMENTS
      NO_BEEP
      NOTIFY
      PATH_DIRS
      PUSHD_IGNORE_DUPS
      PUSHD_SILENT
      EOF

      while read -r option; do
        unsetopt $option
      done <<-EOF
      FLOW_CONTROL
      MENU_COMPLETE
      EOF

      # Ztyle pattern
      # :completion:<function>:<completer>:<command>:<argument>:<tag>

      # case insensitive tab completion
      zstyle ':completion:*' completer _complete _ignored _approximate
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' menu select
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' verbose true

      # use cache for completions
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
      _comp_options+=(globdots)

      # zstyle ':completion:*' completer _complete _ignored _approximate
      # zstyle ':completion:*' complete true
      # zstyle ':completion:*' complete-options true
      # zstyle ':completion:*' file-sort modification
      # zstyle ':completion:*' group-name '''
      # zstyle ':completion:*' keep-prefix true
      # zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      # zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      # zstyle ':completion:*' menu select
      # zstyle ':completion:*' verbose true
      #
      # zstyle ':completion:*:default' list-prompt '%S%M matches%s'
      # zstyle ':completion:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
      # zstyle ':completion:*:descriptions' format '%F{blue}-- %D %d --%f'
      # zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
      # zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
      # zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
      #
      # zstyle ':completion:*' use-cache on
      # zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
    '';

    shellAliases = let
      inherit (lib) getExe;
      inherit (pkgs) bat ripgrep dust procs;
    in {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      syshealth = "sudo rm -rv /var/lib/apt/lists/* && sudo nala update && sudo rm /var/lib/apt/lists/lock && sudo nala upgrade -y && sudo nala autoremove -y && sudo nala autopurge -y && sudo nala clean && flatpak update -y && flatpak uninstall --unused -y && sudo snap refresh";

      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      rmvim = "rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim && rm -rf ~/.local/state/nvim";

      ls = "lsd";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";
      ll = "ls -larth";

      tmc = "clear; tmux clear-history; clear";
      tmk = "tmux kill-session";

      zj = "zellij a -c 'B+ DevOps'";
      zlcahe = "rm -rf ~/.cache/zellij";

      aq = "asciiquarium -s";

      xterm = "sudo update-alternatives --config x-terminal-emulator";

      y = "yazi";

      cat = "${getExe bat} --color=always --theme=base16 --style=plain --paging=never";
      du = "${getExe dust}";
      grep = "${getExe ripgrep}";
      ps = "${getExe procs}";

      cp = "cp -iv";
      rm = "rm -iv";
      mv = "mv -iv";

      nb = "nix-build";
      nd = "nix develop";
      nr = "nix run";
      ns = "nix-shell";
      nu = "nix-update";

      cleanup = "sudo nix-collect-garbage --delete-older-than 3d && nix-collect-garbage -d";
      bloat = "nix path-info -Sh /run/current-system";
      repair = "nix-store --verify --check-contents --repair";

      reboot = "systemctl reboot";


    };

    plugins = with pkgs; [
      {
        name = "zsh-forgit";
        src = zsh-forgit;
        file = "share/zsh/zsh-forgit/forgit.plugin.zsh";
      }
      {
        name = "zsh-autopair";
        src = zsh-autopair;
        file = "share/zsh/zsh-autopair/autopair.zsh";
      }
      {
        name = "zsh-you-should-use";
        src = zsh-you-should-use;
        file = "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh";
      }
      {
        name = "zsh-nix-shell";
        src = zsh-nix-shell;
        file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
      }
      {
        name = "zsh-vi-mode";
        src = zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
  };
}
