{ pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      prefix = "C-a"; # set prefix to ctrl + a
      clock24 = true; # 24 hour clock
      historyLimit = 200000;
      baseIndex = 1; # start window/pane index at 1
      sensibleOnTop = true; # use tmux-sensible
      disableConfirmationPrompt =
        true; # i know what i'm doing, kill without prompt
      terminal = "screen-256color";

      plugins = with pkgs; [
        tmuxPlugins.yank
        tmuxPlugins.resurrect
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig =
            "set -g @continuum-restore 'on'"; # save tmux sessions across reboots
        }
      ];
      extraConfig = ''
        set-environment -g TMUX_PLUGIN_MANAGER_PATH '~/.tmux/plugins/'

        set -g set-titles on
        set -g set-titles-string "#W #{command} #T #{session_path}"
        set -g escape-time 10
        set -g focus-events on
        set -g set-clipboard on

        # enable using a mouse
        set -g mouse on

        # automatically renumber windows after one is closed
        set-option -g renumber-windows on

        # split panes with | and -
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        unbind '"'
        unbind %

        set-option -g status-position top
        set-option -g status on
        set-option -g status-interval 1
        set-option -g automatic-rename on
        set-option -g automatic-rename-format '#{b:pane_current_path}'

        # vim-like pane resizing (press Ctrl+h,j,k,l).
        bind -n C-h resize-pane -L 10
        bind -n C-j resize-pane -D 5
        bind -n C-k resize-pane -U 5
        bind -n C-l resize-pane -R 10

        # vim-like pane navigation (press Alt+h,j,k,l).
        bind -n M-h select-pane -L
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U
        bind -n M-l select-pane -R

        # tmuxline
        set -g status "on"
        set -g status-justify "left"
        set -g status-style "none,bg=default"
        set -g status-left-style "none"
        set -g status-left-length "100"
        set -g status-right-style "none"
        set -g status-right-length "100"
        set -g pane-border-style "fg=#2e3440,bg=default"
        set -g pane-active-border-style "fg=#3b4252,bg=default"
        set -g pane-border-status bottom
        set -g pane-border-format ""
        set -g message-style "fg=brightwhite,bg=default"
        set -g message-command-style "fg=brightwhite,bg=default"
        setw -g window-status-activity-style "none"
        setw -g window-status-separator ""
        setw -g window-status-style "none,fg=brightwhite,bg=default"
        set -g status-left "#[fg=#8fbcbb,bg=default,bold]#S #[fg=brightwhite,bg=default,nobold,nounderscore,noitalics]"
        set -g status-right "#[fg=#616E88,bg=default]%k:%M #[fg=#616E88,bg=default] %Y-%m-%d "
        setw -g window-status-format "#[fg=#616E88,bg=default] #I#[fg=#616E88,bg=default] #W "
        setw -g window-status-current-format "#[fg=#5e81ac,bg=default] #I#[fg=brightwhite,bg=default] #W "
      '';
    };

    home.shellAliases = {
      tmk = "tmux kill-session -a"; # clear clipboard
      tmks = "tmux kill-server";
    };
  };
}
