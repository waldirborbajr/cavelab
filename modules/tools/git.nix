{ pkgs, ... }:
{

  imports = [
    ./lazygit.nix
    ./gh.nix
  ];


  programs = {
    git = {
      enable = true;
      userName = "Waldir Borba Junior";
      userEmail = "wborbajr" + "@" + "gmail" + "." + "com";

      # signing = {
      #   format = "ssh";
      #   signByDefault = true;
      # };

      delta = {
        enable = true;

        options = {
          navigate = true;
          side-by-side = true;
          line-numbers = true;
        };
      };

      aliases.prettylog = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

      aliases = {
        index = "status -s";
        graph = "log --oneline --graph";
        ahead = "!git log --oneline @{u}..HEAD | grep -cE '.*'";

        changelog = "-c pager.show=false show --format=' - %C(yellow)%h%C(reset) %<(80,trunc)%s' -q @@{1}..@@{0}";
        amend = "commit --amend";

        fpush = "push --force-with-lease";

        # stash
        spush = "stash push -a";
        spop = "stash pop -q";

        # a = "add";
        # af = "!git add $(git ls-files -m -o --exclude-standard | sk -m)";
        # b = "branch";
        # br = "branch";
        # c = "commit";
        # ca = "commit --amend";
        # cm = "commit -m";
        # co = "checkout";
        # d = "diff";
        # ds = "diff --staged";
        # edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; hx `f`";
        # essa = "push --force";
        # fuck = "commit --amend -m";
        # graph = "log --all --decorate --graph --oneline";
        # hist = ''log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all'';
        # l = "log";
        # llog = ''log --graph --name-status --pretty=format:"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset" --date=relative'';
        # oops = "checkout --";
        # p = "push";
        # pf = "push --force-with-lease";
        # pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
        # ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
        # r = "rebase";
        # s = "status --short";
        # ss = "status";
        # st = "status";
        # sha = "rev-parse origin/main";
        # sm = "switch main";
      };

      # attributes = [
      #   "*.c     diff=cpp"
      #   "*.h     diff=cpp"
      #   "*.c++   diff=cpp"
      #   "*.h++   diff=cpp"
      #   "*.cpp   diff=cpp"
      #   "*.hpp   diff=cpp"
      #   "*.cc    diff=cpp"
      #   "*.hh    diff=cpp"
      #   "*.m     diff=objc"
      #   "*.mm    diff=objc"
      #   "*.cs    diff=csharp"
      #   "*.css   diff=css"
      #   "*.html  diff=html"
      #   "*.xhtml diff=html"
      #   "*.ex    diff=elixir"
      #   "*.exs   diff=elixir"
      #   "*.go    diff=golang"
      #   "*.php   diff=php"
      #   "*.pl    diff=perl"
      #   "*.py    diff=python"
      #   "*.md    diff=markdown"
      #   "*.rb    diff=ruby"
      #   "*.rake  diff=ruby"
      #   "*.rs    diff=rust"
      #   "*.lisp  diff=lisp"
      #   "*.el    diff=lisp"
      # ];

      extraConfig = {
        core.editor = "nvim";

        # Qol
        color.ui = "auto";

        diff = {
          algorithm = "histogram"; # a much better diff
          colorMoved = "plain"; # show moved lines in a different color
        };

        safe.directory = "*";
        # add some must-use flags
        pull.rebase = true;
        rebase = {
          autoSquash = true;
          autoStash = true;
        };
        merge.ff = "only";
        push.autoSetupRemote = true;

        # user.signingkey = osConfig.age.secrets.keys-gh.path;
        # personal preference
        init.defaultBranch = "main";
        # prevent data corruption
        transfer.fsckObjects = true;
        fetch.fsckObjects = true;
        receive.fsckObjects = true;

        # core = {
        #   editor = "nvim";
        #   whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        # };
        # delta = {
        #   enable = true;
        #   options = {
        #     "navigate" = true;
        #   };
        # };
        # diff.tool = "meld";
        # web.browser = "google-chrome-stable";
        # rebase = {
        #   updateRefs = true;
        #   autoSqaush = true;
        #   autoStash = true;
        # };
        # pull = {
        #   ff = "only";
        #   rebase = true;
        # };
        # push = {
        #   autoSetupRemote = true;
        #   default = "tracking";
        # };
        # rerere = {
        #   enabled = true;
        #   autoupdate = true;
        # };
        # branch.autosetupmerge = true;
        # init.defaultBranch = "main";
        # color.ui = true;
        # blame.date = "relative";
        # merge.stat = "true";
      };

      ignores = [
        # system residue
        ".cache/"
        ".DS_Store"
        ".Trashes"
        ".Trash-*"
        "*.bak"
        "*.swp"
        "*.swo"
        "*.elc"
        ".~lock*"

        # build residue
        "tmp/"
        "target/"
        "result"
        "result-*"
        "*.exe"
        "*.exe~"
        "*.dll"
        "*.so"
        "*.dylib"

        # ide residue
        ".idea/"
        ".vscode/"

        # dependencies
        ".direnv/"
        "node_modules"
        "vendor"

        # "$RECYCLE.BIN/"
        # "*.bak"
        # "*.cab"
        # "*.lnk"
        # "*.log"
        # "*.msi"
        # "*.msix"
        # "*.msm"
        # "*.msp"
        # "*.stackdump"
        # "*.swo"
        # "*.swp"
        # "*result*"
        # "*~"
        # ".AppleDB"
        # ".AppleDesktop"
        # ".AppleDouble"
        # ".DS_Store"
        # ".DS_Store?"
        # ".DocumentRevisions-V100"
        # ".LSOverride"
        # ".Spotlight-V100"
        # ".TemporaryItems"
        # ".Trash-*"
        # ".Trashes"
        # ".VolumeIcon.icns"
        # "._*"
        # ".apdisk"
        # ".com.apple.timemachine.donotpresent"
        # ".directory"
        # ".direnv"
        # ".direnv/"
        # ".env"
        # ".envrc"
        # ".fseventsd"
        # ".fuse_hidden*"
        # ".idea"
        # ".idea/"
        # ".iml"
        # ".nfs*"
        # ".svn"
        # ".vim"
        # ".vscode"
        # "Icon"
        # "Network Trash Folder"
        # "Session.vim"
        # "Session.vim*"
        # "Temporary Items"
        # "Thumbs.db"
        # "Thumbs.db:encryptable"
        # "[Dd]esktop.ini"
        # "desktop.ini"
        # "ehthumbs.db"
        # "ehthumbs_vista.db"
        # "node_modules"
        # "node_modules/"
        # "scratch"
        # "tags"
        # "tags*.tmp"
        # "tags*temp"
        # "tags.lock"
        # "target/"
        # "tmp"
      ];

      # delta = {
      #   # sets git's core.pager and interactive.diffFilter
      #   enable = true;
      #   options = {
      #     decorations = {
      #       commit-decoration-style = "bold yellow box ul";
      #       file-decoration-style = "none";
      #       file-style = "bold yellow ul";
      #       hunk-decoration-style = "bold blue ul";
      #       hunk-header-style = "omit";
      #     };
      #     line-numbers = {
      #       line-numbers = true;
      #       line-numbers-minus-style = "brightblack";
      #       line-numbers-zero-style = "brightblack";
      #       line-numbers-plus-style = "brightblack";
      #       line-numbers-left-format = ""; # {nm:>4}┊
      #       line-numbers-left-style = ""; # brightblack
      #       line-numbers-right-format = "{np:>4}│";
      #       line-numbers-right-style = "brightblack";
      #     };
      #     features = "decorations line-numbers";
      #     whitespace-error-style = "22 reverse";
      #     navigate = true;
      #     hyprlinks = true;
      #     syntax-theme = "none";
      #   };
      # };
    };
  };

  # enable scrolling in delta's git diff
  home.sessionVariables.DELTA_PAGER = "less -RF";

  home.shellAliases = {
    gg = "lazygit";
  };

}
