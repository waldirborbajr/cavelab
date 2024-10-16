{ lib, config, pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "borba";
  home.homeDirectory = "/home/borba";

  # home.username = builtins.getEnv "USER";
  # home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # wezterm
    bottom # btop  # replacement of htop/nmon
    du-dust
    fastfetch
    fd
    findutils
    fx
    httpie
    jq # A lightweight and flexible command-line JSON processor
    killall
    meld
    mkcert
    nix-output-monitor
    procs
    sd
    # tmux
    tree

    obsidian
    discord
    spotify

    # k9s
    # kubectx
    # kubie
    # kustomize

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

    # ".config/nix".source =  "${config.home.homeDirectory}/cavelab/config/nix";

    ".config/wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/cavelab/config/wezterm/";
      recursive = true;
    };
    ".config/tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/cavelab/config/tmux/";
      recursive = true;
    };
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/cavelab/config/nvim/";
      recursive = true;
    };

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ubuntu/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {

    # TERMINAL = pkgs.wezterm;
    # TERMINAL = "wezterm";
    # SHELL = "zsh";
    SHELL = pkgs.zsh;

    EDITOR = "nvim";
    VISUAL = "nvim";

    # Language
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";

    # Nix
    # NIXPKGS_ALLOW_UNFREE = "1";
    # NIXPKGS_ALLOW_INSECURE = "1";

    # Term
    TERM = "xterm-256color";

    # XDG Setup
    XDG_CACHE_HOME = "$HOME/.cache";
    # XDG_CONFIG_DIRS = "/etc/xdg";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  # ALLOW SOFTWARE WITH UNFREE LICENSE
  nixpkgs.config = {
    allowUnfree = true;
    allowInsecure = true;
    allowBroken = true;
    # allowUnfreePredicate = _: true;
  };

  # Install UnFree programs
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "obsidian" "discord" "spotify" ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
