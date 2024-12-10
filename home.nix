# ██╗  ██╗ ██████╗ ███╗   ███╗███████╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗
# ██║  ██║██╔═══██╗████╗ ████║██╔════╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
# ███████║██║   ██║██╔████╔██║█████╗      ██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
# ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝      ██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
# ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
# ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
#

{
  lib,
  config,
  pkgs,
  ...
}:

{

  # Home Manager needs a bit of information about you and the paths it should
  # manage.V
  home.username = "borba";
  home.homeDirectory = "/home/borba";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true; # don't forget fc-cache -f

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # nix-output-monitor # Processes output of Nix commands to show helpful and pretty information
    tmux
    # wezterm
    asciinema # Terminal session recorder and the best companion of asciinema.org
    asciiquarium-transparent
    bottom # btop  # replacement of htop/nmon
    brave
    chromium
    direnv
    discord
    du-dust # du + rust = dust. Like du but more intuitive
    fastfetch # Like neofetch, but much faster because written in C
    fd
    findutils
    gnupg
    httpie # A command line HTTP client whose goal is to make CLI human-friendly
    jq # A lightweight and flexible command-line JSON processor
    meld # Visual diff and merge tool
    mkcert
    obsidian
    rclone # Command line program to sync files and directories to and from major cloud storage
    scrcpy # Display and control Android devices over USB or TCP/IP
    sd
    spotify
    sqlitebrowser
    tree
    xclip
    xsel
    # zellij

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.meslo-lg
    pkgs.nerd-fonts.inconsolata
    pkgs.nerd-fonts.hack

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.activation.forceUpdateFontConfigCache = lib.hm.dag.entryAfter [ "intallPackages" ] ''
    echo "Rebuilding font cache"
    ${pkgs.fontconfig}/bin/fc-cache -rf
  '';

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

    # ".config/tmux".source = "${config.home.homeDirectory}/cavelab/config/tmux";

    ".config/wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/cavelab/config/wezterm/";
      recursive = true;
    };
    ".config/tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/cavelab/config/tmux/";
      recursive = true;
    };
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/cavelab/config/nvim/";
      recursive = true;
    };
    # ".config/zellij" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/cavelab/config/zellij/";
    #   recursive = true;
    # };

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
    # SHELL = pkgs.zsh;
    # TERMINAL = "wezterm";
    # SHELL = "zsh";

    EDITOR = "nvim";
    VISUAL = "nvim";

    NIXPKGS_ALLOW_UNFREE = "1";

    # Language
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";

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
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "discord"
      "spotify"
    ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
