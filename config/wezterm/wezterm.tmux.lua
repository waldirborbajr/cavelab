-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- Config builder
local config = wezterm.config_builder()
local modkey = 'ALT'

-- ======= APPEARANCE =======
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback {
  "JetBrains Mono",
  "Symbols Nerd Font Mono",
  "Noto Color Emoji",
}
config.font_size = 13.0
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.default_cwd = wezterm.home_dir
config.scrollback_lines = 20000
config.enable_scroll_bar = false
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}
config.animation_fps = 60
config.max_fps = 120

-- ======= LEADER KEY (tmux-style) =======
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  -- Spawn new window
  {
    key = 'n',
    mods = 'CMD',
    action = act.SpawnCommandInNewWindow {
      cwd = wezterm.home_dir,
    },
  },

  -- Leader + c = new tab
  { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

  -- Leader + x = close pane
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane { confirm = false } },

  -- Leader + | = split horizontal
  { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

  -- Leader + - = split vertical
  { key = "-", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },

  -- Leader + [hjkl] = move between panes
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },

  -- Resize panes with Leader + Shift + [hjkl]
  { key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Left", 2 } },
  { key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Down", 2 } },
  { key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Up", 2 } },
  { key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize { "Right", 2 } },

  -- Leader + [ / ] = next/prev tab
  { key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },

  -- Leader + , = rename tab
  { key = ",", mods = "LEADER", action = act.PromptInputLine {
      description = "Rename tab:",
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
  }},
  
  -- Clipboard
  { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo "Clipboard" },
  { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom "Clipboard" },

  -- Reorder tabs with Alt+Shift+←/→
  { key = "LeftArrow", mods = "ALT|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "RightArrow", mods = "ALT|SHIFT", action = act.MoveTabRelative(1) },
}

-- Dynamically generate [Alt]+[1..9] tab switching
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = modkey,
    action = act.ActivateTab(i - 1),
  })
end
table.insert(config.keys, {
  key = "0",
  mods = modkey,
  action = act.ActivateTab(9),
})

-- ======= MOUSE BINDINGS =======
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = act.OpenLinkAtMouseCursor,
  },
}

-- ======= STATUS BAR =======
wezterm.on("update-right-status", function(window, pane)
  local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
  window:set_right_status(wezterm.format({
    { Foreground = { Color = "#89b4fa" } },
    { Text = " " .. date .. " " },
  }))
end)

-- ======= TAB TITLE CUSTOMIZATION =======
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane

  local cwd_uri = pane.current_working_dir
  local cwd = cwd_uri and (cwd_uri.file_path or cwd_uri.path) or ""
  if cwd ~= "" then
    cwd = cwd:gsub("^.*[/\\]([^/\\]+)[/\\]?$", "%1")
  end

  local process = pane.foreground_process_name or ""

  return cwd .. " - " .. process
end)

return config
