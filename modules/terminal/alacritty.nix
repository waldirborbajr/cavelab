{ ... }:
{
  programs.alacritty = {
    enable = true;
    enableZshIntegration = true;

    extraConfig =
      # lua
      ''
                live_config_reload = true

        selection.save_to_clipboard = true

        [env]
        TERM = "xterm-256color"

        [colors]
        draw_bold_text_with_bright_colors = true
        transparent_background_colors = true

        [window]
        dynamic_padding = false
        opacity = 1
        blur = true
        startup_mode = "Windowed"
        # startup_mode = "Fullscreen"
        # startup_mode = "Maximized"
        decorations = "none"

        option_as_alt = "Both"

        [window.padding]
        x = 10
        y = 10

        # [window.position]
        # x = 0
        # y = 0

        [cursor]
        unfocused_hollow = true
        thickness = 0.3

        [cursor.style]
        blinking = "Never"

        [font]
        size = 12

        [font.normal]
        # family = "CommitMono Nerd Font"
        family = "MesloLGS Nerd Font"
        style = "Regular"

        [font.bold]
        family = "MesloLGS Nerd Font"
        style = "Bold"

        [font.bold_italic]
        family = "MesloLGS Nerd Font"
        style = "Bold Italic"

        [font.italic]
        family = "MesloLGS Nerd Font"
        style = "Italic"

        [mouse]
        hide_when_typing = true

        [shell]
        program = "/usr/bin/zsh"

        # [shell]
        # program = "/usr/bin/tmux"
        # args = ["new-session", "-A", "-s", "main"]

        [[hints.enabled]]
        command = "xdg-open"
        hyperlinks = true
        post_processing = true
        regex = "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)[^\u0000-\u001F\u007F-�<>\"\\s{-}\\^⟨⟩`]+"

        [hints.enabled.binding]
        key = "U"
        mods = "Control|Shift"

        [hints.enabled.mouse]
        enabled = true
        mods = "None"

        [keyboard]
        bindings = [
          { key = "F11", action = "ToggleSimpleFullscreen" },
          # { key = "Right", mods = "Alt", chars = "\u001BF" },
          # { key = "Left",  mods = "Alt", chars = "\u001BB" },
          { key = "Q", mods = "Command", action = "None" },
          { key = "N", mods = "Control", action = "CreateNewWindow" },
        ]
      '';
  };
}
