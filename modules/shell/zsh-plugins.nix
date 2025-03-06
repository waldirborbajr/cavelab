{
  config,
  pkgs,
  lib,
  ...
}:
let
  fzfZshPlugin = pkgs.fetchgit {
    url = "https://github.com/unixorn/fzf-zsh-plugin.git";
    sha256 = "Ubxakc8DwJoy49o3B5L+t5vZw3KA2VWvlAPGWER8J2A="; # Set to an invalid value so Nix recalculates it
  };

  zshAutopair = pkgs.fetchgit {
    url = "https://github.com/hlissner/zsh-autopair.git";
    sha256 = "3zvOgIi+q7+sTXrT+r/4v98qjeiEL4Wh64rxBYnwJvQ=";
  };

  zshAutosuggestions = pkgs.fetchgit {
    url = "https://github.com/zsh-users/zsh-autosuggestions.git";
    sha256 = "B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
  };

  zshCompletions = pkgs.fetchgit {
    url = "https://github.com/zsh-users/zsh-completions.git";
    sha256 = "ibdEDgyUiJ84OUdlwrlvedlySE8uwQfNqQ6HEM+QCLM=";
  };

  zshLsd = pkgs.fetchgit {
    url = "https://github.com/wintermi/zsh-lsd.git";
    sha256 = "3dQoaDwgrO9kV4g+yRxy6gVug6wPo6/MNTPwvK2wIJ4=";
  };

  zshSyntaxHighlighting = pkgs.fetchgit {
    url = "https://github.com/zsh-users/zsh-syntax-highlighting.git";
    sha256 = "Vt2yKzMRJ34FBFPKrN+GJBZYmBt5ASArrs1dkZcIQmI=";
  };

  youShouldUse = pkgs.fetchgit {
    url = "https://github.com/MichaelAquilina/zsh-you-should-use.git";
    sha256 = "+3iAmWXSsc4OhFZqAMTwOL7AAHBp5ZtGGtvqCnEOYc0=";
  };

  condaZshCompletion = pkgs.fetchgit {
    url = "https://github.com/conda-incubator/conda-zsh-completion.git";
    sha256 = "lphlOmdy8pHSNzupSnuE9KvLT303UEbVRGcHsxwakIU=";
  };

  zshAutocomplete = pkgs.fetchgit {
    url = "https://github.com/marlonrichert/zsh-autocomplete.git";
    sha256 = "o8IQszQ4/PLX1FlUvJpowR2Tev59N8lI20VymZ+Hp4w=";
  };

in
{
  home.file = {
    ".config/zsh/custom/themes" = {
      source = ./themes;
      recursive = true;
    };
    ".config/zsh/custom/plugins" = {
      source = ./plugins;
      recursive = true;
    };
    ".config/zsh/custom/plugins/fzf-zsh-plugin" = {
      source = fzfZshPlugin;
      recursive = true;
    };
    ".config/zsh/custom/plugins/zsh-autopair" = {
      source = zshAutopair;
      recursive = true;
    };
    ".config/zsh/custom/plugins/zsh-autosuggestions" = {
      source = zshAutosuggestions;
      recursive = true;
    };
    ".config/zsh/custom/plugins/zsh-completions" = {
      source = zshCompletions;
      recursive = true;
    };
    ".config/zsh/custom/plugins/zsh-lsd" = {
      source = zshLsd;
      recursive = true;
    };
    ".config/zsh/custom/plugins/zsh-syntax-highlighting" = {
      source = zshSyntaxHighlighting;
      recursive = true;
    };
    ".config/zsh/custom/plugins/you-should-use" = {
      source = youShouldUse;
      recursive = true;
    };
    ".config/zsh/custom/plugins/conda-zsh-completion" = {
      source = condaZshCompletion;
      recursive = true;
    };
    ".config/zsh/custom/plugins/zsh-autocomplete" = {
      source = zshAutocomplete;
      recursive = true;
    };
  };
}
