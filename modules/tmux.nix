{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    clock24 = true;
    shortcut = "a";
    baseIndex = 1;
    mouse = true;
    sensibleOnTop = true;
    terminal = "tmux-256color";
    historyLimit = 512 * 1024 * 1024;

    plugins = with pkgs.tmuxPlugins;
    [
      catppuccin
          yank
          sensible
          pain-control
          battery
    ];

    extraConfig = ''
        set -g allow-rename off
        set-option -g status-position top
        set-option -g repeat-time 0
        set-option -g renumber-windows on
        set -sg escape-time 0

        set -s set-clipboard on
        set -g mouse on
        setw -g mode-keys vi
        set-option -g mode-keys vi
        set-option -ga terminal-overrides ",xterm-256color*:Tc:smso"

        set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_right_separator " "
        set -g @catppuccin_window_middle_separator " █"
        set -g @catppuccin_window_number_position "right"

        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_default_text "#W"

        set -g @catppuccin_window_current_fill "number"
        set -g @catppuccin_window_current_text "#W"

        set -g @catppuccin_status_modules_right "session user host battery date_time"
        set -g @catppuccin_status_left_separator  " "
        set -g @catppuccin_status_right_separator ""
        set -g @catppuccin_status_fill "icon"
        set -g @catppuccin_status_connect_separator "no"

        set -g @catppuccin_directory_text "#{pane_current_path}"
        set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M"
        '';
  };
}

