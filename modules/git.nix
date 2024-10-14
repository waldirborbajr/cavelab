{ lib, ... }: {
  programs = {
    git = {
      enable = true;
      userName = "waldirborbajr";
      userEmail = "wborbajr@gmail.com";
      # userName = config.profile.mainUserDesc;
      # userEmail = config.profile.mainUserEmail;
      aliases.prettylog =
        "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

      extraConfig = {
        core = {
          editor = "nvim";
          whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        };
        delta = {
          enable = true;
          options = { "navigate" = true; };
        };
        diff.tool = "meld";
        web.browser = "google-chrome-stable";
        push.default = "tracking";
        push.autoSetupRemote = true;
        pull.rebase = false;
        rebase = {
          updateRefs = true;
          autoSqaush = true;
          autoStash = true;
        };
        branch.autosetupmerge = true;
        init.defaultBranch = "main";
        rerere.enabled = true;
        color.ui = true;
        blame.date = "relative";
      };

      ignores = [
        "$RECYCLE.BIN/"
        "*.bak"
        "*.cab"
        "*.lnk"
        "*.log"
        "*.msi"
        "*.msix"
        "*.msm"
        "*.msp"
        "*.stackdump"
        "*.swo"
        "*.swp"
        "*result*"
        "*~"
        ".AppleDB"
        ".AppleDesktop"
        ".AppleDouble"
        ".DS_Store"
        ".DS_Store?"
        ".DocumentRevisions-V100"
        ".LSOverride"
        ".Spotlight-V100"
        ".TemporaryItems"
        ".Trash-*"
        ".Trashes"
        ".VolumeIcon.icns"
        "._*"
        ".apdisk"
        ".com.apple.timemachine.donotpresent"
        ".directory"
        ".direnv"
        ".direnv/"
        ".env"
        ".envrc"
        ".fseventsd"
        ".fuse_hidden*"
        ".idea"
        ".idea/"
        ".iml"
        ".nfs*"
        ".svn"
        ".vim"
        ".vscode"
        "Icon"
        "Network Trash Folder"
        "Session.vim"
        "Session.vim*"
        "Temporary Items"
        "Thumbs.db"
        "Thumbs.db:encryptable"
        "[Dd]esktop.ini"
        "desktop.ini"
        "ehthumbs.db"
        "ehthumbs_vista.db"
        "node_modules"
        "node_modules/"
        "scratch"
        "tags"
        "tags*.tmp"
        "tags*temp"
        "tags.lock"
        "target/"
        "tmp"
      ];

      delta = {
        # sets git's core.pager and interactive.diffFilter
        enable = true;
        options = {
          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-decoration-style = "none";
            file-style = "bold yellow ul";
            hunk-decoration-style = "bold blue ul";
            hunk-header-style = "omit";
          };
          line-numbers = {
            line-numbers = true;
            line-numbers-minus-style = "brightblack";
            line-numbers-zero-style = "brightblack";
            line-numbers-plus-style = "brightblack";
            line-numbers-left-format = ""; # {nm:>4}┊
            line-numbers-left-style = ""; # brightblack
            line-numbers-right-format = "{np:>4}│";
            line-numbers-right-style = "brightblack";
          };
          features = "decorations line-numbers";
          whitespace-error-style = "22 reverse";
          navigate = true;
          hyprlinks = true;
          syntax-theme = "none";
        };
      };
    };
  };

  # enable scrolling in delta's git diff
  home.sessionVariables.DELTA_PAGER = "less -RF";

  programs.zsh.shellAliases = lib.mkAfter {
    "g" = "git";
    "ga" = "git add -A";
    "gac" = "git commit -av";
    "gb" = "git branch -v";
    "gba" = "git branch -va";
    "gc" = "git commit -v";
    "gca" = "git commit --amend";
    "gcf" = "git clean -f";
    "gch" = "git commit --amend -C HEAD";
    "gco" = "git checkout";
    "gcp" = "git cherry-pick";
    "gd" = "git diff";
    "gf" = "git fetch";
    "gl" = "git pull";
    "glo" = "git l";
    "glr" = "git pull --rebase";
    "gm" = "git merge";
    "gmt" = "git mergetool --no-prompt";
    "gp" = "git push";
    "gr" = "git remote -v";
    "grh" = "git reset --hard";
    "grhh" = "git reset --hard HEAD";
    "gs" = "git status";
    "t" = "lazygit";
  };

}
