{
  flake.modules.homeManager.owner.programs.zellij = {
    enable = true;
    settings = {
      show_startup_tips = false;
      # For copy to work in Terminal.app you must enable:
      # Profiles -> Keyboard -> Use Option as Meta key
      copy_on_select = false;
      default_mode = "locked";
      keybinds = {
        _props.clear-defaults = true;
        _children = [
          {
            locked._children = [
              {
                bind = {
                  _args = [ "Ctrl g" ];
                  SwitchToMode = "normal";
                };
              }
            ];
          }
          {
            pane._children = [
              {
                bind = {
                  _args = [ "left" ];
                  MoveFocus = "left";
                };
              }
              {
                bind = {
                  _args = [ "down" ];
                  MoveFocus = "down";
                };
              }
              {
                bind = {
                  _args = [ "up" ];
                  MoveFocus = "up";
                };
              }
              {
                bind = {
                  _args = [ "right" ];
                  MoveFocus = "right";
                };
              }
              {
                bind = {
                  _args = [ "c" ];
                  SwitchToMode = "renamepane";
                  PaneNameInput = 0;
                };
              }
              {
                bind = {
                  _args = [ "d" ];
                  NewPane = "down";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "e" ];
                  TogglePaneEmbedOrFloating = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "f" ];
                  ToggleFocusFullscreen = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "h" ];
                  MoveFocus = "left";
                };
              }
              {
                bind = {
                  _args = [ "i" ];
                  TogglePanePinned = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "j" ];
                  MoveFocus = "down";
                };
              }
              {
                bind = {
                  _args = [ "k" ];
                  MoveFocus = "up";
                };
              }
              {
                bind = {
                  _args = [ "l" ];
                  MoveFocus = "right";
                };
              }
              {
                bind = {
                  _args = [ "n" ];
                  NewPane = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "p" ];
                  SwitchToMode = "normal";
                };
              }
              {
                bind = {
                  _args = [ "r" ];
                  NewPane = "right";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "w" ];
                  ToggleFloatingPanes = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "x" ];
                  CloseFocus = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "z" ];
                  TogglePaneFrames = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "tab" ];
                  SwitchFocus = { };
                };
              }
            ];
          }
          {
            tab._children = [
              {
                bind = {
                  _args = [ "left" ];
                  GoToPreviousTab = { };
                };
              }
              {
                bind = {
                  _args = [ "down" ];
                  GoToNextTab = { };
                };
              }
              {
                bind = {
                  _args = [ "up" ];
                  GoToPreviousTab = { };
                };
              }
              {
                bind = {
                  _args = [ "right" ];
                  GoToNextTab = { };
                };
              }
              {
                bind = {
                  _args = [ "1" ];
                  GoToTab = 1;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "2" ];
                  GoToTab = 2;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "3" ];
                  GoToTab = 3;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "4" ];
                  GoToTab = 4;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "5" ];
                  GoToTab = 5;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "6" ];
                  GoToTab = 6;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "7" ];
                  GoToTab = 7;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "8" ];
                  GoToTab = 8;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "9" ];
                  GoToTab = 9;
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "[" ];
                  BreakPaneLeft = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "]" ];
                  BreakPaneRight = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "b" ];
                  BreakPane = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "h" ];
                  GoToPreviousTab = { };
                };
              }
              {
                bind = {
                  _args = [ "j" ];
                  GoToNextTab = { };
                };
              }
              {
                bind = {
                  _args = [ "k" ];
                  GoToPreviousTab = { };
                };
              }
              {
                bind = {
                  _args = [ "l" ];
                  GoToNextTab = { };
                };
              }
              {
                bind = {
                  _args = [ "n" ];
                  NewTab = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "r" ];
                  SwitchToMode = "renametab";
                  TabNameInput = 0;
                };
              }
              {
                bind = {
                  _args = [ "s" ];
                  ToggleActiveSyncTab = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "t" ];
                  SwitchToMode = "normal";
                };
              }
              {
                bind = {
                  _args = [ "x" ];
                  CloseTab = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "tab" ];
                  ToggleTab = { };
                };
              }
            ];
          }
          {
            resize._children = [
              {
                bind = {
                  _args = [ "left" ];
                  Resize = "Increase left";
                };
              }
              {
                bind = {
                  _args = [ "down" ];
                  Resize = "Increase down";
                };
              }
              {
                bind = {
                  _args = [ "up" ];
                  Resize = "Increase up";
                };
              }
              {
                bind = {
                  _args = [ "right" ];
                  Resize = "Increase right";
                };
              }
              {
                bind = {
                  _args = [ "+" ];
                  Resize = "Increase";
                };
              }
              {
                bind = {
                  _args = [ "-" ];
                  Resize = "Decrease";
                };
              }
              {
                bind = {
                  _args = [ "=" ];
                  Resize = "Increase";
                };
              }
              {
                bind = {
                  _args = [ "H" ];
                  Resize = "Decrease left";
                };
              }
              {
                bind = {
                  _args = [ "J" ];
                  Resize = "Decrease down";
                };
              }
              {
                bind = {
                  _args = [ "K" ];
                  Resize = "Decrease up";
                };
              }
              {
                bind = {
                  _args = [ "L" ];
                  Resize = "Decrease right";
                };
              }
              {
                bind = {
                  _args = [ "h" ];
                  Resize = "Increase left";
                };
              }
              {
                bind = {
                  _args = [ "j" ];
                  Resize = "Increase down";
                };
              }
              {
                bind = {
                  _args = [ "k" ];
                  Resize = "Increase up";
                };
              }
              {
                bind = {
                  _args = [ "l" ];
                  Resize = "Increase right";
                };
              }
              {
                bind = {
                  _args = [ "r" ];
                  SwitchToMode = "normal";
                };
              }
            ];
          }
          {
            move._children = [
              {
                bind = {
                  _args = [ "left" ];
                  MovePane = "left";
                };
              }
              {
                bind = {
                  _args = [ "down" ];
                  MovePane = "down";
                };
              }
              {
                bind = {
                  _args = [ "up" ];
                  MovePane = "up";
                };
              }
              {
                bind = {
                  _args = [ "right" ];
                  MovePane = "right";
                };
              }
              {
                bind = {
                  _args = [ "h" ];
                  MovePane = "left";
                };
              }
              {
                bind = {
                  _args = [ "j" ];
                  MovePane = "down";
                };
              }
              {
                bind = {
                  _args = [ "k" ];
                  MovePane = "up";
                };
              }
              {
                bind = {
                  _args = [ "l" ];
                  MovePane = "right";
                };
              }
              {
                bind = {
                  _args = [ "m" ];
                  SwitchToMode = "normal";
                };
              }
              {
                bind = {
                  _args = [ "n" ];
                  MovePane = { };
                };
              }
              {
                bind = {
                  _args = [ "p" ];
                  MovePaneBackwards = { };
                };
              }
              {
                bind = {
                  _args = [ "tab" ];
                  MovePane = { };
                };
              }
            ];
          }
          {
            scroll._children = [
              {
                bind = {
                  _args = [ "Alt left" ];
                  MoveFocusOrTab = "left";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "Alt down" ];
                  MoveFocus = "down";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "Alt up" ];
                  MoveFocus = "up";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "Alt right" ];
                  MoveFocusOrTab = "right";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "e" ];
                  EditScrollback = { };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "f" ];
                  SwitchToMode = "entersearch";
                  SearchInput = 0;
                };
              }
              {
                bind = {
                  _args = [ "Alt h" ];
                  MoveFocusOrTab = "left";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "Alt j" ];
                  MoveFocus = "down";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "Alt k" ];
                  MoveFocus = "up";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "Alt l" ];
                  MoveFocusOrTab = "right";
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "s" ];
                  SwitchToMode = "normal";
                };
              }
            ];
          }
          {
            search._children = [
              {
                bind = {
                  _args = [ "c" ];
                  SearchToggleOption = "CaseSensitivity";
                };
              }
              {
                bind = {
                  _args = [ "n" ];
                  Search = "down";
                };
              }
              {
                bind = {
                  _args = [ "o" ];
                  SearchToggleOption = "WholeWord";
                };
              }
              {
                bind = {
                  _args = [ "p" ];
                  Search = "up";
                };
              }
              {
                bind = {
                  _args = [ "w" ];
                  SearchToggleOption = "Wrap";
                };
              }
            ];
          }
          {
            session._children = [
              {
                bind = {
                  _args = [ "a" ];
                  LaunchOrFocusPlugin = {
                    _args = [ "zellij:about" ];
                    floating = true;
                    move_to_focused_tab = true;
                  };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "c" ];
                  LaunchOrFocusPlugin = {
                    _args = [ "configuration" ];
                    floating = true;
                    move_to_focused_tab = true;
                  };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "d" ];
                  Detach = { };
                };
              }
              {
                bind = {
                  _args = [ "o" ];
                  SwitchToMode = "normal";
                };
              }
              {
                bind = {
                  _args = [ "p" ];
                  LaunchOrFocusPlugin = {
                    _args = [ "plugin-manager" ];
                    floating = true;
                    move_to_focused_tab = true;
                  };
                  SwitchToMode = "locked";
                };
              }
              {
                bind = {
                  _args = [ "w" ];
                  LaunchOrFocusPlugin = {
                    _args = [ "session-manager" ];
                    floating = true;
                    move_to_focused_tab = true;
                  };
                  SwitchToMode = "locked";
                };
              }
            ];
          }
          {
            shared_among = {
              _args = [
                "normal"
                "locked"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "Alt left" ];
                    MoveFocusOrTab = "left";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt down" ];
                    MoveFocus = "down";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt up" ];
                    MoveFocus = "up";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt right" ];
                    MoveFocusOrTab = "right";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt +" ];
                    Resize = "Increase";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt -" ];
                    Resize = "Decrease";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt =" ];
                    Resize = "Increase";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt [" ];
                    PreviousSwapLayout = { };
                  };
                }
                {
                  bind = {
                    _args = [ "Alt ]" ];
                    NextSwapLayout = { };
                  };
                }
                {
                  bind = {
                    _args = [ "Alt f" ];
                    ToggleFloatingPanes = { };
                  };
                }
                {
                  bind = {
                    _args = [ "Alt h" ];
                    MoveFocusOrTab = "left";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt i" ];
                    MoveTab = "left";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt j" ];
                    MoveFocus = "down";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt k" ];
                    MoveFocus = "up";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt l" ];
                    MoveFocusOrTab = "right";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt n" ];
                    NewPane = { };
                  };
                }
                {
                  bind = {
                    _args = [ "Alt o" ];
                    MoveTab = "right";
                  };
                }
                {
                  bind = {
                    _args = [ "Alt c" ];
                    Copy = { };
                  };
                }
              ];
            };
          }
          {
            shared_except = {
              _args = [
                "locked"
                "renametab"
                "renamepane"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "Ctrl g" ];
                    SwitchToMode = "locked";
                  };
                }
                {
                  bind = {
                    _args = [ "q" ];
                    Quit = { };
                  };
                }
              ];
            };
          }
          {
            shared_except = {
              _args = [
                "locked"
                "entersearch"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "enter" ];
                    SwitchToMode = "locked";
                  };
                }
              ];
            };
          }
          {
            shared_except = {
              _args = [
                "locked"
                "entersearch"
                "renametab"
                "renamepane"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "esc" ];
                    SwitchToMode = "locked";
                  };
                }
              ];
            };
          }
          {
            shared_except = {
              _args = [
                "locked"
                "entersearch"
                "renametab"
                "renamepane"
                "move"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "m" ];
                    SwitchToMode = "move";
                  };
                }
              ];
            };
          }
          {
            shared_except = {
              _args = [
                "locked"
                "entersearch"
                "search"
                "renametab"
                "renamepane"
                "session"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "o" ];
                    SwitchToMode = "session";
                  };
                }
              ];
            };
          }
          {
            shared_except = {
              _args = [
                "locked"
                "tab"
                "entersearch"
                "renametab"
                "renamepane"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "t" ];
                    SwitchToMode = "tab";
                  };
                }
              ];
            };
          }
          {
            shared_except = {
              _args = [
                "locked"
                "tab"
                "scroll"
                "entersearch"
                "renametab"
                "renamepane"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "s" ];
                    SwitchToMode = "scroll";
                  };
                }
              ];
            };
          }
          {
            shared_among = {
              _args = [
                "normal"
                "resize"
                "tab"
                "scroll"
                "prompt"
                "tmux"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "p" ];
                    SwitchToMode = "pane";
                  };
                }
              ];
            };
          }
          {
            shared_except = {
              _args = [
                "locked"
                "resize"
                "pane"
                "tab"
                "entersearch"
                "renametab"
                "renamepane"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "r" ];
                    SwitchToMode = "resize";
                  };
                }
              ];
            };
          }
          {
            shared_among = {
              _args = [
                "scroll"
                "search"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "PageDown" ];
                    PageScrollDown = { };
                  };
                }
                {
                  bind = {
                    _args = [ "PageUp" ];
                    PageScrollUp = { };
                  };
                }
                {
                  bind = {
                    _args = [ "left" ];
                    PageScrollUp = { };
                  };
                }
                {
                  bind = {
                    _args = [ "down" ];
                    ScrollDown = { };
                  };
                }
                {
                  bind = {
                    _args = [ "up" ];
                    ScrollUp = { };
                  };
                }
                {
                  bind = {
                    _args = [ "right" ];
                    PageScrollDown = { };
                  };
                }
                {
                  bind = {
                    _args = [ "Ctrl b" ];
                    PageScrollUp = { };
                  };
                }
                {
                  bind = {
                    _args = [ "Ctrl c" ];
                    ScrollToBottom = { };
                    SwitchToMode = "locked";
                  };
                }
                {
                  bind = {
                    _args = [ "d" ];
                    HalfPageScrollDown = { };
                  };
                }
                {
                  bind = {
                    _args = [ "Ctrl f" ];
                    PageScrollDown = { };
                  };
                }
                {
                  bind = {
                    _args = [ "h" ];
                    PageScrollUp = { };
                  };
                }
                {
                  bind = {
                    _args = [ "j" ];
                    ScrollDown = { };
                  };
                }
                {
                  bind = {
                    _args = [ "k" ];
                    ScrollUp = { };
                  };
                }
                {
                  bind = {
                    _args = [ "l" ];
                    PageScrollDown = { };
                  };
                }
                {
                  bind = {
                    _args = [ "u" ];
                    HalfPageScrollUp = { };
                  };
                }
                {
                  bind = {
                    _args = [ "Alt c" ];
                    Copy = { };
                  };
                }
              ];
            };
          }
          {
            entersearch._children = [
              {
                bind = {
                  _args = [ "Ctrl c" ];
                  SwitchToMode = "scroll";
                };
              }
              {
                bind = {
                  _args = [ "esc" ];
                  SwitchToMode = "scroll";
                };
              }
              {
                bind = {
                  _args = [ "enter" ];
                  SwitchToMode = "search";
                };
              }
            ];
          }
          {
            renametab._children = [
              {
                bind = {
                  _args = [ "esc" ];
                  UndoRenameTab = { };
                  SwitchToMode = "tab";
                };
              }
            ];
          }
          {
            shared_among = {
              _args = [
                "renametab"
                "renamepane"
              ];
              _children = [
                {
                  bind = {
                    _args = [ "Ctrl c" ];
                    SwitchToMode = "locked";
                  };
                }
              ];
            };
          }
          {
            renamepane._children = [
              {
                bind = {
                  _args = [ "esc" ];
                  UndoRenamePane = { };
                  SwitchToMode = "pane";
                };
              }
            ];
          }
        ];
      };
    };
  };
}
