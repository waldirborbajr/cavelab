{ lib, config, ... }: {
  programs = {
    git = {
      enable = true;
      userName = "waldirborbajr";
      userEmail = "wborbajr@gmail.com";
      # userName = config.profile.mainUserDesc;
      # userEmail = config.profile.mainUserEmail;
      aliases.prettylog = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

      # extraConfig = {
      #   core = { editor = "nvim"; };
      #   rebase = {
      #     updateRefs = true;
      #     autoSqaush = true;
      #   };
      #   init.defaultBranch = "main";
      #   core.askPass = ""; # disabled ridiculous ssh gui password prompt
      #   # not sure exactly what these do, copied from NotAShelf
      #   core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      #
      #   # shows both your changes, conflicting changes, and original
      #   merge.conflictstyle = "diff3";
      #
      #   # the colors are annoying. Note however that "no" marks moved lines as diffs even if they're unchanged
      #   # https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---color-movedltmodegt
      #   diff.colorMoved = "no";
      # };

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
        # General
        ".DS_Store"
        ".DS_Store?"
        "Thumbs.db"
        "desktop.ini"
        # Temporary Files
        "*.bak"
        "*.swp"
        "*.swo"
        "*~"
        # Editors
        ".idea/"
        ".iml"
        # Nix
        ".direnv/"
        ".envrc"
        # Rust
        "target/"
        # Node
        "node_modules/"
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

  # home.shellAliases = {
  #   ga = "git add";
  #   gaa = "git add --all";
  #   gc = "git commit";
  #   gcm = "git commit -m";
  #   gca = "git commit --amend";
  #   gs = "git status";
  #   gd = "git diff";
  #   gds = "git diff --staged";
  #   gls = "git ls-files";
  #   gl = "git prettylog"; # see below, alternative to "git log"
  #   gp = "git pull";
  #   gP = "git push";
  #   gPf = "git push --force";
  #   grb = "git rebase";
  #   gm = "git merge";
  # };

  programs.zsh.shellAliases = lib.mkAfter {
    "t" = "lazygit";
    "g" = "git";
    "gs" = "git status";
    "ga" = "git add -A";
    "gf" = "git fetch";
    "gp" = "git push";
    "gl" = "git pull";
    "glr" = "git pull --rebase";
    "gc" = "git commit -v";
    "gca" = "git commit --amend";
    "gch" = "git commit --amend -C HEAD";
    "gac" = "git commit -av";
    "gb" = "git branch -v";
    "gba" = "git branch -va";
    "gcp" = "git cherry-pick";
    "glo" = "git l";
    "gco" = "git checkout";
    "gm" = "git merge";
    "gmt" = "git mergetool --no-prompt";
    "gd" = "git diff";
    "gr" = "git remote -v";
    "gcf" = "git clean -f";
    "grh" = "git reset --hard";
    "grhh" = "git reset --hard HEAD";
  };

}
