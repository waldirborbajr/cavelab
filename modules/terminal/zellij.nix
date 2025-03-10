{ config, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      mirror_session = false;

      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };

      pane_frames = false;
      default_layout = "compact";
      theme = "custom";
      themes.custom = with config.colorScheme.palette; {
        fg = "#${base05}";
        bg = "#${base00}";
        black = "#${base00}";
        red = "#${base08}";
        green = "#${base0B}";
        yellow = "#${base0A}";
        blue = "#${base0D}";
        magenta = "#${base0E}";
        cyan = "#${base0C}";
        white = "#${base05}";
        orange = "#${base09}";
      };

      "keybinds clear-defaults=true" = {
        locked = {
          "bind \"Ctrl g\"" = {
            SwitchToMode = "Normal";
          };
        };
        resize = {
          # "bind \"Ctrl n\"" = {SwitchToMode = "Normal";};
          "bind \"h\"" = {
            Resize = "Increase Left";
          };
          "bind \"j\"" = {
            Resize = "Increase Down";
          };
          "bind \"k\"" = {
            Resize = "Increase Up";
          };
          "bind \"l\"" = {
            Resize = "Increase Right";
          };
          "bind \"H\"" = {
            Resize = "Decrease Left";
          };
          "bind \"J\"" = {
            Resize = "Decrease Down";
          };
          "bind \"K\"" = {
            Resize = "Decrease Up";
          };
          "bind \"L\"" = {
            Resize = "Decrease Right";
          };
          "bind \"=\" \"+\"" = {
            Resize = "Increase";
          };
          "bind \"-\"" = {
            Resize = "Decrease";
          };
        };
        pane = {
          "bind \"Ctrl w\"" = {
            SwitchToMode = "Normal";
          };
          "bind \"h\"" = {
            MoveFocus = "Left";
          };
          "bind \"l\"" = {
            MoveFocus = "Right";
          };
          "bind \"j\"" = {
            MoveFocus = "Down";
          };
          "bind \"k\"" = {
            MoveFocus = "Up";
          };
          "bind \"p\"" = {
            SwitchFocus = [ ];
          };
          "bind \"n\"" = {
            NewPane = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"d\"" = {
            NewPane = "Down";
            SwitchToMode = "Normal";
          };
          "bind \"r\"" = {
            NewPane = "Right";
            SwitchToMode = "Normal";
          };
          "bind \"x\"" = {
            CloseFocus = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"f\"" = {
            ToggleFocusFullscreen = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"z\"" = {
            TogglePaneFrames = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"w\"" = {
            ToggleFloatingPanes = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"e\"" = {
            TogglePaneEmbedOrFloating = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"c\"" = {
            SwitchToMode = "RenamePane";
            PaneNameInput = 0;
          };
        };
        move = {
          "bind \"Ctrl m\"" = {
            SwitchToMode = "Normal";
          };
          "bind \"n\" \"Tab\"" = {
            MovePane = [ ];
          };
          "bind \"p\"" = {
            MovePaneBackwards = [ ];
          };
          "bind \"h\"" = {
            MovePane = "Left";
          };
          "bind \"j\"" = {
            MovePane = "Down";
          };
          "bind \"k\"" = {
            MovePane = "Up";
          };
          "bind \"l\"" = {
            MovePane = "Right";
          };
        };
        tab = {
          "bind \"Ctrl t\"" = {
            SwitchToMode = "Normal";
          };
          "bind \"r\"" = {
            SwitchToMode = "RenameTab";
            TabNameInput = 0;
          };
          "bind \"h\" \"k\"" = {
            GoToPreviousTab = [ ];
          };
          "bind \"l\" \"j\"" = {
            GoToNextTab = [ ];
          };
          "bind \"n\"" = {
            NewTab = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"x\"" = {
            CloseTab = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"s\"" = {
            ToggleActiveSyncTab = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"b\"" = {
            BreakPane = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"]\"" = {
            BreakPaneRight = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"[\"" = {
            BreakPaneLeft = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"1\"" = {
            GoToTab = 1;
            SwitchToMode = "Normal";
          };
          "bind \"2\"" = {
            GoToTab = 2;
            SwitchToMode = "Normal";
          };
          "bind \"3\"" = {
            GoToTab = 3;
            SwitchToMode = "Normal";
          };
          "bind \"4\"" = {
            GoToTab = 4;
            SwitchToMode = "Normal";
          };
          "bind \"5\"" = {
            GoToTab = 5;
            SwitchToMode = "Normal";
          };
          "bind \"6\"" = {
            GoToTab = 6;
            SwitchToMode = "Normal";
          };
          "bind \"7\"" = {
            GoToTab = 7;
            SwitchToMode = "Normal";
          };
          "bind \"8\"" = {
            GoToTab = 8;
            SwitchToMode = "Normal";
          };
          "bind \"9\"" = {
            GoToTab = 9;
            SwitchToMode = "Normal";
          };
          "bind \"Tab\"" = {
            ToggleTab = [ ];
          };
        };
        scroll = {
          "bind \"Ctrl s\"" = {
            SwitchToMode = "Normal";
          };
          "bind \"e\"" = {
            EditScrollback = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"s\"" = {
            SwitchToMode = "EnterSearch";
            SearchInput = 0;
          };
          "bind \"Ctrl c\"" = {
            ScrollToBottom = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"j\"" = {
            ScrollDown = [ ];
          };
          "bind \"k\"" = {
            ScrollUp = [ ];
          };
          "bind \"Ctrl f\" \"l\"" = {
            PageScrollDown = [ ];
          };
          "bind \"Ctrl b\" \"h\"" = {
            PageScrollUp = [ ];
          };
          "bind \"d\"" = {
            HalfPageScrollDown = [ ];
          };
          "bind \"u\"" = {
            HalfPageScrollUp = [ ];
          };
        };
        search = {
          "bind \"Ctrl s\"" = {
            SwitchToMode = "Normal";
          };
          "bind \"Ctrl c\"" = {
            ScrollToBottom = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"j\"" = {
            ScrollDown = [ ];
          };
          "bind \"k\"" = {
            ScrollUp = [ ];
          };
          "bind \"Ctrl f\" \"l\"" = {
            PageScrollDown = [ ];
          };
          "bind \"Ctrl b\" \"h\"" = {
            PageScrollUp = [ ];
          };
          "bind \"d\"" = {
            HalfPageScrollDown = [ ];
          };
          "bind \"u\"" = {
            HalfPageScrollUp = [ ];
          };
          "bind \"n\"" = {
            Search = "down";
          };
          "bind \"p\"" = {
            Search = "up";
          };
          "bind \"c\"" = {
            SearchToggleOption = "CaseSensitivity";
          };
          "bind \"w\"" = {
            SearchToggleOption = "Wrap";
          };
          "bind \"o\"" = {
            SearchToggleOption = "WholeWord";
          };
        };
        entersearch = {
          "bind \"Ctrl c\" \"Esc\"" = {
            SwitchToMode = "Scroll";
          };
          "bind \"Enter\"" = {
            SwitchToMode = "Search";
          };
        };
        renametab = {
          "bind \"Ctrl c\"" = {
            SwitchToMode = "Normal";
          };
          "bind \"Esc\"" = {
            UndoRenameTab = [ ];
            SwitchToMode = "Tab";
          };
        };
        renamepane = {
          "bind \"Ctrl c\"" = {
            SwitchToMode = "Normal";
          };
          "bind \"Esc\"" = {
            UndoRenamePane = [ ];
            SwitchToMode = "Pane";
          };
        };
        session = {
          "bind \"Ctrl o\"" = {
            SwitchToMode = "Normal";
          };
          "bind \"Ctrl s\"" = {
            SwitchToMode = "Scroll";
          };
          "bind \"d\"" = {
            Detach = [ ];
          };
          "bind \"w\"" = {
            "LaunchOrFocusPlugin \"session-manager\"" = {
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "Normal";
          };
          "bind \"c\"" = {
            "LaunchOrFocusPlugin \"configuration\"" = {
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "Normal";
          };
        };
        tmux = {
          "bind \"[\"" = {
            SwitchToMode = "Scroll";
          };
          "bind \"Ctrl b\"" = {
            Write = 2;
            SwitchToMode = "Normal";
          };
          "bind \"\\\"\"" = {
            NewPane = "Down";
            SwitchToMode = "Normal";
          };
          "bind \"%\"" = {
            NewPane = "Right";
            SwitchToMode = "Normal";
          };
          "bind \"z\"" = {
            ToggleFocusFullscreen = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"c\"" = {
            NewTab = [ ];
            SwitchToMode = "Normal";
          };
          "bind \",\"" = {
            SwitchToMode = "RenameTab";
          };
          "bind \"p\"" = {
            GoToPreviousTab = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"n\"" = {
            GoToNextTab = [ ];
            SwitchToMode = "Normal";
          };
          "bind \"h\"" = {
            MoveFocus = "Left";
            SwitchToMode = "Normal";
          };
          "bind \"l\"" = {
            MoveFocus = "Right";
            SwitchToMode = "Normal";
          };
          "bind \"j\"" = {
            MoveFocus = "Down";
            SwitchToMode = "Normal";
          };
          "bind \"k\"" = {
            MoveFocus = "Up";
            SwitchToMode = "Normal";
          };
          "bind \"o\"" = {
            FocusNextPane = [ ];
          };
          "bind \"d\"" = {
            Detach = [ ];
          };
          "bind \"Space\"" = {
            NextSwapLayout = [ ];
          };
          "bind \"x\"" = {
            CloseFocus = [ ];
            SwitchToMode = "Normal";
          };
        };
        "shared_except \"locked\"" = {
          "bind \"Ctrl g\"" = {
            SwitchToMode = "Locked";
          };
          # "bind \"Ctrl q\"" = {Quit = [];};
          "bind \"Alt f\"" = {
            ToggleFloatingPanes = [ ];
          };
          "bind \"Alt n\"" = {
            NewPane = [ ];
          };
          "bind \"Alt i\"" = {
            MoveTab = "Left";
          };
          "bind \"Alt o\"" = {
            MoveTab = "Right";
          };
          "bind \"Alt h\" \"Alt Left\"" = {
            MoveFocusOrTab = "Left";
          };
          "bind \"Alt l\" \"Alt Right\"" = {
            MoveFocusOrTab = "Right";
          };
          "bind \"Alt j\" \"Alt Down\"" = {
            MoveFocus = "Down";
          };
          "bind \"Alt k\" \"Alt Up\"" = {
            MoveFocus = "Up";
          };
          "bind \"Alt =\" \"Alt +\"" = {
            Resize = "Increase";
          };
          "bind \"Alt -\"" = {
            Resize = "Decrease";
          };
          "bind \"Alt [\"" = {
            PreviousSwapLayout = [ ];
          };
          "bind \"Alt ]\"" = {
            NextSwapLayout = [ ];
          };
        };
        "shared_except \"normal\" \"locked\"" = {
          "bind \"Enter\" \"Esc\" \"q\"" = {
            SwitchToMode = "Normal";
          };
        };
        "shared_except \"pane\" \"locked\"" = {
          "bind \"Ctrl w\"" = {
            SwitchToMode = "Pane";
          };
        };
        # "shared_except \"resize\" \"locked\"" = {
        #   "bind \"Ctrl n\"" = {SwitchToMode = "Resize";};
        # };
        "shared_except \"scroll\" \"locked\"" = {
          "bind \"Ctrl s\"" = {
            SwitchToMode = "Scroll";
          };
        };
        "shared_except \"session\" \"locked\"" = {
          "bind \"Ctrl o\"" = {
            SwitchToMode = "Session";
          };
        };
        "shared_except \"tab\" \"locked\"" = {
          "bind \"Ctrl t\"" = {
            SwitchToMode = "Tab";
          };
        };
        "shared_except \"move\" \"locked\"" = {
          "bind \"Ctrl m\"" = {
            SwitchToMode = "Move";
          };
        };
        "shared_except \"tmux\" \"locked\"" = {
          "bind \"Ctrl b\"" = {
            SwitchToMode = "Tmux";
          };
        };
      };
    };
  };

  home.file =
    let
      common_layout_content = ''
        default_tab_template {
          children
          pane size=1 borderless=true {
              plugin location="compact-bar"
          }
        }
      '';
    in
    {
      ".config/zellij/layouts/dotfiles.kdl".text =
        # kdl
        ''
          layout {
            ${common_layout_content}
            cwd "${config.home.sessionVariables.FLAKE}"

            tab name="dotfiles" focus=true {
              pane {
                command "${config.home.sessionVariables.EDITOR}"
              }
            }

            tab name="cmd" {
              pane
            }
           }
        '';

      ".config/zellij/layouts/odinls.kdl".text =
        # kdl
        ''
          layout {
            ${common_layout_content}

            cwd "${config.home.sessionVariables.REPOS_DIR}/odinls"

            tab name="editor" focus=true {
              pane {
                command "${config.home.sessionVariables.EDITOR}"
              }
            }

            tab name="docker" {
              pane

              pane split_direction="vertical" size=20 {
                command "docker"
                args "compose" "--profile" "dev" "up" "--watch"
              }
            }
          }
        '';

      ".config/zellij/layouts/tyche.kdl".text =
        # kdl
        ''
          layout {
            ${common_layout_content}
            cwd "${config.home.sessionVariables.REPOS_DIR}/tyche"

            tab name="editor" focus=true {
              pane
            }

            tab name="cmd & dev" {
              pane
              pane split_direction="vertical" size=20
            }
          }
        '';

      ".config/zellij/layouts/trust-be.kdl".text =
        # kdl
        ''
          layout {
            ${common_layout_content}
            cwd "${config.home.sessionVariables.REPOS_DIR}/whats_cookin"

            tab name="editor" focus=true {
              pane {
                command "${config.home.sessionVariables.EDITOR}"
                cwd "trust_claim_backend"
              }
            }

            tab name="docker" {
              pane cwd="trust_claim_backend"

              pane split_direction="vertical" size=20 {
                command "docker"
                args "compose" "--profile" "dev" "up" "--watch"
              }
            }
          }
        '';

      ".config/zellij/layouts/trust-fe.kdl".text =
        # kdl
        ''
          layout {
            ${common_layout_content}

            tab name="editor" focus=true {
              pane {
                command "${config.home.sessionVariables.EDITOR}"
                cwd "${config.home.sessionVariables.REPOS_DIR}/whats_cookin/trust_claim"
              }
            }

            tab name="run-time" {
              pane {
                cwd "${config.home.sessionVariables.REPOS_DIR}/whats_cookin/trust_claim"
              }

              pane split_direction="vertical" size=20 {
                command "yarn"
                args "dev"
                cwd "${config.home.sessionVariables.REPOS_DIR}/whats_cookin/trust_claim"
              }
            }

            tab name="backend" {
              pane split_direction="vertical" {
                command "docker"
                args "compose" "--profile" "dev" "up"
                cwd "${config.home.sessionVariables.REPOS_DIR}/whats_cookin"
              }
            }
          }
        '';
    };
}
