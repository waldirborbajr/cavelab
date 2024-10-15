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

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        ff = "fastfetch";

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
